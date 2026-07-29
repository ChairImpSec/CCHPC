from typing import TYPE_CHECKING
from model.graph.types.wire_type import WireType
if TYPE_CHECKING:
  from model.graph.instance import Instance

class Wire:
  def __init__(self, name: str, type: WireType = WireType.INTERNAL):
    self.name = name;
    self.from_instance: "Instance" | None = None;
    self.to_instances: list["Instance"] = [];
    self.type = type;

  def set_from(self, instance: "Instance") -> "Wire":
    self.from_instance = instance;
    return self;

  def set_type(self, type: WireType) -> "Wire":
    self.type = type;
    return self;

  def add_to(self, instance: "Instance") -> "Wire":
    if instance in self.to_instances:
      return self;

    self.to_instances.append(instance);
    return self;

  def remove_to(self, instance: "Instance") -> "Wire":
    if instance not in self.to_instances:
      return self;

    self.to_instances.remove(instance);
    return self;

  def check(self, quiet: bool = False) -> bool:
    errors: list[str] = [];
    if self.type == WireType.INPUT:
      if self.from_instance is not None:
        errors.append(f"[Wire] {self.name} is an input wire but has a from instance {self.from_instance.name}");
      if len(self.to_instances) == 0:
        errors.append(f"[Wire] {self.name} is an input wire but has no to instances");
    elif self.type == WireType.OUTPUT:
      if self.from_instance is None:
        errors.append(f"[Wire] {self.name} is an output wire but has no from instance");
    elif self.type == WireType.INTERNAL:
      if self.from_instance is None:
        errors.append(f"[Wire] {self.name} is an internal wire but has no from instance");
      if len(self.to_instances) == 0:
        errors.append(f"[Wire] {self.name} is an internal wire but has no to instances");
    else:
      errors.append(f"[Wire] {self.name} has an invalid type {self.type}");

    if len(errors) > 0:
      if not quiet:
        for error in errors:
          print(error);
      return False;

    return True;

  def print(self, num_shares: int) -> str:
    return f"wire [{num_shares - 1}:0] {self.name};";

  def __repr__(self) -> str:
    return f"Wire(name={self.name}, type={self.type}, valid={self.check(quiet=True)}, from_instance={repr(self.from_instance) if self.from_instance else None}, to_instances={', '.join([repr(instance) for instance in self.to_instances])})";