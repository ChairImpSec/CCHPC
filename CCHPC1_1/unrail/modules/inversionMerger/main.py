from model.graph.main import Graph
from model.graph.types.instance_type import InstanceType
from model.graph.types.wire_type import WireType

class InversionMerger:
    @staticmethod
    def run(graph: "Graph") -> None:
        inversions = graph.get_instance_by_type(InstanceType.INVERSION);

        for inversion in inversions:
            outputs = inversion.get_outputs();
            inputs = inversion.get_inputs();
            assert len(outputs) == 1, f"[InversionMerger] Inversion {inversion.name} has {len(outputs)} outputs, expected 1";
            assert len(inputs) == 1, f"[InversionMerger] Inversion {inversion.name} has {len(inputs)} inputs, expected 1";
            output = outputs[0];
            input = inputs[0];

            # 1. Handle inversions that only have succeeding gadgets (Thus are not connected to an output wire)
            if output.type != WireType.OUTPUT:
                for succeeding_gadget in output.to_instances:
                    if inversion.get_config("INV") == "1'b0":
                        succeeding_gadget.invert_wire(output);

                    succeeding_gadget.replace_wire(output, input);

                    input.add_to(succeeding_gadget);

                input.remove_to(inversion);
                graph.remove_wire(output);
                graph.remove_instance(inversion);

                continue;

            # 2. Handle inversions that are connected to an output wire (so there could be a succeeding gadget but there is also a direct connection to the output so we cannot merge downwards)
            if output.type == WireType.OUTPUT:
                preceeding_gadget = input.from_instance;

                if input.type == WireType.OUTPUT and inversion.get_config("INV") == "1'b0":
                    # This is unsupported because when we invert the output of the preceeding gadget we need to invert the output wire parallel of the inversion again to keep the signal correct
                    # As we can only invert gadgets, not output wires, we cannot achieve the correct signal on the parallel output wire anymore and thus skip this case

                    print(f"[InversionMerger] Inversion {inversion.name} is connected in between two output wires. This is not supported for the inversion merger and the inversion will stay in the graph");
                    continue;

                if inversion.get_config("INV") == "1'b0":
                    preceeding_gadget.invert_wire(input);

                    for parallel_instance in input.to_instances:
                        if parallel_instance != inversion:
                            parallel_instance.invert_wire(input);

                for parallel_instance in input.to_instances:
                    if parallel_instance != inversion:
                        parallel_instance.replace_wire(input, output);
                        output.add_to(parallel_instance);

                preceeding_gadget.replace_wire(input, output);
                output.set_from(preceeding_gadget);
                graph.remove_wire(input);
                graph.remove_instance(inversion);
                continue;
