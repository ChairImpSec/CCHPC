from model.graph.instance import Instance
from typing import TYPE_CHECKING

from config.main import Config
from model.graph.types.instance_type import InstanceType
if TYPE_CHECKING:
    from modules.frontToBack.model.state import State


class f2bInstance:
    def __init__(self, state: "State", instance: "Instance"):
        self.instance = instance
        self.main_node = state.graph.add_vertex()
        self.reg_node = None
        self.reg_dr_node = None
        self.state = state

        self.state.vertex_names.set_name(self.main_node, f"main-{instance.name}")

        if instance.type == InstanceType.NON_LINEAR:
            sink_edge = state.graph.add_edge(self.main_node, state.target)
            self.state.edge_names.set_name(sink_edge, f"sink-{instance.name}")
            self.state.infinity_cost_edges.append(sink_edge)

            rev_edge = state.graph.add_edge(state.target, self.main_node)
            state.edge_names.set_name(rev_edge, f"rev-{instance.name}")
            self.state.infinity_cost_edges.append(rev_edge)
            return

        register_config = Config.get_config()["register"]
        sr_register_cost = register_config["cost"]["single_rail"] * len(instance.outputs)
        dr_register_extra_cost = (register_config["cost"]["dual_rail"] - register_config["cost"]["single_rail"]) * len(instance.outputs)
        assert dr_register_extra_cost >= 0, "[f2bInstance] Dual-rail register cost must not be lower than single-rail register cost"

        # Single-Rail register node: Needed at least for all instances (If all are single rail)
        self.reg_node = state.graph.add_vertex()
        self.state.vertex_names.set_name(self.reg_node, f"reg-{instance.name}")
        reg_edge = state.graph.add_edge(self.main_node, self.reg_node)
        self.state.edge_names.set_name(reg_edge, f"REG-{instance.name}")
        self.state.costs.set_cost(reg_edge, sr_register_cost)
        self.state.infinity_cost += sr_register_cost

        rev_edge = state.graph.add_edge(self.reg_node, self.main_node)
        state.edge_names.set_name(rev_edge, f"rev-{instance.name}")
        self.state.infinity_cost_edges.append(rev_edge)

        # Dual Rail register node: Needs to be cut if the register requires dual rail output
        # Incurs the difference cost to upgrade the single rail register to a dual rail register
        self.reg_dr_node = state.graph.add_vertex()
        self.state.vertex_names.set_name(self.reg_dr_node, f"regDR-{instance.name}")
        reg_dr_edge = state.graph.add_edge(self.main_node, self.reg_dr_node)
        self.state.edge_names.set_name(reg_dr_edge, f"REGDR-{instance.name}")
        self.state.costs.set_cost(reg_dr_edge, dr_register_extra_cost)
        self.state.infinity_cost += dr_register_extra_cost

        rev_dr_edge = state.graph.add_edge(self.reg_dr_node, self.main_node)
        state.edge_names.set_name(rev_dr_edge, f"rev-dr-{instance.name}")
        self.state.infinity_cost_edges.append(rev_dr_edge)

        # If theres not a full NL stage there is apossibility that already optimized instances are included here. These incur no cost even behind a register because they are already optimized by BackToFront so we skip the cost edge for them
        if not instance.optimized:
            cost_difference = instance.cost["dual_rail"] - instance.cost["single_rail"]
            cost_reversed = cost_difference < 0;
            cost_difference = abs(cost_difference);

            dr_cost_edge = state.graph.add_edge(state.source, self.main_node) if not cost_reversed else state.graph.add_edge(self.main_node, state.target)
            self.state.edge_names.set_name(dr_cost_edge, f"DR-{instance.name}")
            self.state.costs.set_cost(dr_cost_edge, cost_difference)
            self.state.infinity_cost += cost_difference
