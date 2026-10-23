import datetime
import os

from args import get_args
from config.main import Config
from inputParser.pseudoParser.main import parse_pseudo_file
from model.graph.main import Graph
from modules.backToFront.main import BackToFront
from modules.frontToBack.main import FrontToBack
from modules.graphVisualizer.main import GraphVisualizer
from modules.inversionMerger.main import InversionMerger
from modules.optimization_stats.main import OptimizationStats
from modules.railMapper.main import RailMapper
from outputParser.main import OutputParser


def run():
    print(
        "unrail Copyright (C) 2025-2026 Lukas Weber <lukas.weber1@stud.tu-darmstadt.de> and Daniel Lammers <daniel.lammers@rub.de> and Amir Moradi <amir.moradi@tu-darmstadt.de>\n"
        "\n"
        "This program comes with ABSOLUTELY NO WARRANTY.\n"
        "\n"
        "This is free software, and you are welcome to redistribute it\n"
        "under certain conditions.\n"
    )

    args = get_args()
    file_path = os.path.abspath(args.file)
    if not os.path.exists(file_path) or not os.path.isfile(file_path):
        raise FileNotFoundError(f"Input file not found or is not a file: {file_path}")

    output_dir = os.path.abspath(args.output)
    now = datetime.datetime.now()
    output_dir = os.path.join(
        output_dir,
        now.strftime("%Y%m%d-%H_%M_%S_{:03d}".format(int(now.microsecond / 1000))),
    )
    if os.path.exists(output_dir) and not os.path.isdir(output_dir):
        raise NotADirectoryError(f"Output directory is not a directory: {output_dir}")
    os.makedirs(output_dir, exist_ok=True)
    config_dir = None
    if args.config is not None:
        config_dir = os.path.abspath(args.config)
        if not os.path.exists(config_dir) or not os.path.isfile(config_dir):
            raise FileNotFoundError(
                f"Config file not found or is not a file: {config_dir}"
            )
    Config(config_dir)
    parser = "pseudo"
    graph: Graph = None
    match parser:
        case "pseudo":
            graph = parse_pseudo_file(file_path)
        case "verilog":
            raise NotImplementedError("Verilog parser not implemented")
        case _:
            raise ValueError(f"Invalid parser: {parser}")

    assert graph is not None
    assert graph.check(quiet=False, skip_input_checks=True)
    GraphVisualizer.run(graph, os.path.join(output_dir, "graph_created"))
    InversionMerger.run(graph)
    assert graph.check(quiet=False, skip_input_checks=True)
    GraphVisualizer.run(graph, os.path.join(output_dir, "graph_inversion_merged"))

    if not args.disable_b2f:
        BackToFront.run(graph)
        assert graph.check(
            quiet=False, skip_input_checks=True, skip_wire_width_checks=True
        )
        GraphVisualizer.run(graph, os.path.join(output_dir, "graph_b2f_optimized"))
    if not args.disable_f2b:
        FrontToBack.run(graph)
        GraphVisualizer.run(graph, os.path.join(output_dir, "graph_f2b_optimized"))
        assert graph.check(
            quiet=False, skip_input_checks=False, skip_wire_width_checks=True
        )

    RailMapper.run(graph)
    assert graph.check(quiet=False, skip_input_checks=args.disable_f2b)
    GraphVisualizer.run(graph, os.path.join(output_dir, "graph_rail_mapped"))

    OutputParser.run(graph, os.path.join(output_dir, "optimized.v"))
    OptimizationStats.run(graph, os.path.join(output_dir, "stats.txt"))


if __name__ == "__main__":
    run()
