from typing import TYPE_CHECKING
import os
import graphviz

from model.graph.types.instance_type import InstanceType
from model.graph.types.wire_type import WireType

if TYPE_CHECKING:
    from model.graph.main import Graph
    from model.graph.instance import Instance

class GraphVisualizer:
    @staticmethod
    def run(graph: "Graph", output_file_path: str):
        g = graphviz.Digraph(graph_attr={"splines": "ortho"})

        for instance in graph.instances.values():
            border_color = GraphVisualizer.__get_node_border_color(instance)
            border_width = GraphVisualizer.__get_node_border_width(instance)
            fill_color = GraphVisualizer.__get_node_fill_color(instance)
            name = GraphVisualizer.__get_node_name(instance)
            
            g.node(instance.name, name, fillcolor=fill_color, color=border_color, style="filled", penwidth=border_width)

        io_node_id = 0
        for wire in graph.wires.values():
            from_id = wire.from_instance.name if wire.type != WireType.INPUT else f"SRC{io_node_id}"
            if wire.type == WireType.INPUT:
                g.node(f"SRC{io_node_id}", label=f"INPUT {wire.name}", shape="point", width="0.05", height="0.05")
                io_node_id += 1

            if wire.type == WireType.OUTPUT:
                g.node(f"DST{io_node_id}", label=f"OUTPUT {wire.name}", shape="point", widht="0.05", height="0.05")
                g.edge(from_id, f"DST{io_node_id}")
                io_node_id += 1

            for instance in wire.to_instances:
                color = GraphVisualizer.__get_edge_color(instance)
                g.edge(from_id, instance.name, color=color)

        g.render(os.path.basename(output_file_path), directory=os.path.dirname(output_file_path), format="pdf", view=False, cleanup=True)
            

    @staticmethod
    def __get_node_border_color(instance: "Instance"):
        if instance.optimized:
            return "#83f409"

        if instance.type == InstanceType.REGISTER and instance.get_config("INV") == "1'b1":
            return "#db3320"

        return "black"

    @staticmethod
    def __get_node_border_width(instance: "Instance"):
        if instance.optimized:
            return "3.0"

        if instance.type == InstanceType.REGISTER and instance.get_config("INV") == "1'b1":
            return "3.0"

        return "1.0"

    @staticmethod
    def __get_node_fill_color(instance: "Instance"):
        match instance.type:
            case InstanceType.LINEAR:
                return "white"
            case InstanceType.NON_LINEAR:
                return "#db9999"
            case InstanceType.REGISTER:
                return "#7caab2"
            case InstanceType.INVERSION:
                return "white"
            case InstanceType.MAPPING:
                return "#f0e442"
            case _:
                return "#f405fc"

    @staticmethod
    def __get_node_name(instance: "Instance"):
        prefix = "???"
        match instance.type:
            case InstanceType.LINEAR:
                prefix = "L"
            case InstanceType.NON_LINEAR:
                prefix = "NL"
            case InstanceType.REGISTER:
                prefix = "R"
            case InstanceType.INVERSION:
                prefix = "I"
            case InstanceType.MAPPING:
                prefix = "M"
            case _:
                prefix = "???"

        name = instance.name
        return f"{prefix} {name}".strip()

    @staticmethod
    def __get_edge_color(to_instance: "Instance"):
        match to_instance.type:
            case InstanceType.LINEAR:
                return "black"
            case InstanceType.INVERSION:
                return "black"
            case InstanceType.NON_LINEAR:
                return "#db2727"
            case InstanceType.REGISTER:
                return "#2e9eb2"
            case InstanceType.MAPPING:
                return "#b8a500"
            case _:
                return "#f405fc"