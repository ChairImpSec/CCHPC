from graph_tool.all import Edge, EdgePropertyMap, Graph

class EdgeNames:
    def __init__(self, graph: Graph):
        self.names: EdgePropertyMap = graph.new_edge_property("string")

    def get_name(self, edge: Edge) -> str | None:
        return self.names[edge]

    def set_name(self, edge: Edge, name: str) -> None:
        self.names[edge] = name