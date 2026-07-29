# unrail

An optimization framework to reduce area of dual rail secured hardware circuits

## Installation

**ATTENTION**: This project requires a linux or macos based system as the package graph-tool is not available for windows through pip or conda. If you are using Windows, execute pixi through Windows Subsystem Linux (WSL)

1. Install Pixi for dependency management [from the website](https://pixi.sh/)
2. Install dependencies (including python binaries) using `pixi install` (but this is optional since all dependencies will be installed automatically when invoking `pixi shell`)
3. Activate environment using `pixi shell`
4. Run unrail by executing `python main.py [options]`
5. Exit the environment using `exit`

(All commands are run from the root folder of this project)

## Usage

```sh
python main.py [-h] -f Path -o Path [-c Path] [--disable-f2b] [--disable-b2f] [--debug-f2b]
```

**Note:** Disabling one or both algorithm does no longer guarantee optimal results and should be treated as a debug option to explore the effects of the algorithms.

Parameters:

| Parameter       | Short form | Description                                                   |
| --------------- | ---------- | ------------------------------------------------------------- |
| `--help`        | `-h`       | Print usage help                                              |
| `--file`        | `-f`       | Path to the Unrail input file                                 |
| `--output`      | `-o`       | Path to the directory where the output files will be saved    |
| `--config`      | `-c`       | Path to the config file overwriting default config            |
| `--disable-f2b` | n/a        | Disable front to back optimizations                           |
| `--disable-b2f` | n/a        | Disable back to front optimizations                           |
| `--debug-f2b`   | n/a        | Open interactive debug window to see min-st-cut results       |

## Config

Unrail allows overriding the default config suited for CCHPC1.1 generation using `-c` or `--config`.
You can find the default config under `/config/default.yml`

### Examples

You can find example sbox designs in the `/examples` folder. Results from our runs that are included in our paper are included in `/results`.
Note the order of input and output wires in the unrail files as some implementations utilize little-endian and others big-endian notation.

### SBox Testbench

You can find the testbench we used to verify the correctness of generated verilog results in the `/testbench` folder.
Along the testbench file `/testbench/aes_sbox_tb.v` we included dummy implementations of the CCHPC1.1 gadgets in the file `/testbench/tb_modules.v`
We used Vivado 2025.2 for simulation.
