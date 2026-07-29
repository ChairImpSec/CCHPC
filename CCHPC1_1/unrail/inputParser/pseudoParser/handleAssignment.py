from model.graph.instance import Instance
from model.graph.types.instance_type import InstanceType
from model.graph.main import Graph
from model.graph.types.wire_type import WireType
from config.main import Config

def handle_assignment(line_number: int, graph: "Graph", out: str | None, lhs: str | None, operator: str | None, rhs: str | None, input_names: list[str], output_names: list[str]) -> None:
    out = out if out != "" else None;
    lhs = lhs if lhs != "" else None;
    operator = operator if operator != "" else None;
    rhs = rhs if rhs != "" else None;

    if out is None or operator is None or rhs is None:
        raise ValueError(f"[PseudoParser]#{line_number} Invalid assignment: {out} = {lhs + " " if lhs is not None else ""}{operator} {rhs}");

    if lhs is None and operator != "~":
        raise ValueError(f"[PseudoParser]#{line_number} Invalid assignment: {out} = {lhs} {operator} {rhs}");

    out_wire = graph.ensure_wire(out, _get_wire_type(out, input_names, output_names))
    lhs_wire = graph.ensure_wire(lhs, _get_wire_type(lhs, input_names, output_names)) if lhs is not None else None;
    rhs_wire = graph.ensure_wire(rhs, _get_wire_type(rhs, input_names, output_names))

    config = Config.get_config();

    instance: Instance | None = None;
    match operator.lower():
        case "^":
            module_name = config.get_module_name("XOR")
            instance = Instance(f"l_{line_number}_xor", module_name)
        case "~^":
            module_name = config.get_module_name("XNOR")
            instance = Instance(f"l_{line_number}_xnor", module_name)
        case "&":
            module_name = config.get_module_name("AND")
            instance = Instance(f"l_{line_number}_and", module_name)
        case "~&":
            module_name = config.get_module_name("NAND")
            instance = Instance(f"l_{line_number}_nand", module_name)
        case "|":
            module_name = config.get_module_name("OR")
            instance = Instance(f"l_{line_number}_or", module_name)
        case "~|":
            module_name = config.get_module_name("NOR")
            instance = Instance(f"l_{line_number}_nor", module_name)
        case "~":
            module_name = config.get_module_name("NOT")
            instance = Instance(f"l_{line_number}_not", module_name)

    if instance is None:
        raise ValueError(f"[PseudoParser]#{line_number} Invalid operator: {operator}");

    instance.set_wire("z", out_wire);
    instance.set_wire("a", lhs_wire if lhs is not None else rhs_wire);
    if lhs is not None:
        instance.set_wire("b", rhs_wire);

    graph.add_instance(instance);

    out_wire.set_from(instance);
    if lhs is not None:
        lhs_wire.add_to(instance);
    rhs_wire.add_to(instance);

def _get_wire_type(name: str, input_names: list[str], output_names: list[str]) -> WireType:
    base_name, _ = Graph.get_wire_composition(name);
    if base_name in input_names:
        return WireType.INPUT;
    if base_name in output_names:
        return WireType.OUTPUT;
    return WireType.INTERNAL;