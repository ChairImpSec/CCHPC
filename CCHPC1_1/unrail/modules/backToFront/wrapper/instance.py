from typing import TYPE_CHECKING
from model.graph.instance import Instance
from model.graph.types.instance_type import InstanceType
if TYPE_CHECKING:
    from modules.backToFront.wrapper.state import BackToFrontState
    from modules.backToFront.wrapper.wire import BackToFrontWire

class BackToFrontInstance:
    def __init__(self, state: "BackToFrontState", instance: "Instance"):
        self.state = state;
        self.instance = instance;
        self.traversed = False;
        self.traversable = False;
        self.__visitedByOutputs = {state.get_wire(wire): False for wire in instance.get_outputs()};
        self.__check_traversable();

    def __check_traversable(self) -> bool:
        self.traversable = all(self.__visitedByOutputs.values());

    def visit(self, wire: "BackToFrontWire") -> None:
        self.__visitedByOutputs[wire] = True;
        self.__check_traversable();

    def traverse(self) -> list["BackToFrontWire"]:
        self.__check_traversable();
        if not self.traversable:
            raise ValueError(f"[BackToFrontInstance] Instance {self.instance.name} is not traversable");

        if self.traversed:
            raise ValueError(f"[BackToFrontInstance] Instance {self.instance.name} has already been traversed");

        self.traversed = True;
        self.state.add_optimized_instance(self);

        if self.instance.type == InstanceType.NON_LINEAR:
            return [];

        if self.instance.type == InstanceType.LINEAR or self.instance.type == InstanceType.INVERSION:
            return [self.state.get_wire(wire) for wire in self.instance.get_inputs()];

        raise ValueError(f"[BackToFrontInstance] Instance {self.instance.name} has an unsupported type {self.instance.type}");
