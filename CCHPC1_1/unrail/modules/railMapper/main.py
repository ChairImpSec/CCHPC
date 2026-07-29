from typing import TYPE_CHECKING
from model.graph.instance import Instance
from model.graph.types.instance_type import InstanceType
from model.graph.types.wire_type import WireType
from model.graph.wire import Wire
from args import get_args
if TYPE_CHECKING:
    from model.graph.main import Graph

class RailMapper:
    """
    Maps dual-rail wires to single-rail when a dual-rail producer feeds a single-rail consumer due to circuit optimization.
    Inserted mapping modules are zero-cost and the dual-rail wires branch into an additional single-rail wire of the correct width used by the mapping module.
    """

    @staticmethod
    def run(graph: "Graph") -> None:
        args = get_args();

        for wire in list(graph.wires.values()):
            if RailMapper._is_wire_single_rail(wire):
                continue;

            optimized_linear_to_instances = [instance for instance in wire.to_instances if instance.type in [InstanceType.LINEAR, InstanceType.INVERSION] and instance.optimized];
            force_wire_single_rail = wire.type == WireType.OUTPUT and not args.disable_b2f;

            if len(optimized_linear_to_instances) == 0 and not force_wire_single_rail:
                continue;

            if force_wire_single_rail:
                # If wire is OUTPUT wire and b2f is active, we map all incoming instances to single rail
                dualrail_wire = graph.ensure_wire(f"unrail_dr_{graph.get_unique_id()}", WireType.INTERNAL);
                from_instance = wire.from_instance;
                from_instance.replace_wire(wire, dualrail_wire);
                dualrail_wire.set_from(from_instance);

                for instance in wire.to_instances.copy():
                    if instance not in optimized_linear_to_instances:
                        instance.replace_wire(wire, dualrail_wire);
                        dualrail_wire.add_to(instance);
                        wire.remove_to(instance);

                mapping = Instance(name=f"unrail_drtsr_{graph.get_unique_id()}", module_name="MAPPING");
                graph.add_instance(mapping);
                mapping.set_wire(mapping.config["input"], dualrail_wire);
                mapping.set_wire(mapping.config["output"], wire);
                dualrail_wire.add_to(mapping);
                wire.set_from(mapping);
            else:
                # If wire stays dual-rail, we branch off to a single-rail wire and map optimized linear instances to it
                wire_name = f"{wire.name}_SR_{graph.get_unique_id()}";
                singlerail_wire = graph.ensure_wire(wire_name, WireType.INTERNAL);

                mapping = Instance(name=f"unrail_drtsr_{graph.get_unique_id()}", module_name="MAPPING");
                graph.add_instance(mapping);
                mapping.set_wire(mapping.config["input"], wire);
                mapping.set_wire(mapping.config["output"], singlerail_wire);
                wire.add_to(mapping);
                singlerail_wire.set_from(mapping);

                for instance in optimized_linear_to_instances:
                    instance.replace_wire(wire, singlerail_wire);
                    singlerail_wire.add_to(instance);
                    wire.remove_to(instance);

    @staticmethod
    def _is_wire_single_rail(wire: "Wire") -> bool:
        args = get_args();

        if wire.type == WireType.INPUT:
            return not args.disable_f2b;

        return wire.from_instance.optimized;
