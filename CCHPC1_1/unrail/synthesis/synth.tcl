# Yosys Tcl script: synthesizes an unrail output (e.g. results/.../optimized.v) with the
# CCHPC gadgets in gadgets/ and the cells in basic_components.v onto the NanGate 45nm
# Open Cell Library and reports the area in um^2 and in gate equivalents (GE).
#
# Usage (run with `yosys -c`, configuration via environment variables):
#   UNRAIL_DESIGN=<unrail output .v>   (required)
#   SECURITY_ORDER=<n>                 (default: 1)
#   TOP_MODULE=<name>                  (default: unrail_module)
#   REPORT_OUT=<file>                  (default: <design>_area_so<n>.rpt)
#   NETLIST_OUT=<file>                 (default: synthesized_so<n>.v next to the design, flattened gate-level netlist)
#
#   UNRAIL_DESIGN=results/.../optimized.v SECURITY_ORDER=2 yosys -c synthesis/synth.tcl
#
# or use the wrapper: synthesis/synth.sh <unrail output .v> [security_order] [top_module]
#
# The cells in basic_components.v are marked keep_hierarchy/dont_touch, so they are
# mapped individually and never optimized across their boundaries. The gadgets
# themselves are flattened into the top module.

proc env_or {name default} {
    if {[info exists ::env($name)] && $::env($name) ne ""} {
        return $::env($name)
    }
    return $default
}

set script_dir [file dirname [file normalize [info script]]]
set liberty    [file join $script_dir NangateOpenCellLibrary_functional.lib]
set basic      [file join $script_dir basic_components.v]
set gadget_dir [file join $script_dir gadgets]

# Area of NAND2_X1 in the NanGate Open Cell Library (um^2) = 1 GE
set ge_factor 0.798

set design [env_or UNRAIL_DESIGN ""]
if {$design eq ""} {
    error "UNRAIL_DESIGN is not set. Set it to the unrail output that should be synthesized."
}
if {![file exists $design]} {
    error "UNRAIL_DESIGN '$design' does not exist."
}
set design         [file normalize $design]
set security_order [env_or SECURITY_ORDER 1]
set top            [env_or TOP_MODULE unrail_module]
set report         [env_or REPORT_OUT "[file rootname $design]_area_so${security_order}.rpt"]
set netlist        [env_or NETLIST_OUT [file join [file dirname $design] "synthesized_so${security_order}.v"]]
set stat_json      "[file rootname $report]_stat.json"

if {![string is integer -strict $security_order] || $security_order < 1} {
    error "SECURITY_ORDER must be an integer >= 1 (got '$security_order')."
}

# ---------------------------------------------------------------------------
# Read sources
# ---------------------------------------------------------------------------
yosys read_verilog $basic
foreach gadget [lsort [glob -directory $gadget_dir *.v]] {
    yosys read_verilog $gadget
}
yosys read_verilog $design

yosys chparam -set security_order $security_order $top
yosys hierarchy -check -top $top
# hierarchy re-elaborates the parameterized top as $paramod\<top>\security_order=..., restore the plain name
yosys rename -top $top

# ---------------------------------------------------------------------------
# Synthesis and technology mapping
# ---------------------------------------------------------------------------
yosys synth -top $top -flatten
yosys dfflibmap -liberty $liberty
yosys abc -liberty $liberty
yosys opt_clean -purge

# Hierarchical statistics (one entry per kept basic cell) for the log
yosys stat -liberty $liberty -top $top

# ---------------------------------------------------------------------------
# Area report: flatten the kept cells so the top module holds only library cells
# ---------------------------------------------------------------------------
yosys setattr -mod -unset keep_hierarchy
yosys flatten
yosys opt_clean

yosys tee -q -o $stat_json stat -json -liberty $liberty $top

yosys select $top
yosys write_verilog -noattr -selected $netlist
yosys select -clear

set fh [open $stat_json r]
set stat_content [read $fh]
close $fh

if {![regexp {"area":\s*([0-9.eE+-]+)} $stat_content -> area]} {
    error "Could not extract the chip area from '$stat_json'."
}
set area_ge [expr {$area / $ge_factor}]

set lines [list \
    "==================== Area Report ====================" \
    "Design         : $design" \
    "Top module     : $top" \
    "Security order : $security_order" \
    "Library        : [file tail $liberty] (1 GE = NAND2_X1 = $ge_factor um^2)" \
    [format "Area           : %.3f um^2" $area] \
    [format "Area           : %.2f GE" $area_ge] \
    "=====================================================" \
]

set fh [open $report w]
foreach line $lines {
    puts $line
    puts $fh $line
}
close $fh
