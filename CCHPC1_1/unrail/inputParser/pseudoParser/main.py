import os
import re
from inputParser.pseudoParser.handleAssignment import handle_assignment
from model.graph.main import Graph
from model.graph.types.wire_type import WireType

def parse_pseudo_file(file_path: str) -> "Graph":
    graph = Graph();
    input_names: list[str] = [];
    output_names: list[str] = [];

    # Parse the file and build the graph accordingly
    with open(file_path, 'r') as file:
        assignment_parsed = False;
        line_number = 0;
        for line in file:
            line_number += 1;
            line = line.strip();
            lower_line = line.lower();

            # Remove empty lines
            if line == "":
                continue;

            # Remove comments
            if line.startswith("#"):
                continue;

            # Parse input definitions
            if lower_line.startswith("input"):
                if assignment_parsed:
                    raise ValueError(f"[PseudoParser]#{line_number} Input definitions must be before assignment statements");
                [name, input_type] = line.split(" ")[1:];
                match input_type.lower():
                    # Inputs that contain data
                    case "data":
                        if name not in input_names:
                            input_names.append(name);
                            graph.ensure_wire(name, WireType.INPUT);

                    # Singular input for clock signals
                    case "clock":
                        if graph.clock_wire is None or graph.clock_wire == name:
                            graph.clock_wire = name;
                        else:
                            raise ValueError(f"[PseudoParser]#{line_number} Multiple clock wires found: {graph.clock_wire} and {name}");
                    
                    # Singular input for precharge signals
                    case "precharge":
                        if graph.precharge_wire is None or graph.precharge_wire == name:
                            graph.precharge_wire = name;
                        else:
                            raise ValueError(f"[PseudoParser]#{line_number} Multiple precharge wires found: {graph.precharge_wire} and {name}");

                    # Singular input for randomness signals
                    case "randomness":
                        if graph.randomness_wire is None or graph.randomness_wire == name:
                            graph.randomness_wire = name;
                        else:
                            raise ValueError(f"[PseudoParser]#{line_number} Multiple randomness wires found: {graph.randomness_wire} and {name}");

                    # Invalid input type
                    case _:
                        raise ValueError(f"[PseudoParser]#{line_number} Invalid input type: {input_type}");
                continue;

            # Parse output definitions
            if lower_line.startswith("output"):
                if assignment_parsed:
                    raise ValueError(f"[PseudoParser]#{line_number} Output definitions must be before assignment statements");
                [name, output_type] = line.split(" ")[1:];
                match output_type.lower():
                    # Outputs that contain data
                    case "data":
                        if name not in output_names:
                            output_names.append(name);
                            graph.ensure_wire(name, WireType.OUTPUT);

                    # Invalid output type
                    case _:
                        raise ValueError(f"[PseudoParser]#{line_number} Invalid output type: {output_type}");
                continue;

            # Parse assignment statements
            match = re.match(r"^([\w_\-\d\[\]]+)\s*=\s*([\w_\-\d\[\]]*)\s*([\^~&|]+)\s*([\w_\-\d\[\]]+)$", line);
            if match:
                if not assignment_parsed:
                    errors: list[str] = [];
                    for name in input_names:
                        if name in output_names:
                            errors.append(f"[PseudoParser] Wire {name} is defined as an input and output");

                    if len(errors) > 0:
                        for error in errors:
                            print(error);
                        raise ValueError(f"[PseudoParser] Parsing of file {file_path} failed");

                assignment_parsed = True;
                [out, lhs, operator, rhs] = match.groups(default=None);
                handle_assignment(line_number, graph, out , lhs, operator, rhs, input_names, output_names);
                continue;

            # Invalid line
            raise ValueError(f"[PseudoParser]#{line_number} Invalid line: {line}");

    # Validate the graph
    errors: list[str] = [];
    if not graph.check(False, True):
        errors.append("[PseudoParser] Graph is invalid")

    unused_input_names = input_names.copy();
    input_wires_and_vectors = graph.get_wires_and_vectors_by_type(WireType.INPUT);
    for wire_or_vector in input_wires_and_vectors:
        if wire_or_vector.name not in unused_input_names:
            errors.append(f"[PseudoParser] Graph has input wire or vector {wire_or_vector.name} that is not defined in the input section")
        else:
            unused_input_names.remove(wire_or_vector.name);
    if len(unused_input_names) > 0:
        errors.append(f"[PseudoParser] Graph has input wires or vectors {", ".join(unused_input_names)} that are not used in the graph")

    unused_output_names = output_names.copy();
    output_wires_and_vectors = graph.get_wires_and_vectors_by_type(WireType.OUTPUT);
    for wire_or_vector in output_wires_and_vectors:
        if wire_or_vector.name not in unused_output_names:
            errors.append(f"[PseudoParser] Graph has output wire or vector {wire_or_vector.name} that is not defined in the output section")
        else:
            unused_output_names.remove(wire_or_vector.name);
    if len(unused_output_names) > 0:
        errors.append(f"[PseudoParser] Graph has output wires or vectors {", ".join(unused_output_names)} that are not used in the graph")

    if len(errors) > 0:
        for error in errors:
            print(error);
        raise ValueError(f"[PseudoParser] Parsing of file {file_path} failed");

    return graph;