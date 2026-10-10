#!/usr/bin/env bash
# Synthesizes an unrail output with synth.tcl and prints the area in um^2 and GE.
#
# Usage: synthesis/synth.sh <unrail output .v> [security_order] [top_module]
#
# Environment:
#   YOSYS        yosys command (default: yosys), e.g. YOSYS="pixi exec -s yosys -- yosys"
#   REPORT_OUT   area report file (default: <design>_area_so<n>.rpt)
#   NETLIST_OUT  flattened gate-level netlist (default: synthesized_so<n>.v next to the design)

set -euo pipefail

if [ $# -lt 1 ]; then
    echo "Usage: $0 <unrail output .v> [security_order] [top_module]" >&2
    exit 1
fi

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
design=$(realpath "$1")
security_order="${2:-1}"
top_module="${3:-unrail_module}"
base="${design%.v}"

export UNRAIL_DESIGN="$design"
export SECURITY_ORDER="$security_order"
export TOP_MODULE="$top_module"
export REPORT_OUT="${REPORT_OUT:-${base}_area_so${security_order}.rpt}"

read -r -a yosys_cmd <<< "${YOSYS:-yosys}"
"${yosys_cmd[@]}" -q -l "${base}_yosys_so${security_order}.log" -c "$script_dir/synth.tcl"
