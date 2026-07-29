from model.graph.instance import Instance
from model.graph.types.instance_type import InstanceType

def traverse_instance(instance: "Instance", visited: set["Instance"], optimized: bool = False, first: bool = False, skip_wire_width_checks: bool = False) -> list[str]:
    errors: list[str] = [];

    next_optimized = optimized;
    if optimized and not instance.optimized and instance.type != InstanceType.REGISTER:
        errors.append(f"[Instance] {instance.name} is not optimized but is expected to be optimized");
        next_optimized = True;

    next_optimized = next_optimized or instance.optimized;

    if not optimized and not first and instance.type == InstanceType.REGISTER:
        errors.append(f"[Instance] {instance.name} is a register but was fed by a not optimized wire");

    if instance.type == InstanceType.REGISTER:
        # A single-rail register (optimized) keeps its output single-rail while a
        # SRtDR register converts to dual-rail
        next_optimized = instance.optimized;

    if instance.type == InstanceType.MAPPING:
        if optimized:
            errors.append(f"[Instance] {instance.name} is a dual-to-single-rail mapping but was fed by an optimized (single-rail) wire");
        next_optimized = True;

    if optimized and instance.type == InstanceType.NON_LINEAR:
        errors.append(f"[Instance] {instance.name} is fed by optimized wires but is non-linear");
        next_optimized = False;

    if not optimized and not first and instance.optimized and instance.type in [InstanceType.LINEAR, InstanceType.INVERSION] and not skip_wire_width_checks:
        errors.append(f"[Instance] {instance.name} is optimized but not fed by optimized wires");

    if first and not instance.optimized and instance.type != InstanceType.REGISTER:
        errors.append(f"[Instance] {instance.name} is expected to be optimized but is not");
        next_optimized = True;

    if instance in visited:
        return errors;

    visited.add(instance);

    next_instances = [instance for wire in instance.get_outputs() for instance in wire.to_instances];

    for instance in next_instances:
        errors.extend(traverse_instance(instance, visited, next_optimized, False, skip_wire_width_checks));

    return errors;
