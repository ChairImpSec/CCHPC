from typing import TYPE_CHECKING, Callable
from model.graph.types.instance_type import InstanceType
from config.main import Config
if TYPE_CHECKING:
  from model.graph.wire import Wire

class Instance:
    def __init__(self, name: str, module_name: str):
        self.name = name;
        self.reverseInputs: dict["Wire", str] = {};
        self.reverseOutputs: dict["Wire", str] = {};
        self.randomBitCount = 0
        self.randomBitName = None;
        self.configBits: dict[str, str] = {};
        self.additionalConnections: dict[str, str] = {};
        
        if module_name == "REGISTER":
            self.type = InstanceType.REGISTER;
            self.config = Config.get_config()["register"];
            self.cost = {
                "single_rail": self.config["cost"]["single_rail"],
                "dual_rail": self.config["cost"]["dual_rail"],
            }
            self.moduleName = "REGISTER";
            self.optimized = False;
            self.inputs: dict[str, "Wire"] = {self.config["input"]: None};
            self.outputs: dict[str, "Wire"] = {self.config["output"]: None};
        elif module_name == "MAPPING":
            self.type = InstanceType.MAPPING;
            self.config = {"input": "a", "output": "z"};
            self.cost = {
                "single_rail": 0,
                "dual_rail": 0,
            }
            self.moduleName = "MAPPING";
            self.optimized = True;
            self.inputs: dict[str, "Wire"] = {self.config["input"]: None};
            self.outputs: dict[str, "Wire"] = {self.config["output"]: None};
        else:
            module = Config.get_config().config["modules"][module_name]
            self.config = module;
            self.type = InstanceType.LINEAR if module["type"] == "linear" else InstanceType.NON_LINEAR if module["type"] == "non-linear" else InstanceType.INVERSION if module["type"] == "inversion" else None;
            if self.type is None:
                raise ValueError(f"[Instance] {name} has an invalid type {module["type"]}");
            self.moduleName = module_name;
            self.optimized = False;
            self.cost = module["cost"];
            self.inputs: dict[str, "Wire"] = {name: None for name in module["inputs"]};
            self.outputs: dict[str, "Wire"] = {name: None for name in module["outputs"]};
            self.additionalConnections = {name: wire for name, wire in []}; # TODO: additional connections support
            config_bits = [];
            if "config_bits" in module["verilog_output"]:
                config_bits = module["verilog_output"]["config_bits"];
            self.configBits = {bit["name"]: bit["value"] for bit in config_bits};
            if "random_bits" in module["verilog_output"]:
                self.randomBitName = module["verilog_output"]["random_bits"]["name"];
                self.randomBitCount = module["verilog_output"]["random_bits"]["count"];

        if self.type == InstanceType.INVERSION or self.type == InstanceType.LINEAR:
            self.configBits["INV"] = "1'b0";

        if self.type == InstanceType.NON_LINEAR:
            for inputName in self.inputs.keys():
                self.configBits[f"{inputName}INV"] = "1'b0";
            for outputName in self.outputs.keys():
                self.configBits[f"{outputName}INV"] = "1'b0";

    def replace_wire(self, oldWire: "Wire", newWire: "Wire") -> "Instance":
        if oldWire in self.reverseInputs:
            self._set_input(self.reverseInputs[oldWire], newWire);
            return self;
        
        if oldWire in self.reverseOutputs:
            self._set_output(self.reverseOutputs[oldWire], newWire);
            return self;
        
        raise ValueError(f"[Instance] {self.name} does not connect to wire {oldWire.name}");

    def invert_wire(self, wire: "Wire") -> "Instance":
        name = None;

        if wire in self.reverseInputs:
            name = self.reverseInputs[wire];
        elif wire in self.reverseOutputs:
            name = self.reverseOutputs[wire];
        else:
            raise ValueError(f"[Instance] {self.name} does not connect to wire {wire.name}");

        
        if self.type == InstanceType.INVERSION or self.type == InstanceType.LINEAR:
            self.set_config("INV", "1'b0" if self.get_config("INV") == "1'b1" else "1'b1");
        elif self.type == InstanceType.NON_LINEAR:
            self.set_config(f"{name}INV", "1'b0" if self.get_config(f"{name}INV") == "1'b1" else "1'b1");
        else:
            raise ValueError(f"[Instance] {self.name} cannot invert wire {wire.name}");

        return self;

    def set_wire(self, io_name: str, wire: "Wire") -> "Instance":
        if io_name not in self.inputs and io_name not in self.outputs:
            raise ValueError(f"[Instance] {self.name} does not have an input or output named {io_name}");
        if self.reverseInputs.get(wire, None) is not None and self.reverseInputs[wire] != io_name:
            raise ValueError(f"[Instance] {self.name} is already connected to wire {wire.name} at input {self.reverseInputs[wire]}");
        if self.reverseOutputs.get(wire, None) is not None and self.reverseOutputs[wire] != io_name:
            raise ValueError(f"[Instance] {self.name} is already connected to wire {wire.name} at output {self.reverseOutputs[wire]}");

        if io_name in self.inputs:
            self._set_input(io_name, wire);
        elif io_name in self.outputs:
            self._set_output(io_name, wire);
        else:
            raise ValueError(f"[Instance] {self.name} does not have an input or output named {io_name}");

        return self;

    def _set_input(self, name: str, wire: "Wire") -> "Instance":
        if name not in self.inputs:
            raise ValueError(f"[Instance] {self.name} does not have an input named {name}");

        if self.inputs[name] is not None:
            self.reverseInputs.pop(self.inputs[name]);

        self.inputs[name] = wire;
        self.reverseInputs[wire] = name;
        return self;

    def _set_output(self, name: str, wire: "Wire") -> "Instance":
        if name not in self.outputs:
            raise ValueError(f"[Instance] {self.name} does not have an output named {name}");

        if self.outputs[name] is not None:
            self.reverseOutputs.pop(self.outputs[name]);

        self.outputs[name] = wire;
        self.reverseOutputs[wire] = name;
        return self;

    def get_config(self, name: str) -> str | None:
        return self.configBits.get(name, None);

    def set_config(self, name: str, value: str) -> "Instance":
        self.configBits[name] = value;
        return self;

    def get_inputs(self) -> list["Wire"]:
        return list(self.inputs.values());

    def get_outputs(self) -> list["Wire"]:
        return list(self.outputs.values());

    def optimize(self) -> "Instance":
        self.optimized = True;
        return self;

    def check(self, quiet: bool = False) -> bool:
        errors: list[str] = [];

        if self.randomBitCount < 0:
            errors.append(f"[Instance] {self.name} has an invalid random bit count (expected >= 0, got {self.randomBitCount})");

        for name, wire in self.inputs.items():
            if wire is None:
                errors.append(f"[Instance] {self.name} has an input named {name} but it is not connected");

            if self.reverseInputs.get(wire, None) != name:
                errors.append(f"[Instance] {self.name} has an input named {name} connected to wire {wire.name} but the reverse connection is {self.reverseInputs[wire]}");
        for name, wire in self.outputs.items():
            if wire is None:
                errors.append(f"[Instance] {self.name} has an output named {name} but it is not connected");

            if self.reverseOutputs.get(wire, None) != name:
                errors.append(f"[Instance] {self.name} has an output named {name} connected to wire {wire.name} but the reverse connection is {self.reverseOutputs[wire]}");

        for wire, name in self.reverseInputs.items():
            if name not in self.inputs or self.inputs[name] != wire:
                errors.append(f"[Instance] {self.name} has a reverse input connection from wire {wire.name} to input {name} but the input is not connected to the wire");
        for wire, name in self.reverseOutputs.items():
            if name not in self.outputs or self.outputs[name] != wire:
                errors.append(f"[Instance] {self.name} has a reverse output connection from wire {wire.name} to output {name} but the output is not connected to the wire");

        match self.type:
            case InstanceType.REGISTER | InstanceType.INVERSION | InstanceType.MAPPING:
                if len(self.inputs) != 1:
                    errors.append(f"[Instance] {self.name} has an invalid number of inputs for type {self.type} (expected 1, got {len(self.inputs)})");
                if len(self.outputs) != 1:
                    errors.append(f"[Instance] {self.name} has an invalid number of outputs for type {self.type} (expected 1, got {len(self.outputs)})");
            case InstanceType.NON_LINEAR | InstanceType.LINEAR:
                if len(self.inputs) < 2:
                    errors.append(f"[Instance] {self.name} has an invalid number of inputs for type {self.type} (expected >= 2, got {len(self.inputs)})");
                if len(self.outputs) < 1:
                    errors.append(f"[Instance] {self.name} has an invalid number of outputs for type {self.type} (expected >= 1, got {len(self.outputs)})");
            case _:
                errors.append(f"[Instance] {self.name} has an invalid type {self.type}");

        for name in self.additionalConnections.keys():
            if name in self.inputs or name in self.outputs:
                errors.append(f"[Instance] {self.name} has an additional connection {name} but it is already an input or output");

        for name in self.inputs.keys():
            if name in self.outputs:
                errors.append(f"[Instance] {self.name} has an input and output named {name}");

        if self.randomBitCount > 0 and (self.randomBitName in self.inputs or self.randomBitName in self.outputs or self.randomBitName in self.additionalConnections):
            errors.append(f"[Instance] {self.name} requires a random bit vector but the reserved name '{self.randomBitName}' is already in use");

        if self.optimized and self.type not in [InstanceType.LINEAR, InstanceType.INVERSION, InstanceType.NON_LINEAR, InstanceType.REGISTER, InstanceType.MAPPING]:
            errors.append(f"[Instance] {self.name} is optimized but has an unsupported type {self.type}");

        if len(errors) > 0:
            if not quiet:
                for error in errors:
                    print(error);
            return False;

        return True;

    def _get_connections(self, clock_wire: str, precharge_wire: str, randomBitVector: str | None = None) -> list[tuple[str, str]]:
        connections: list[tuple[str, str]] = [];
        connections.extend([(name, wire.name) for name, wire in self.inputs.items()]);
        if randomBitVector is not None:
            connections.append((self.randomBitName, randomBitVector));
        if self.config.get("clock_wire", None) is not None:
            connections.append((self.config["clock_wire"], clock_wire));
        if self.config.get("precharge_wire", None) is not None:
            connections.append((self.config["precharge_wire"], precharge_wire));
        connections.extend([(name, wire) for name, wire in self.additionalConnections.items()]);
        connections.extend([(name, wire.name) for name, wire in self.outputs.items()]);
        return connections;

    def print(self, clock_wire: str, precharge_wire: str, randomBitGetter: Callable[[int], str]) -> str:
        if self.type == InstanceType.MAPPING:
            # Mapping module is only used for DR to SR mapping and is not an actual verilog module so we print a generate block for the wire mapping here
            INDENT_STRING = "    ";
            input_wire = self.get_inputs()[0];
            output_wire = self.get_outputs()[0];
            return (f"generate\n"
                    f"{INDENT_STRING * 2}for (i = 0; i < d; i=i+1) begin : loop_DRtSR_mapping_{self.name}\n"
                    f"{INDENT_STRING * 3}assign {output_wire.name}[i] = {input_wire.name}[(i == 0) ? 0 : (2*i - 1)];\n"
                    f"{INDENT_STRING * 2}end\n"
                    f"{INDENT_STRING}endgenerate");

        randomBitVector = randomBitGetter(self.randomBitCount) if self.randomBitCount > 0 else None;
        return f"{self.config["verilog_output"]["single_rail_module"] if self.optimized else self.config["verilog_output"]["dual_rail_module"]}{f" #({','.join([f".{name}({value})" for name, value in self.configBits.items()])})" if len(self.configBits) > 0 else ""} {self.name} ({", ".join([f".{name}({wire})" for name, wire in self._get_connections(clock_wire, precharge_wire, randomBitVector)])});";

    def __repr__(self) -> str:
        return f"Instance(name={self.name}, type={self.type}, valid={self.check(quiet=True)}, moduleName={self.moduleName}, clockWire={self.clockWire}, prechargeWire={self.prechargeWire}, randomBitCount={self.randomBitCount}, inputs={', '.join([f"{name}: {wire.name}" for name, wire in self.inputs.items()])}, outputs={', '.join([f"{name}: {wire.name}" for name, wire in self.outputs.items()])}, additionalConnections={', '.join([f"{name} -> {wire.name}" for name, wire in self.additionalConnections])}, configBits={', '.join([f"{name}: {value}" for name, value in self.configBits.items()])})";