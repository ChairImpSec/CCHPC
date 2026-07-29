from typing import TYPE_CHECKING
from model.graph.wire import Wire
from config.main import Config
if TYPE_CHECKING:
    from modules.frontToBack.model.state import State

class f2bInputWire:
  def __init__(self, state: "State", wire: "Wire"):
    self.state = state
    self.wire = wire

    register_config = Config.get_config()["register"]
    sr_register_cost = register_config["cost"]["single_rail"]
    dr_register_additional_cost = register_config["cost"]["dual_rail"] - register_config["cost"]["single_rail"]
    assert dr_register_additional_cost >= 0, "[f2bInputWire] Dual-rail register cost must not be lower than single-rail register cost"

    self.main_node = state.graph.add_vertex()
    self.reg_node = state.graph.add_vertex()
    self.reg_dr_node = state.graph.add_vertex()

    self.state.vertex_names.set_name(self.main_node, f"main-w-{wire.name}")
    self.state.vertex_names.set_name(self.reg_node, f"reg-w-{wire.name}")
    self.state.vertex_names.set_name(self.reg_dr_node, f"regDR-w-{wire.name}")

    internal_edge = state.graph.add_edge(self.main_node, self.reg_node)
    internal_dr_edge = state.graph.add_edge(self.main_node, self.reg_dr_node)
    source_edge = state.graph.add_edge(state.source, self.main_node)
    rev_edge = state.graph.add_edge(self.reg_node, self.main_node)
    rev_dr_edge = state.graph.add_edge(self.reg_dr_node, self.main_node)
    source_rev_edge = state.graph.add_edge(self.main_node, state.source)

    self.state.edge_names.set_name(internal_edge, f"REG-w-{wire.name}")
    self.state.edge_names.set_name(internal_dr_edge, f"REGDR-w-{wire.name}")
    self.state.edge_names.set_name(source_edge, f"source-w-{wire.name}")
    self.state.edge_names.set_name(rev_edge, f"rev-w-{wire.name}")
    self.state.edge_names.set_name(rev_dr_edge, f"rev-dr-w-{wire.name}")
    self.state.edge_names.set_name(source_rev_edge, f"source-rev-w-{wire.name}")

    self.state.costs.set_cost(internal_edge, sr_register_cost)
    self.state.infinity_cost += sr_register_cost
    self.state.costs.set_cost(internal_dr_edge, dr_register_additional_cost)
    self.state.infinity_cost += dr_register_additional_cost
    self.state.infinity_cost_edges.append(source_edge)
    self.state.infinity_cost_edges.append(rev_edge)
    self.state.infinity_cost_edges.append(rev_dr_edge)
    self.state.infinity_cost_edges.append(source_rev_edge)
