# Area Efficiency in Constant-Cycle Schemes

This repository complements the work published in [Area Efficiency in Constant-Cycle Schemes - CCHPC1.1 and Architectural Overhead Reduction Applied to AES](https://doi.org/10.46586/tches.v2026.i4.208-236) by **Daniel Lammers, Lukas Weber, and Amir Moradi**. The artifact is licensed under [GNU GPLv3](LICENSE). It provides the following contents:

| Subfolder | Contents |
| --- | --- |
| implementations | Verilog modules for the CCHPC1.1 gadget implementations, the $\text{duality}^+$ AES encryption core, and testbenches |
| tool-assisted evaluation | [PROLEAD](https://github.com/ChairImpSec/PROLEAD) \[MM22\] configuration files and results |
| unrail | $\mathsf{Unrail}$ framework for architectural optimizations with results |

## Implementations

The linear CCHPC1.1 gadget can be configured to implement either a CCHPC1.1-XOR or CCHPC1.1-XNOR. The non-linear CCHPC1.1 gadget supports configurations for CCHPC1.1-AND, CCHPC1.1-NAND, CCHPC1.1-OR, and CCHPC1.1-NOR. It also includes configuration parameters relevant to $\mathsf{Unrail}$. Testbenches, gadgets, and the AES core are provided for the first three security orders.

We used Vivado 2022.1.2 to simulate the designs. Create a Vivado project and add all design and simulation sources. Set the desired testbench as the top module and run the simulation. Each testbench includes one or more testvectors to verify correct computation.
Due to the nature of the CCHPC1.1 scheme, layers are executed/evaluated in consecutive clock cycles.

## Tool-assisted Evaluation

The [tool-assisted evaluation](<tool-assisted evaluation/>) folder contains synthesized netlists, [PROLEAD](https://github.com/ChairImpSec/PROLEAD) \[MM22\] configurations, and results for the gadgets and looped AES S-box under the RR probing model. See its [README](<tool-assisted evaluation/README.md>) for the evaluated designs and usage.

## $\mathsf{Unrail}$

$\mathsf{Unrail}$ is an optimization framework to reduce area of masked implementations with composable gadgets of constant cycle schemes (like CCHPC1 and CCHPC1.1). An extensive documentation is provided in the subfolders README file.
