# Constant-Cycle Hardware Private Circuits

This repository complements the work published in [Constant-Cycle Hardware Private Circuits](https://eprint.iacr.org/2025/1331). It provides the implementations of the CCHPC gadgets, along with circuit/architecture designs used in the case studies of the paper.

## Directory Structure
The `Implementations´ folder contains the following files. Both the CCHPC gadgets and the CCHPC-composed designs support configurable, arbitrary security orders. The testbenches are tailored to a specific security order as indicated.

The linear CCHPC gadget can be configured to implement either a CCHPC-XOR or CCHPC-XNOR. The non-linear CCHPC gadget supports configurations for CCHPC-AND, CCHPC-NAND, CCHPC-OR, and CCHPC-NOR. 


``` plaintext
Implementations
|
├── basic_components.v                 // DRP components (cf. Section 3) and basic reused modules  
│   
├── Gadgets
│   │
│   ├── RTL                            // Gadget implementations:
│   │   ├── inv_CCHPC.v                // - CCHPC-NOT (cf. Section 4.1.1)
│   │   ├── mux_CCHPC_wNAND.v          // - CCHPC-X(N)OR (cf. Section 4.1.2)
│   │   ├── linear_CCHPC_wNAND.v       // - CCHPC-MUX (cf. Section 4.1.2)
│   │   └── nonlinear_CCHPC_wNAND.v    // - non-linear CCHPC/CCHPC_RS (cf. Section 4.1.3)
│   │
│   └── TB                             // Testbenches for:
│       ├── linear_tb_d2.v             // - 2nd-order CCHPC-XOR 
│       ├── nonlinear_tb_d1.v          // - 1st-order CCHPC_RS-AND
│       └── nonlinear_tb_d2.v          // - 2nd-order CCHPC_RS-AND
│       ...                            // ...
│   
├── AES Boyar-Peralta S-box            // S-Box Case Study (cf. Section 5)
│   │
│   ├── RTL
│   │   └── sbox_bp_CCHPC_wNAND.v      // CCHPC/CCHPC_RS S-box
│   │
│   └── TB
│       └── sbox_bp_tb_d1.v            // 1st-order CCHPC_RS BP S-box testbench
│       
└── AES encryption core                // Round-based AES Case Study (cf. Section 5)
    │
    ├── RTL
    │   ├── CCHPC_AES_duality.v                             // CCHPC_PL AES with Duality
    │   ├── controller_CCHPC.v                              // AES controller
    │   ├── linear_CCHPC_wNAND_pipeline_layer0.v            // linear gadget (layer 0 only)
    │   ├── linear_CCHPC_wNAND_pipeline_consecutive.v       // linear gadget (except layer 0)
    │   ├── mux_CCHPC_wNAND_layer0.v                        // mux gadget (layer 0 only)
    │   ├── mux_CCHPC_wNAND_consecutive.v                   // mux gadget (except layer 0)
    │   ├── nonlinear_CCHPC_wNAND_pipeline_layer0.v         // non-linear gadget (layer 0 only)
    │   ├── nonlinear_CCHPC_wNAND_pipeline_consecutive.v    // non-linear gadget (except layer 0)
    │   ├── bitstate_reg_CCHPC.v                            // CCHPC representation register 
    │   ├── precharger_reg_CCHPC.v                          // (unshared) control signal register
    │   └── reg_pipeline.v                                  // configurable register pipeline
    |   
    └── TB
        ├── CCHPC_AES128_duality_tb_d1.v     // 1st-order CCHPC_PL Duality AES testbench
        ├── CCHPC_AES128_duality_tb_d2.v     // 2nd-order CCHPC_PL Duality AES testbench
        └── CCHPC_AES128_duality_tb_d3.v     // 3rd-order CCHPC_PL Duality AES testbench
```

## Simulation

We used Vivado 2022.1.2 to simulate the designs. It follows a step-by-step guide on how to use the testbenches in the source files accordingly.

1. Create a Vivado project.
2. Add the design sources:
    - Implementations/basic_components.v 
    - Implementations/Gadgets/RTL/*
    - Implementations/AES Boyar-Peralta S-box/RTL/*
    - Implementations/AES encryption core/RTL/*
3. Add the simulation sources:
    - Implementations/Gadgets/TB/*
    - Implementations/AES Boyar-Peralta S-box/TB/*
    - Implementations/AES encryption core/TB/*
4. Set the desired testbench as the top module.
5. Run the Simulation.

Each testbench includes one or more testvectors to verify correct computation.
Due to the nature of the CCHPC scheme, layers are executed/evaluated in consecutive clock cycles.

For the gadgets and S-Box implementations, inputs are applied sequentially to the unit under test. The outputs of each layer stabilize in the same clock cycle as the corresponding (share) inputs are applied, completing the computation within the layer. The outputs are checked during both the pre-charge and evaluation phases in the testbenches, and the TCL Console reports any erroneous states accodingly.

For the AES testbenches, all inputs are applied simultaneously to the cicuit. The outputs are then passed through register pipelines that compensate the clock-cycle offset. As a result, the final register at each output in the testbenches holds the complete result in the final clock cycle. The outputs are validated against the expected values to confirm correctness.