from graph_tool.all import Vertex, VertexPropertyMap, Graph

class VertexNames:
    def __init__(self, graph: Graph):
        self.names: VertexPropertyMap = graph.new_vertex_property("string")

    def get_name(self, vertex: Vertex) -> str | None:
        return self.names[vertex]

    def set_name(self, vertex: Vertex, name: str) -> None:
        self.names[vertex] = name