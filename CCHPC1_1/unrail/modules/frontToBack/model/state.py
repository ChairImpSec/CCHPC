from graph_tool import Edge, VertexPropertyMap
from graph_tool.all import Graph
from numpy import inf
from modules.frontToBack.model.cost import Costs
from modules.frontToBack.model.vertexName import VertexNames
from modules.frontToBack.model.edgeName import EdgeNames
from modules.frontToBack.wrapper.instance import f2bInstance
from model.graph.instance import Instance
from model.graph.wire import Wire
from modules.frontToBack.wrapper.wire import f2bInputWire

class State:
    def __init__(self, graph: Graph):
        self.graph = graph
        self.costs = Costs(graph)
        self.vertex_names = VertexNames(graph)
        self.edge_names = EdgeNames(graph)
        self.source = graph.add_vertex()
        self.target = graph.add_vertex()
        self.nodes: dict[Instance, f2bInstance] = {}
        self.input_wires: dict[Wire, f2bInputWire] = {}
        self.infinity_cost = 0
        self.infinity_cost_edges = list[Edge]()

    def get_node(self, instance: Instance) -> f2bInstance:
        node = self.nodes.get(instance, None)
        if node is None:
            node = f2bInstance(self, instance)
            self.nodes[instance] = node

        return node

    def get_input_wire(self, wire: Wire) -> f2bInputWire:
        input_wire = self.input_wires.get(wire, None)
        if input_wire is None:
            input_wire = f2bInputWire(self, wire)
            self.input_wires[wire] = input_wire

        return input_wire

    def get_registered_instances(self, partition: VertexPropertyMap) -> list[Instance]:
        return [f2b_instance.instance for f2b_instance in self.nodes.values() if f2b_instance.reg_node is not None and partition[f2b_instance.main_node] == True and partition[f2b_instance.reg_node] == False];

    def get_registered_input_wires(self, partition: VertexPropertyMap) -> list[Wire]:
        return [f2b_wire.wire for f2b_wire in self.input_wires.values() if partition[f2b_wire.main_node] == True and partition[f2b_wire.reg_node] == False]

    def get_optimized_instances(self, partition: VertexPropertyMap) -> list[Instance]:
        return [f2b_instance.instance for f2b_instance in self.nodes.values() if partition[f2b_instance.main_node] == True]

    def set_infinity_cost(self) -> None:
        self.infinity_cost = int(self.infinity_cost) + 1
        # self.infinity_cost = 10_000_001_900
        for edge in self.infinity_cost_edges:
            self.costs.set_cost(edge, self.infinity_cost)