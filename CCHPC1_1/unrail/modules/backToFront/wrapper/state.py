from modules.backToFront.wrapper.instance import BackToFrontInstance
from model.graph.instance import Instance
from modules.backToFront.wrapper.wire import BackToFrontWire
from model.graph.wire import Wire

class BackToFrontState:
    @staticmethod
    def get_next_wire(wires: list["BackToFrontWire"]) -> "BackToFrontWire | None":
        for wire in wires:
            if wire.traversable and not wire.traversed:
                wires.remove(wire);
                return wire;

        return None;
    
    def __init__(self):
        self.__instances: dict["Instance", "BackToFrontInstance"] = {};
        self.__wires: dict["Wire", "BackToFrontWire"] = {};
        self.__optimized_instances: list["Instance"] = [];

    def get_instance(self, instance: "Instance") -> "BackToFrontInstance":
        b2f_instance = self.__instances.get(instance, None);
        if b2f_instance is None:
            b2f_instance = BackToFrontInstance(self, instance);
            self.__instances[instance] = b2f_instance;

        return b2f_instance;

    def get_wire(self, wire: "Wire") -> "BackToFrontWire":
        b2f_wire = self.__wires.get(wire, None);
        if b2f_wire is None:
            b2f_wire = BackToFrontWire(self, wire);
            self.__wires[wire] = b2f_wire;

        return b2f_wire;

    def add_optimized_instance(self, b2f_instance: "BackToFrontInstance") -> None:
        self.__optimized_instances.append(b2f_instance.instance);

    def get_optimized_instances(self) -> list["Instance"]:
        return self.__optimized_instances;