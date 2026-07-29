from graph_tool.all import Edge, EdgePropertyMap, Graph

class Costs:
    def __init__(self, graph: Graph):
        self.costs: EdgePropertyMap = graph.new_edge_property("double")

    def get_cost(self, edge: Edge) -> float | None:
        return self.costs[edge]

    def set_cost(self, edge: Edge, cost: float) -> None:
        self.costs[edge] = cost