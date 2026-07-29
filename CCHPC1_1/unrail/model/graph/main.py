import re
from model.graph.types.wire_type import WireType
from model.graph.wire import Wire
from model.graph.vector import Vector
from model.graph.instance import Instance
from model.graph.types.instance_type import InstanceType
from model.graph.helpers.check import traverse_instance

class Graph:
  @staticmethod
  def get_wire_composition(name: str) -> tuple[str, str | None]:
    match = re.match(r"^([\w_\-\d]+)(?:\[(\d+)\])?$", name);
    if not match:
      raise ValueError(f"[Graph] Invalid wire name: {name}");
    [base_name, index] = match.groups(default=None);
    return base_name, index;

  def __init__(self):
    self.instances: dict[str, "Instance"] = {};
    self.wires: dict[str, "Wire"] = {};
    self.vectors: dict[str, "Vector"] = {};
    self.__last_id = -1;
    self.clock_wire: str | None = None;
    self.precharge_wire: str | None = None;
    self.randomness_wire: str | None = None;

  def set_clock_wire(self, clock_wire: str) -> "Graph":
    self.clock_wire = clock_wire;
    return self;

  def set_precharge_wire(self, precharge_wire: str) -> "Graph":
    self.precharge_wire = precharge_wire;
    return self;

  def set_randomness_wire(self, randomness_wire: str) -> "Graph":
    self.randomness_wire = randomness_wire;
    return self;

  def add_instance(self, instance: "Instance") -> "Graph":
    if instance.name in self.instances:
      if self.instances[instance.name] == instance:
        return self;
      raise ValueError(f"[Graph] Instance {instance.name} already exists");

    self.instances[instance.name] = instance;
    return self;

  def add_wire(self, wire: "Wire") -> "Graph":
    if self._is_name_reserved(wire.name):
      raise ValueError(f"[Graph] Wire {wire.name} is reserved");

    if wire.name in self.vectors:
      raise ValueError(f"[Graph] Wire {wire.name} is already a vector");

    if wire.name in self.wires:
      if self.wires[wire.name] == wire:
        return self;
      raise ValueError(f"[Graph] Wire {wire.name} already exists");

    self.wires[wire.name] = wire;
    return self;

  def add_vector(self, vector: "Vector") -> "Graph":
    if self._is_name_reserved(vector.name):
      raise ValueError(f"[Graph] Vector {vector.name} is reserved");

    if vector.name in self.wires:
      self.wires.pop(vector.name);

    if vector.name in self.vectors:
      if self.vectors[vector.name] == vector:
        return self;
      raise ValueError(f"[Graph] Vector {vector.name} already exists");

    self.vectors[vector.name] = vector;
    return self;

  def ensure_wire(self, name: str, type: "WireType") -> "Wire":
    base_name, index = Graph.get_wire_composition(name);
    wire = self.get_wire(name);
    if wire is None:
      if self._is_name_reserved(name):
        raise ValueError(f"[Graph] Wire {name} is reserved");
      wire = Wire(name, type);
      self.add_wire(wire);

    if index is not None:
      if wire.type != WireType.INPUT and wire.type != WireType.OUTPUT:
        raise ValueError(f"[Graph] Wire {name} is not allowed to be vectored");
      vector = self.get_vector(base_name);
      if vector is None:
        vector = Vector(base_name);
        vector.set_type(wire.type);
        self.add_vector(vector);
      else:
        if vector.type != wire.type:
          raise ValueError(f"[Graph] Wire {name} belongs to vector {vector.name} with type {vector.type} but the wire type is {wire.type}");

      vector[index] = wire;

    return wire;

  def get_instance(self, name: str) -> "Instance | None":
    return self.instances.get(name, None);

  def get_wire(self, name: str) -> "Wire | None":
    return self.wires.get(name, None);

  def get_vector(self, name: str) -> "Vector | None":
    return self.vectors.get(name, None);

  def get_unique_id(self) -> int:
    self.__last_id += 1;
    return self.__last_id;

  def get_instance_by_type(self, type: "InstanceType") -> list["Instance"]:
    result: list["Instance"] = [];
    for instance in self.instances.values():
      if instance.type == type:
        result.append(instance);

    return result;

  def get_instance_by_optimized(self, optimized: bool) -> list["Instance"]:
    result: list["Instance"] = [];
    for instance in self.instances.values():
      if instance.optimized == optimized:
        result.append(instance);
    return result;

  def get_wire_by_type(self, type: "WireType") -> list["Wire"]:
    result: list["Wire"] = [];
    for wire in self.wires.values():
      if wire.type == type:
        result.append(wire);
    return result;

  def get_vector_by_type(self, type: "WireType") -> list["Vector"]:
    result: list["Vector"] = [];
    for vector in self.vectors.values():
      if vector.type == type:
        result.append(vector);
    return result;

  def remove_instance(self, instance: "Instance") -> "Graph":
    if instance.name not in self.instances:
      raise ValueError(f"[Graph] Instance {instance.name} does not exist");

    del self.instances[instance.name];
    return self;

  def remove_wire(self, wire: "Wire") -> "Graph":
    if wire.name not in self.wires:
      raise ValueError(f"[Graph] Wire {wire.name} does not exist");

    del self.wires[wire.name];
    return self;

  def _is_name_reserved(self, name: str) -> bool:
    full_name_reserved = name == self.clock_wire or name == self.precharge_wire or name == self.randomness_wire;
    base_name, _ = Graph.get_wire_composition(name);
    base_name_reserved = base_name == self.clock_wire or base_name == self.precharge_wire or base_name == self.randomness_wire;
    return full_name_reserved or base_name_reserved;

  """
  Get all vectors and wires that are not already part of a vector
  """
  def get_wires_and_vectors(self) -> list["Wire | Vector"]:
    result: list["Wire" | "Vector"] = [];
    vectored_wires: dict[str, bool] = {};
    for vector in self.vectors.values():
      result.append(vector);
      for wire in vector.wires.values():
        vectored_wires[wire.name] = True;

    for wire in self.wires.values():
      if wire.name not in vectored_wires:
        result.append(wire);

    return result;

  def get_wires_and_vectors_by_type(self, type: "WireType") -> list["Wire | Vector"]:
    result: list["Wire" | "Vector"] = [];
    wires_and_vectors = self.get_wires_and_vectors();
    for wire_or_vector in wires_and_vectors:
      if wire_or_vector.type == type:
        result.append(wire_or_vector);
    return result;

  def check(self, quiet: bool = False, skip_input_checks: bool = False, skip_wire_width_checks: bool = False) -> bool:
    errors: list[str] = [];
    sub_check_failed = False;

    if self.clock_wire is None:
      errors.append(f"[Graph] Clock wire is not set");
    if self.precharge_wire is None:
      errors.append(f"[Graph] Precharge wire is not set");
    if self.randomness_wire is None:
      errors.append(f"[Graph] Randomness wire is not set");

    for instance in self.instances.values():
      if not instance.check(quiet=quiet):
        sub_check_failed = True;
    for wire_or_vector in self.get_wires_and_vectors():
      if not wire_or_vector.check(quiet=quiet):
        sub_check_failed = True;

    input_wires = self.get_wire_by_type(WireType.INPUT);
    visited_wires: dict["Wire", bool] = {wire: False for wire in self.wires.values()};
    visited_instances: dict["Instance", bool] = {instance: False for instance in self.instances.values()};
    current_wires: list["Wire"] = input_wires;
    while len(current_wires) > 0:
      wire = current_wires.pop(0);
      visited_wires[wire] = True;
      for instance in wire.to_instances:
        if not visited_instances[instance]:
          visited_instances[instance] = True;
          for output_wire in instance.outputs.values():
            if not visited_wires[output_wire] and output_wire not in current_wires:
              current_wires.append(output_wire);
    
    for wire, visited in visited_wires.items():
      if not visited:
        errors.append(f"[Graph] Wire {wire.name} is unreachable in the graph");

    for instance, visited in visited_instances.items():
      if not visited:
        errors.append(f"[Graph] Instance {instance.name} is unreachable in the graph");

    visited_instances: set["Instance"] = set();
    for wire in self.get_wire_by_type(WireType.INPUT):
      for instance in wire.to_instances:
        errors.extend(traverse_instance(instance, visited_instances, first=not skip_input_checks, skip_wire_width_checks=skip_wire_width_checks));

    if sub_check_failed:
      errors.append("[Graph] At least one sub-check failed");

    if len(errors) > 0:
      if not quiet:
        for error in errors:
          print(error);
      return False;
    return True;