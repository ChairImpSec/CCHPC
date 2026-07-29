from enum import Enum
from model.graph.main import Graph
from model.graph.types.wire_type import WireType
from model.graph.wire import Wire
from model.graph.types.instance_type import InstanceType
from config.main import Config
from args import get_args

class CircuitDepthMode(Enum):
  GADGET_LEVEL = "gadget_level";
  GATE_LEVEL = "gate_level";

class OptimizationStats:
  @staticmethod
  def run(graph: "Graph", output_file_path: str):
    # Critical path depth
    input_wires = graph.get_wire_by_type(WireType.INPUT)
    input_wires_and_register_wires = [wire for instance in graph.get_instance_by_type(InstanceType.REGISTER) for wire in instance.get_outputs()]
    input_wires_and_register_wires.extend(input_wires)

    gadget_level_depth_no_reg = max([OptimizationStats.__get_circuit_depth(wire, 0, CircuitDepthMode.GADGET_LEVEL, True) for wire in input_wires])
    gadget_level_depth_reg = max([OptimizationStats.__get_circuit_depth(wire, 0, CircuitDepthMode.GADGET_LEVEL, False) for wire in input_wires_and_register_wires])
    gate_level_depth_no_reg = max([OptimizationStats.__get_circuit_depth(wire, 0, CircuitDepthMode.GATE_LEVEL, True) for wire in input_wires])
    gate_level_depth_reg = max([OptimizationStats.__get_circuit_depth(wire, 0, CircuitDepthMode.GATE_LEVEL, False) for wire in input_wires_and_register_wires])

    print(f"Gadget level crit. depth (no registers / with registers): {gadget_level_depth_no_reg} / {gadget_level_depth_reg}");
    print(f"Gate level crit. depth (no registers / with registers): {gate_level_depth_no_reg} / {gate_level_depth_reg}");

    # Optimization results
    args = get_args()
    config = Config.get_config();
    unoptimized_cost_no_reg = sum([instance.cost["dual_rail"] if instance.type != InstanceType.REGISTER else 0 for instance in graph.instances.values()])
    unoptimized_cost = unoptimized_cost_no_reg + config["register"]["cost"]["dual_rail"] * len(graph.get_wire_by_type(WireType.INPUT))
    optimized_cost_no_reg = sum([0 if instance.type == InstanceType.REGISTER else instance.cost["single_rail"] if instance.optimized else instance.cost["dual_rail"] for instance in graph.instances.values()])
    optimized_cost = optimized_cost_no_reg + (sum([(instance.cost["single_rail"] if instance.optimized else instance.cost["dual_rail"]) if instance.type == InstanceType.REGISTER else 0 for instance in graph.instances.values()]) if not args.disable_f2b else config["register"]["cost"]["dual_rail"] * len(graph.get_wire_by_type(WireType.INPUT)))
    optimized_instances = graph.get_instance_by_optimized(True);
    optimized_instances_linear = [instance for instance in optimized_instances if instance.type in [InstanceType.LINEAR, InstanceType.INVERSION]];
    optimized_instances_non_linear = [instance for instance in optimized_instances if instance.type == InstanceType.NON_LINEAR];
    print(f"Unoptimized cost (no registers / with registers): {unoptimized_cost_no_reg} / {unoptimized_cost}");
    print(f"Optimized cost (no registers / with registers): {optimized_cost_no_reg} / {optimized_cost}");
    print(f"Percentage gain (no registers / with registers): {((optimized_cost_no_reg - unoptimized_cost_no_reg) / unoptimized_cost_no_reg) * 100}% / {((optimized_cost - unoptimized_cost) / unoptimized_cost) * 100}%");
    print(f"Optimized instances (linear): {len(optimized_instances_linear)} of {len(graph.get_instance_by_type(InstanceType.LINEAR)) + len(graph.get_instance_by_type(InstanceType.INVERSION))}");
    print(f"Optimized instances (non-linear): {len(optimized_instances_non_linear)} of {len(graph.get_instance_by_type(InstanceType.NON_LINEAR))}");

    with open(output_file_path, "w") as f:
      f.write(f"The GE-values used to calculate these stats are for {config["numshares"]} shares\n")
      f.write(f"Gadget level crit. depth (no registers / with registers): {gadget_level_depth_no_reg} / {gadget_level_depth_reg}\n");
      f.write(f"Gate level crit. depth (no registers / with registers): {gate_level_depth_no_reg} / {gate_level_depth_reg}\n");
      f.write(f"Unoptimized cost (no registers / with registers): {unoptimized_cost_no_reg} / {unoptimized_cost}\n");
      f.write(f"Optimized cost (no registers / with registers): {optimized_cost_no_reg} / {optimized_cost}\n");
      f.write(f"Percentage gain (no registers / with registers): {((optimized_cost_no_reg - unoptimized_cost_no_reg) / unoptimized_cost_no_reg) * 100}% / {((optimized_cost - unoptimized_cost) / unoptimized_cost) * 100}%\n");
      f.write(f"Optimized instances (linear): {len(optimized_instances_linear)} of {len(graph.get_instance_by_type(InstanceType.LINEAR)) + len(graph.get_instance_by_type(InstanceType.INVERSION))}\n");
      f.write(f"Optimized instances (non-linear): {len(optimized_instances_non_linear)} of {len(graph.get_instance_by_type(InstanceType.NON_LINEAR))}\n");

  @staticmethod
  def __get_circuit_depth(wire: "Wire", current_depth: int, mode: CircuitDepthMode, ignore_registers: bool) -> int:
    if len(wire.to_instances) == 0:
      return current_depth;

    max_depth = current_depth;
    for instance in wire.to_instances:
      if instance.type == InstanceType.REGISTER and not ignore_registers:
        continue;

      instance_depth = current_depth;
      if instance.type not in [InstanceType.REGISTER, InstanceType.MAPPING]:
        if mode == CircuitDepthMode.GADGET_LEVEL:
          instance_depth += 1;
        elif mode == CircuitDepthMode.GATE_LEVEL:
          instance_depth += instance.config["critical_path"]["single_rail"] if instance.optimized else instance.config["critical_path"]["dual_rail"];
      
      new_depth = max([OptimizationStats.__get_circuit_depth(wire, instance_depth, mode, ignore_registers) for wire in instance.outputs.values()]);
      if new_depth > max_depth:
        max_depth = new_depth;

    return max_depth;
