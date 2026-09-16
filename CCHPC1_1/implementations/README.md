# CCHPC1.1 RTL

This directory contains generic RTL implementations of the **CCHPC1.1** linear and non-linear gadgets, including duality/duality+ variants and the corresponding BP-improved AES S-box and looped AES examples.

## Files

| File / group | Purpose |
|---|---|
| `basic_components.v` | Atomic gates, registers, pre-charge elements, SR/DR conversion, DRP-XOR trees, DRP-MUX4 components, and MTG helpers (cf. Sections 3 and 4.1). |
| `linear_CCHPC1_1_generic_*.v` | Generic CCHPC1.1 linear gadgets. `DRtDR` keeps the CCHPC dual-rail representation. `SRtSR` is used in unrailed regions (cf. Section 5.1). |
| `nonlinear_CCHPC1_1_generic_DRtDR*.v` | Full **CCHPC1.1-AND** variants with dual-rail outputs for layers `l > 0` (cf. Section 4.1.2). Variants cover regular/duality operation, randomness conversion, and optional pre-charge-control integration. |
| `nonlinear_CCHPC1_1_generic_DRtSR*.v` | **CCHPC1.1-AND-DR2SR** variants. Only one rail is retained for layers `l > 0`. These are useful where no succeeding non-linear CCHPC gadget requires a dual-rail output, e.g., B2F-optimized regions (cf. Sections 4.1.2 and 5.1.1). |
| `nonlinear_CCHPC1_1_generic_layer0.v` | Layer-0 implementation of the non-linear gadgets. |
| `nonlinear_CCHPC1_1_generic_precomp.v` | Single-rail MTG pre-processing and the required share/randomness pipelining for layers `l > 0` (cf. Section 4.1.2). |
| `nonlinear_CCHPC1_1_generic_*consecutive.v` | DRP selection/compression logic for consecutive layers, including duality variants. |
| `Sbox_BP_impr_generic_duality_reg.v` | BP-improved AES S-box built from the generic CCHPC1.1 gadgets (cf. Section 5.1.3). |
| `Looped_Sbox_BP_impr_generic_duality.v` | Looped/duality+ S-box integration for consecutive evaluations. |
| `AES_keySchedule_generic_duality.v`, `AES_mixOneColumn_generic.v`, `AES_controller_CCHPC1_1_generic_duality.v` | Masked AES blocks. |
| `Looped_AES_Round_generic_duality.v` | Low-latency looped AES round using the CCHPC1.1 S-box and duality+ structure (cf. Section 5.1.4). |
| `reg_*.v` | Shared register stage. `SRtSR` uses regular DFFs for each share. `SRtDR` generates pre-charged dual-rail signals for layers `l > 0`, either as a single instance or for two duality instances. |

## Configuration options

| Parameter | Meaning / when useful |
|---|---|
| `security_order` | Masking security order. The implementation uses `security_order + 1` shares. |
| `CONF` | Selects AND/NAND/NOR/OR functionality of the generic non-linear gadget. |
| `DUALITY` | Selects regular or duality implementation in the generic testbench. |
| `OUT_DR` | Selects the two non-linear gadget variants from Section 4.1.2. **`1` = CCHPC1.1-AND (`DRtDR`)**, with dual-rail outputs for `l > 0`. **`0` = CCHPC1.1-AND-DR2SR (`DRtSR`)**, with a single retained rail for `l > 0`. |
| `FORWARD_R` | **`0` = construction from Section 4.1.2.** `1` enables a forwarding optimization. For security orders greater than one, it slightly reduces the area of the `DRtDR` variants and avoids the usual chaining in all non-final layers. Their output shares are assigned directly from the corresponding fresh-randomness contribution, while the previous layer result is forwarded into the next layer's last MTG. This is similar to the random-share structure used by LMDPL [SBHM20], although LMDPL itself is limited to first-order security. |
| `wRandCONV` | Uses variants that convert the required fresh randomness from single rail to DRP internally. If disabled, the `DRtDR` variants expect the required dual-rail randomness to be provided externally and correctly phase-aligned/pre-charged. |
| `RAND_REG` | Forces fresh randomness through a register stage. This can be useful when required by the chosen PRNG integration, e.g., unrolled Trivium [CMM+24]. |
| `OPT_PRCH` | Uses the combined SR-to-DR conversion/pre-charge implementation with `prch`/`prch_n`. This can reduce conversion/pre-charge area depending on synthesis. |
| `PRCHN_PROVIDED` (for `*_wPRCHn` modules) | Uses externally provided `prch_n` signals instead of regenerating them inside each gadget. Relevant together with `OPT_PRCH`. |
| `ALIGN_OUT` | Delays earlier output shares so that all shares are aligned to the final gadget layer. |
| `wAOI22_linear` | Enables the AOI22-based DRP realization for the linear gadgets. |
| `wAOI22_nonlinear` | Enables the AOI22-based DRP realization for the non-linear gadgets. |

### AOI22 implementation option

The wAOI22 parameter realizes the area-oriented mapping discussed for the DRP components in the paper, including the **area-reduced DRP-MUX4 from Appendix A**.

**FPGA caution:** the monotonicity arguments assume the relevant DRP components are implemented as the intended atomic cells. An `AOI22` mapped onto an FPGA LUT is not an atomic AOI22 standard cell. Its internal LUT implementation and routing may therefore violate the gate-level assumptions even when the Boolean function is identical. The AOI22 option should consequently not be assumed secure on an FPGA without validating the mapped implementation.

## Reference configuration

The reference module families are `nonlinear_CCHPC1_1_generic_DRtDR`, `nonlinear_CCHPC1_1_generic_DRtDR_duality`, `nonlinear_CCHPC1_1_generic_DRtSR`, and `nonlinear_CCHPC1_1_generic_DRtSR_duality`. With their default parameter values, these are the repository's baseline regular and duality implementations of **CCHPC1.1-AND** and **CCHPC1.1-AND-DR2SR**.

In all four modules, **`FORWARD_R = 0`**, so the non-linear construction follows Section 4.1.2 of the paper. The `DRtDR` modules default to `wAOI22 = 1` and `OPT_PRCH = 1`. The `DRtSR` modules default to `wAOI22 = 0` and `RAND_REG = 0`. In all cases, `CONF = 2'b00`, input/output inversions are disabled, `ALIGN_OUT = 0`, and `security_order = 1` unless overridden. The `_wRandCONV` and `_wPRCHn` modules provide alternative integration choices around these gadget families.

## Testbenches

`nonlinear_CCHPC1_1_generic_exhaustive_tb.v` exhaustively exercises the selected generic non-linear gadget configuration. It checks pre-charge behavior, valid evaluated dual-rail encoding, and recombined functional correctness for the selected security order and implementation options.

`Looped_Sbox_BP_impr_generic_duality_tb.v` is a **randomized functional test** of the looped BP-improved CCHPC1.1 AES S-box. Each test run always performs **two consecutive S-box executions**, exercising the intended consecutive/duality+ operation.

`Looped_AES_Round_generic_duality_tb.v` is a **randomized functional test** of the integrated looped AES round, including the masked S-box, round datapath, and key-schedule integration.

## References

[SBHM20] P. Sasdrich, B. Bilgin, M. Hutter, and M. E. Marson, *Low-Latency Hardware Masking with Application to AES*, IACR TCHES 2020(2), 300–326. [IACR ePrint 2020/051](https://eprint.iacr.org/2020/051).

[CMM+24] G. Cassiers, L. Masure, C. Momin, T. Moos, A. Moradi, and F.-X. Standaert, *Randomness Generation for Secure Hardware Masking - Unrolled Trivium to the Rescue*, IACR Communications in Cryptology, 1(2):4, 2024.
