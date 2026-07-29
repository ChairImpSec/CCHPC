from typing import TYPE_CHECKING
from model.graph.wire import Wire
if TYPE_CHECKING:
    from modules.backToFront.wrapper.state import BackToFrontState
    from modules.backToFront.wrapper.instance import BackToFrontInstance

class BackToFrontWire:
    def __init__(self, state: "BackToFrontState", wire: "Wire"):
        self.state = state;
        self.wire = wire;
        self.traversed = False;
        self.traversable = False;
        self.__visitedByOutputs = {state.get_instance(instance): False for instance in wire.to_instances};
        self.__check_traversable();

    def __check_traversable(self) -> bool:
        self.traversable = all(self.__visitedByOutputs.values());

    def visit(self, instance: "BackToFrontInstance") -> None:
        self.__visitedByOutputs[instance] = True;
        self.__check_traversable();

    def traverse(self) -> "BackToFrontInstance | None":
        self.__check_traversable();
        if not self.traversable:
            raise ValueError(f"[BackToFrontWire] Wire {self.wire.name} is not traversable");

        if self.traversed:
            raise ValueError(f"[BackToFrontWire] Wire {self.wire.name} has already been traversed");

        self.traversed = True;

        if self.wire.from_instance is None:
            return None;

        return self.state.get_instance(self.wire.from_instance);