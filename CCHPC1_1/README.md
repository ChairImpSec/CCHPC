# Area Efficiency in Constant-Cycle Schemes

This repository complements the work published in [Area Efficiency in Constant-Cycle Schemes - CCHPC1.1 and Architectural Overhead Reduction Applied to AES](https://doi.org/10.46586/tches.v2026.i4.208-236) by Daniel Lammers, Lukas Weber, and Amir Moradi. The artifact is licensed under [GNU GPLv3](LICENSE). It provides the following contents:

| Subfolder | Contents |
| --- | --- |
| [implementations](implementations/) | Generic CCHPC1.1 gadgets, looped BP-improved AES S-box and AES round designs with $\text{duality}^+$, and configurable testbenches. The RTL supports arbitrary security orders and includes configuration options for $\mathsf{Unrail}$. See the [README](implementations/README.md) for details. |
| [tool-assisted evaluation](<tool-assisted evaluation/>) | Synthesized netlists, [PROLEAD](https://github.com/ChairImpSec/PROLEAD) [\[MM22\]](https://eprint.iacr.org/2022/965) configurations, and results for the gadgets and looped AES S-box under the RR probing model [\[MM24\]](https://eprint.iacr.org/2024/1277). See the [README](<tool-assisted evaluation/README.md>) for the evaluated designs and usage. |
| [unrail](unrail/) | $\mathsf{Unrail}$ framework for reducing the area of masked implementations with composable gadgets of constant-cycle schemes (like CCHPC1 [\[LMDM25\]](https://eprint.iacr.org/2025/1331) and CCHPC1.1). See the [README](unrail/README.md) for detailed documentation and usage. |

## References

\[MM22\] Nicolai Müller and Amir Moradi. [PROLEAD: A Probing-Based Hardware Leakage Detection Tool](https://eprint.iacr.org/2022/965). *IACR Transactions on Cryptographic Hardware and Embedded Systems*, 2022(4), 311–348.

\[MM24\] Nicolai Müller and Amir Moradi. [Robust but Relaxed Probing Model](https://eprint.iacr.org/2024/1277). *IACR Transactions on Cryptographic Hardware and Embedded Systems*, 2024(4), 451–482.

\[LMDM25\] Daniel Lammers, Nicolai Müller, Siemen Dhooghe, and Amir Moradi. [Constant-Cycle Hardware Private Circuits](https://eprint.iacr.org/2025/1331). *IACR Transactions on Cryptographic Hardware and Embedded Systems*, 2025(4).
