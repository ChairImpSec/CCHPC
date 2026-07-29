from typing import TYPE_CHECKING, Iterator
from model.graph.types.wire_type import WireType

if TYPE_CHECKING:
  from model.graph.wire import Wire

class Vector:
  def __init__(self, name: str):
    self.name = name;
    self.wires: dict[int, "Wire"] = {};
    self.index = -1;
    self.type: "WireType" | None = None;

  def set_type(self, type: "WireType") -> "Vector":
    self.type = type;
    return self;

  def check(self, quiet: bool = False) -> bool:
    errors: list[str] = [];
    sub_check_failed = False;

    if self.type is None:
      errors.append(f"[Vector] {self.name} has no type");

    for wire in self.wires.values():
      if wire.type != self.type:
        errors.append(f"[Vector] {self.name} has wire {wire.name} with type {wire.type} but the vector type is {self.type}");

    for i in range(self.index + 1):
      wire = self.wires.get(i, None);
      if wire is None:
        errors.append(f"[Vector] {self.name} is not fully assigned (missing index {i})");
        continue;

      if not wire.check(quiet=quiet):
        sub_check_failed = True;

    if sub_check_failed:
      errors.append(f"[Vector] {self.name} has at least one invalid wire");

    if len(errors) > 0:
      if not quiet:
        for error in errors:
          print(error);
      return False;

    return True;

  def print(self, num_shares: int) -> str:
    return f"wire [{num_shares - 1}:0] {self.name} [{self.index}:0];";

  def __getitem__(self, index: int) -> "Wire":
    return self.wires[index];

  def __setitem__(self, index: int | str, wire: "Wire") -> None:
    index = int(index);
    if index in self.wires:
      if self.wires[index] == wire:
        return;
      raise ValueError(f"[Vector] Try to assign {self.name}[{index}] -> {wire.name} but it is already assigned to {self.wires[index].name}");

    self.wires[index] = wire;
    self.index = index if index > self.index else self.index;
    return;

  def __len__(self) -> int:
    return self.index + 1;

  def __repr__(self) -> str:
    return f"Vector(name={self.name}, length={len(self)}, valid={self.check(quiet=True)}), wires={', '.join([repr(wire) for wire in self.wires.values()])}";

  def __iter__(self) -> Iterator["Wire"]:
    return iter(self.wires.values());