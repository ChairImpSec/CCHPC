from model.graph.main import Graph
from model.graph.types.wire_type import WireType
from modules.backToFront.wrapper.state import BackToFrontState

class BackToFront:
    @staticmethod
    def run(graph: "Graph") -> None:
        state = BackToFrontState();
        wires = [state.get_wire(wire) for wire in graph.get_wire_by_type(WireType.OUTPUT)];
        while (wire := BackToFrontState.get_next_wire(wires)) is not None:
            instance = wire.traverse();
            if instance is None:
                # Wire is INPUT wire, can't traverse further
                continue;
            instance.visit(wire);

            if instance.traversable:
                new_wires = instance.traverse();
                for new_wire in new_wires:
                    new_wire.visit(instance);
                    if not new_wire.traversed and new_wire not in wires:
                        wires.append(new_wire);

        # If wires are still in the list, they have NL-gates in their path and we dont have a full NL stage
        # Wire width will be fixed later by the RailMapper
        if len(wires) > 0:
            print(f"[BackToFront] {len(wires)} wires stay dual-rail because they also feed non-linear paths: {', '.join([wire.wire.name for wire in wires])}");

        optimized_instances = state.get_optimized_instances();
        assert len(optimized_instances) > 0, f"[BackToFront] No instances were optimized which is not expected";
        for instance in optimized_instances:
            instance.optimize();