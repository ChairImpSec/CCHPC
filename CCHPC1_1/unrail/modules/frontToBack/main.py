import os
from numpy import inf
from typing import TYPE_CHECKING
from graph_tool.all import Graph, arf_layout, boykov_kolmogorov_max_flow, fruchterman_reingold_layout, graph_draw, min_st_cut, sfdp_layout

from modules.frontToBack.model.state import State
from model.graph.types.wire_type import WireType
from model.graph.instance import Instance
from model.graph.types.instance_type import InstanceType
from args import get_args

if TYPE_CHECKING:
    from model.graph.main import Graph

class FrontToBack:
    @staticmethod
    def _requires_dual_rail(instance: "Instance") -> bool:
        # If we require dual rail we need to add the instance to the dual rail register requirement node
        return instance.type == InstanceType.NON_LINEAR or not instance.optimized

    @staticmethod
    def run(graph: "Graph") -> None:
        args = get_args()

        # Initialization of the network graph
        g = Graph()
        state = State(g)

        input_wires = graph.get_wire_by_type(WireType.INPUT)
        open_instances: set[Instance] = set()
        to_traverse: list[Instance] = []
        for input_wire in input_wires:
            f2b_input_wire = state.get_input_wire(input_wire)
            for instance in input_wire.to_instances:
                f2b_instance = state.get_node(instance)
                rev_edge = g.add_edge(f2b_instance.main_node, f2b_input_wire.main_node)
                reg_edge = g.add_edge(f2b_input_wire.reg_node, f2b_instance.main_node)
                state.edge_names.set_name(rev_edge, f"rev-wire-{input_wire.name}-{instance.name}")
                state.edge_names.set_name(reg_edge, f"reg-wire-{input_wire.name}-{instance.name}")
                state.infinity_cost_edges.append(rev_edge)
                state.infinity_cost_edges.append(reg_edge)
                if FrontToBack._requires_dual_rail(instance):
                    # The instance requires dual rail input so if we cut before this node we conect it to the dual rail requirement register node
                    reg_dr_edge = g.add_edge(f2b_input_wire.reg_dr_node, f2b_instance.main_node)
                    state.edge_names.set_name(reg_dr_edge, f"reg-dr-wire-{input_wire.name}-{instance.name}")
                    state.infinity_cost_edges.append(reg_dr_edge)
                if instance.type != InstanceType.NON_LINEAR:
                    open_instances.add(instance)
                    to_traverse.append(instance)

        while len(to_traverse) > 0:
            instance = to_traverse.pop(0)

            for output_wire in instance.get_outputs():
                for to_instance in output_wire.to_instances:
                    if to_instance.type != InstanceType.NON_LINEAR and to_instance not in open_instances:
                        open_instances.add(to_instance)
                        to_traverse.append(to_instance)

        for instance in open_instances:
            f2b_instance = state.get_node(instance)

            # If instances have preceding NL-gadgets we end the circuit (even if they are linear) and treat them like NL instances
            for input_wire in instance.get_inputs():
                from_instance = input_wire.from_instance
                if from_instance is not None and (from_instance.type == InstanceType.NON_LINEAR or from_instance not in open_instances):
                    sink_edge = g.add_edge(f2b_instance.main_node, state.target)
                    sink_rev_edge = g.add_edge(state.target, f2b_instance.main_node)
                    state.edge_names.set_name(sink_edge, f"post-{instance.name}")
                    state.edge_names.set_name(sink_rev_edge, f"post-rev-{instance.name}")
                    state.infinity_cost_edges.append(sink_edge)
                    state.infinity_cost_edges.append(sink_rev_edge)
                    break

            for output_wire in instance.get_outputs():
                # If there is not a full NL-stage we might include output wires in the graph
                # Output wires must have a register before them to fulfill the register stage requirement so we treat them like NL-gates
                if output_wire.type == WireType.OUTPUT:
                    sink_edge = g.add_edge(f2b_instance.reg_node, state.target)
                    state.edge_names.set_name(sink_edge, f"sink-out-{instance.name}-{output_wire.name}")
                    state.infinity_cost_edges.append(sink_edge)
                    if args.disable_b2f:
                        # In this case the output stays dual-rail so we connect it to the dual-rail requirement register node
                        sink_dr_edge = g.add_edge(f2b_instance.reg_dr_node, state.target)
                        state.edge_names.set_name(sink_dr_edge, f"sink-out-dr-{instance.name}-{output_wire.name}")
                        state.infinity_cost_edges.append(sink_dr_edge)

                for to_instance in output_wire.to_instances:
                    f2b_to_instance = state.get_node(to_instance)
                    rev_edge = g.add_edge(f2b_to_instance.main_node, f2b_instance.main_node)
                    reg_edge = g.add_edge(f2b_instance.reg_node, f2b_to_instance.main_node)
                    state.edge_names.set_name(rev_edge, f"rev-wire-{instance.name}-{output_wire.name}-{to_instance.name}")
                    state.edge_names.set_name(reg_edge, f"reg-wire-{instance.name}-{output_wire.name}-{to_instance.name}")
                    state.infinity_cost_edges.append(rev_edge)
                    state.infinity_cost_edges.append(reg_edge)
                    if FrontToBack._requires_dual_rail(to_instance):
                        reg_dr_edge = g.add_edge(f2b_instance.reg_dr_node, f2b_to_instance.main_node)
                        state.edge_names.set_name(reg_dr_edge, f"reg-dr-wire-{instance.name}-{output_wire.name}-{to_instance.name}")
                        state.infinity_cost_edges.append(reg_dr_edge)

        state.set_infinity_cost()

        # Minimum cut algorithm
        residual = boykov_kolmogorov_max_flow(g=g, source=state.source, target=state.target, capacity=state.costs.costs)
        partition = min_st_cut(g=g, source=state.source, capacity=state.costs.costs, residual=residual)

        registered_instances = state.get_registered_instances(partition)
        registered_input_wires = state.get_registered_input_wires(partition)
        optimized_instances = state.get_optimized_instances(partition)

        cut_cost = 0
        for e in g.edges():
            if partition[e.source()] and not partition[e.target()]:
                cut_cost += state.costs.get_cost(e)
        print(f"Cut cost: {cut_cost}")
        print(f"Infinity cost: {state.infinity_cost}")
        print(f"Max Flow: {sum(residual[e] for e in state.target.in_edges())}")


        if args.debug_f2b:
            vprop_label = g.new_vertex_property("string")
            for v in g.vertices():
                name = state.vertex_names.get_name(v)
                vprop_label[v] = name

            eprop_label = g.new_edge_property("string")
            for e in g.edges():
                name = state.edge_names.get_name(e) + " " + str(float(state.costs.get_cost(e)))
                eprop_label[e] = name

            vprop_color = g.new_vertex_property("vector<float>")
            for v in g.vertices():
                if not partition[v]:
                    vprop_color[v] = [0, 0, 0, 1]
                else:
                    vprop_color[v] = [0, 0.6, 0, 1]

            eprop_color = g.new_edge_property("vector<float>")
            for e in g.edges():
                cost = float(state.costs.get_cost(e))
                if cost == float(state.infinity_cost):
                    eprop_color[e] = [1, 0, 0, 1]
                else:
                    eprop_color[e] = [0, 0, 0, 1]

            pos = arf_layout(g)

            graph_draw(
                g,
                vertex_text=vprop_label,
                edge_text=eprop_label,
                pos=pos,
                vertex_fill_color=vprop_color,
                edge_color=eprop_color,
                output_size=(1920, 1080),
                bg_color=[1, 1, 1, 1],
                fit_view=10
            )

        # Apply the partition to the graph
        optimized_instances_set = set(optimized_instances)
        for instance in optimized_instances:
            instance.optimize();

        for instance in registered_instances:
            for output_wire in instance.get_outputs():
                intermediate_wire = graph.ensure_wire(f"unrail_f2b_wire_{graph.get_unique_id()}", WireType.INTERNAL);
                register = Instance(name=f"unrail_f2b_register_{graph.get_unique_id()}", module_name="REGISTER");
                graph.add_instance(register);
                register.set_wire(register.config["input"], intermediate_wire);
                register.set_wire(register.config["output"], output_wire);
                instance.replace_wire(output_wire, intermediate_wire);
                output_wire.set_from(register);
                intermediate_wire.set_from(instance);
                intermediate_wire.add_to(register);

                for to_instance in output_wire.to_instances.copy():
                    if to_instance in optimized_instances_set:
                        to_instance.replace_wire(output_wire, intermediate_wire)
                        intermediate_wire.add_to(to_instance)
                        output_wire.remove_to(to_instance)

                # If we only have single rail instances succeeding this instance we can optimize the register to a single rail register
                requires_dual_rail = any(FrontToBack._requires_dual_rail(to_instance) for to_instance in output_wire.to_instances);
                if output_wire.type == WireType.OUTPUT and args.disable_b2f:
                    requires_dual_rail = True;
                if not requires_dual_rail:
                    register.optimize();

        for wire in registered_input_wires:
            intermediate_wire = graph.ensure_wire(f"unrail_f2b_wire_{graph.get_unique_id()}", WireType.INTERNAL);
            register = Instance(name=f"unrail_f2b_register_{graph.get_unique_id()}", module_name="REGISTER");
            graph.add_instance(register);
            register.set_wire(register.config["input"], wire);
            register.set_wire(register.config["output"], intermediate_wire);

            intermediate_wire.set_from(register);
            for instance in wire.to_instances.copy():
                if instance in optimized_instances_set:
                    continue;
                instance.replace_wire(wire, intermediate_wire);
                intermediate_wire.add_to(instance);
                wire.remove_to(instance);

            wire.add_to(register);

            if not any(FrontToBack._requires_dual_rail(instance) for instance in intermediate_wire.to_instances):
                register.optimize();