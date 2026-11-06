# Tool-assisted Evaluation

This folder contains synthesized netlists, PROLEAD configurations, and recorded results for evaluating the CCHPC1.1 gadgets and looped AES S-box under the RR probing model.

## Designs and configurations

The evaluated designs are the [CCHPC1.1-AND gadget](gadgets/) (`DRtDR` with dual-rail outputs, [`DRtSR`](../implementations/gadgets/RTL/nonlinear_CCHPC1_1_generic_DRtSR.v) variant with single-rail outputs, Section 4.1.2) and the [looped BP-improved AES S-box with duality+](s-box/). The PROLEAD configurations for the gadgets are stored in the respective parent folders. The PROLEAD configuration for the S-box is stored alongside its netlist. Each design folder includes a `prolead_console_log` with the recorded evaluation.

## Running PROLEAD

All supplied netlists were synthesized with `ALIGN_OUT=1`. This delays outputs from earlier layers so that all output shares of the same computation are available together at the timing of the final layer. This alignment is required when the PROLEAD configuration enables the functional correctness check through `output_shares` and `expected_output`, ensuring that the recombined shares match the expected result.

Install PROLEAD following its [installation guide](https://github.com/ChairImpSec/PROLEAD/wiki/Installation) and obtain its Nangate 45 nm JSON library (`nang45`) as described in the [wiki](https://github.com/ChairImpSec/PROLEAD/wiki/Quickstart).

**Library configuration:** As in the paper, manually ensure that every combinational gate in the `nang45` library file has `"type": "relaxed_gate"` to use the RR model's conditional probe propagation. Not every PROLEAD version sets this for all gate types by default. Enabling `relaxed_model` in the evaluation configuration alone is insufficient. See the [cell-library documentation](https://github.com/ChairImpSec/PROLEAD/wiki/Advanced-User-Guides).

Use the supplied synthesized netlists and matching configurations. No synthesis is needed:

```sh
PROLEAD -d /path/to/netlist.v -c /path/to/config.json \
  -m TOP_MODULE -l /path/to/nang45.json -n nang45
```

Replace `PROLEAD` with the path to your executable if needed, such as `/path/to/prolead/build/release/prolead`. Optionally append `> prolead_console_log 2>&1` to the command to capture both standard output and errors in a console log. This overwrites any existing log with that name in the current directory.

Set `TOP_MODULE` to `nonlinear_CCHPC1_1_generic_DRtDR` for the gadget or `Looped_Sbox_BP_impr_generic_duality` for the S-box. See PROLEAD's [usage guide](https://github.com/ChairImpSec/PROLEAD/wiki/Usage) for further options.
