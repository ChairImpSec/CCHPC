# $\mathsf{Unrail}$

An optimization framework to reduce area of masked implementations with composable gadgets of constant cycle schemes (like CCHPC1 and CCHPC1.1).

## Installation

**ATTENTION**: This project requires a linux or macOS based system as the package graph-tool is not available for windows through pip or conda. If you are using Windows, execute pixi through Windows Subsystem Linux (WSL).

1. Install Pixi for dependency management [from the website](https://pixi.sh/)
2. Install dependencies (including python binaries) using `pixi install` (but this is optional since all dependencies will be installed automatically when invoking `pixi shell`)
3. Activate environment using `pixi shell`
4. Run $\mathsf{Unrail}$ by executing `python main.py [options]`
5. Exit the environment using `exit`

(All commands are run from the $\mathsf{Unrail}$ root folder)

## Usage

```sh
python main.py [-h] -f Path -o Path [-c Path] [--disable-f2b] [--disable-b2f] [--debug-f2b]
```

**Note:** Disabling one or both algorithms (Front-to-Back c.f. Section 5.1.2 or Back-to-Front c.f. Section 5.1.1) does no longer guarantee optimal results and should be treated as a debug option to explore the effects of the algorithms.

Parameters:

| Parameter       | Short form | Description                                                   |
| --------------- | ---------- | ------------------------------------------------------------- |
| `--help`        | `-h`       | Print usage help                                              |
| `--file`        | `-f`       | Path to the $\mathsf{Unrail}$ input file                      |
| `--output`      | `-o`       | Path to the directory where the output files will be saved    |
| `--config`      | `-c`       | Path to the config file overwriting default config            |
| `--disable-f2b` | n/a        | Disable Front-to-Back optimizations                           |
| `--disable-b2f` | n/a        | Disable Back-to-Front optimizations                           |
| `--debug-f2b`   | n/a        | Open interactive debug window to see min-st-cut results       |

## Config

$\mathsf{Unrail}$ allows overriding the default config suited for CCHPC1.1 generation using `-c` or `--config` and merges changes with the default config file.
You can find the default config under `/config/default.yml`.
The default config is setup for CCHPC1.1 gadgets and security order `d=1`
Here is an explanation of the config options:

### numshares

```yaml
numshares: int
```

Only used as a note in the stats file. This config exists because the area estimates are usually dependent on the number of shares (and security order) the gadget is being used with. To reflect this the number of shares is printed in the stats files.

### inline_modules

```yaml
inline_modules:
  XOR:
    map_to: MODULE_NAME
  XNOR:
    map_to: MODULE_NAME
  AND:
    map_to: MODULE_NAME
  NAND:
    map_to: MODULE_NAME
  OR:
    map_to: MODULE_NAME
  NOR:
    map_to: MODULE_NAME
  NOT:
    map_to: MODULE_NAME
```

Maps the $\mathsf{Unrail}$ operands (See Logic notation explanation below) to a module config.
`MODULE_NAME`must match a module name in the modules config section

### modules

```yaml
modules:
  MODULE_NAME:
    type: linear | non-linear | inversion
    inputs: string[]
    outputs: string[]
    clock_wire: string?
    precharge_wire: string?
    cost:
      single_rail: int
      dual_rail: int
    critical_path:
      single_rail: int
      dual_rail: int
    verilog_output:
      single_rail_module: string
      dual_rail_module: string
      config_bits: CONFIG_BIT_SETTING[]?
      random_bits:?
        name: string
        count: int
```

CONFIG_BIT_SETTING:

```yaml
name: string
value: string
```

Configures a module that will be used to parse the $\mathsf{Unrail}$ input files and generate an optimized verilog netlist from them.
Note that costs must be integers, not floats, as using floats can lead to floating point errors in the min-st-cut library.
Make sure the costs are accurate as they are used inside the Front-to-Back algorithm (c.f. Section 5.1.2)
Critical path is the critical path inside the module used for stats.
Random bits is the bit count needed for first order.

### register

```yaml
register:
  input: string
  output: string
  clock_wire: string
  precharge_wire: string
  cost:
    single_rail: int
    dual_rail: int
  verilog_output:
    single_rail_module: string
    dual_rail_module: string
```

Configures the register module that will be used in the generated verilog netlist.
Please not the information in the `modules` section as it is relevant for the register module as well.

## $\mathsf{Unrail}$ file format

$\mathsf{Unrail}$ introduces its own input file format it uses to create gadget designs from.
This section quickly explains the syntax:

### Wire names

Wire names need to consist of at least one alphabetical letter followed by an arbitrary amount of alphanumerical characters.
Vector notation like `a[3]` is not supported and will raise an error.

### Configuration

For $\mathsf{Unrail}$ to work, it needs to know which wires serve as data inputs, data outputs, and what the clock signal, precharge signal and randomness vector should be called.

| Description       | Syntax                      | Notes                                                          |
| ----------------- | --------------------------- | -------------------------------------------------------------- |
| Data input        | input `wirename` data       | The wire `wirename` must be used in the $\mathsf{Unrail}$ file |
| Data output       | output `wirename` data      | The wire `wirename` must be used in the $\mathsf{Unrail}$ file |
| Clock signal      | input `wirename` clock      | Must be set exactly once                                       |
| Precharge signal  | input `wirename` precharge  | Must be set exactly once                                       |
| Randomness vector | input `wirename` randomness | Must be set exactly once                                       |

### Logic notation

Logic notation follows this syntax:

```txt
WIRE1 = [WIRE2] OPERAND WIRE3
```

`WIRE1` and `WIRE3` are required, `WIRE2` must be ommitted for `NOT` operations and is required in other cases.
Supported operands are:

| Functionality | $\mathsf{Unrail}$ Operand |
| ------------- | ------------------------- |
| XOR           | ^                         |
| XNOR          | ~^                        |
| AND           | &                         |
| NAND          | ~&                        |
| OR            | \|                        |
| NOR           | ~\|                       |
| NOT           | ~                         |

## Examples

You can find example S-box designs in the `/examples` folder. Results from our runs that are included in our paper (c.f. Section 6.1, Table 5 ) are included in `/results`.

## S-box Testbench

You can find the testbench we used to verify the correctness of generated verilog results in the `/testbench` folder.
Along the testbench file `/testbench/aes_sbox_tb.v` we included dummy implementations of the CCHPC1.1 gadgets in the file `/testbench/tb_modules.v`.
We used Vivado 2025.2 for simulation.

The testbench works for all existing examples in the examples folder (excluding the testcases).
Little-Endian and Big-Endian notation has been accounted for in the $\mathsf{Unrail}$ files with the order of input and output wires.

## Results

The results folder contains the results we used for the paper and covers all example S-boxes we provide in the examples folder.
All examples were computed with and without the optimizations.
Folders containing `graph_b2f_optimized.pdf` and `graph_f2b_optimized.pdf` contain the optimizations, the others are simply a conversion from $\mathsf{Unrail}$ file format into verilog without the Front-to-Back (c.f. Section 5.1.2) and Back-to-Front (c.f. Section 5.1.1) optimizations.

The `stats.txt` includes useful statistics about the resulting graph and a coarse expected area estimate (Note that the area estimate / 1000 estimates Gate Equivalents).

The included pdf files visualize the circuit at different stages of the program. The order of creation is as follows:

1. `graph_created.pdf` (No optimizations have taken place, the working graph has been created)
2. `graph_inversion_merged.pdf` (NOT operations have been merged into surrounding gadgets)
3. `graph_b2f_optimized.pdf` (The Back-to-Front algorithm (c.f. Section 5.1.1) has been applied)
4. `graph_f2b_optimized.pdf` (The Front-to-Back algorithm (c.f. Section 5.1.2) has been applied)

Depending on the cli flags, some files are missing when the step where they generate is disabled.

The graphs follow the following color notation:

| Graph Element            | Description                                                                     |
| ------------------------ | ------------------------------------------------------------------------------- |
| Blue background pill     | Register                                                                        |
| White background pill    | Linear gadget / Linear inversion                                                |
| Red background pill      | Non-linear gadget                                                               |
| Yellow background pill   | Dual-rails to single-rail mapper                                                |
| ---                      | ---                                                                             |
| Green border pill        | Optimized gadget (DRtSR for non-linear, SRtSR for linear, SRtSR for register)   |
| Black border pill        | Unoptimized gadget (DRtDR for non-linear, SRtSR for linear, SRtDR for register) |
| ---                      | ---                                                                             |
| Red edge                 | Edge connects to non-linear gadget                                              |
| Blue edge                | Edge connects to register                                                       |
| Yellow edge              | Edge connects to mapper gadget                                                  |

### Regenerating results

To regenerate the results with $\mathsf{Unrail}$, you can execute the provided `regenerate_results.sh` script in the provided pixi shell environment.
