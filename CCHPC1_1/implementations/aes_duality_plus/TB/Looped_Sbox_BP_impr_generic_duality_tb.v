`timescale 1ps/1ps

// -----------------------------------------------------------------------------
// Randomized functional testbench for Looped_Sbox_BP_impr_generic_duality
//
// - arbitrary security order
// - random plaintext sharing
// - fresh randomness every clock cycle
// - two consecutive S-box executions per test run
// -----------------------------------------------------------------------------

module Looped_Sbox_BP_impr_generic_duality_tb;

    // -------------------------------------------------------------------------
    // Parameters and local parameters
    // -------------------------------------------------------------------------

    parameter security_order   = 1;
    parameter FORWARD_R        = 0;
    parameter wAOI22_linear    = 1;
    parameter wAOI22_nonlinear = 0;
    parameter TEST_COUNT       = 1000;

    localparam integer d = security_order+1;

    localparam integer nonlinear_count_DRtDR = 15;
    localparam integer nonlinear_count_DRtSR = 18;

    localparam integer RAND_COUNT             = (d*(d-1))/2;
    localparam integer RAND_COUNT_CONSEC      = ((d-1)*(d-2))/2;
    localparam integer RAND_COUNT_CONSEC_SAFE = (RAND_COUNT_CONSEC > 0) ? RAND_COUNT_CONSEC : 1;

    localparam integer SBOX_EXECUTIONS = 2;

    localparam integer RAND_WIDTH_SR = nonlinear_count_DRtDR*(d-1) + nonlinear_count_DRtSR*RAND_COUNT;
    localparam integer RAND_WIDTH_DR = (RAND_COUNT_CONSEC > 0) ? nonlinear_count_DRtDR*2*RAND_COUNT_CONSEC : 2;

    // -------------------------------------------------------------------------
    // AES S-box reference
    // -------------------------------------------------------------------------

    // AES_SBOX stores entries in input order 8'h00 ... 8'hff
    // Lookup: AES_SBOX[2047 - 8*input -: 8]
    localparam [2047:0] AES_SBOX = 2048'h637c777bf26b6fc53001672bfed7ab76ca82c97dfa5947f0add4a2af9ca472c0b7fd9326363ff7cc34a5e5f171d8311504c723c31896059a071280e2eb27b27509832c1a1b6e5aa0523bd6b329e32f8453d100ed20fcb15b6acbbe394a4c58cfd0efaafb434d338545f9027f503c9fa851a3408f929d38f5bcb6da2110fff3d2cd0c13ec5f974417c4a77e3d645d197360814fdc222a908846eeb814de5e0bdbe0323a0a4906245cc2d3ac629195e479e7c8376d8dd54ea96c56f4ea657aae08ba78252e1ca6b4c6e8dd741f4bbd8b8a703eb5664803f60e613557b986c11d9ee1f8981169d98e949b1e87e9ce5528df8ca1890dbfe6426841992d0fb054bb16;

    function [7:0] aes_sbox_lookup;
        input [7:0] value;
        begin
            aes_sbox_lookup = AES_SBOX[2047 - 8*value -: 8];
        end
    endfunction

    // -------------------------------------------------------------------------
    // Intermediates
    // -------------------------------------------------------------------------

    reg CLK;
    reg rst;

    reg  [RAND_WIDTH_SR-1:0] r_SR;
    reg  [RAND_WIDTH_DR-1:0] r_duality_eval;
    reg  [RAND_WIDTH_DR-1:0] r_duality0;
    reg  [RAND_WIDTH_DR-1:0] r_duality1;

    wire [RAND_WIDTH_DR-1:0] r_duality_phase0;
    wire [RAND_WIDTH_DR-1:0] r_duality_phase1;

    reg  [8*d-1:0] a;
    wire [8*d-1:0] z;

    wire [7:0] out;

    wire [d-2:0] prch0;
    wire [d-2:0] prch1;

    integer test_idx;
    integer error_count;
    integer seed;

    reg [7:0] input_value;
    reg [7:0] expected_value;


    // -------------------------------------------------------------------------
    // DUT
    // -------------------------------------------------------------------------

    // ALIGN_OUT aligns the order-specific output-share delay
    Looped_Sbox_BP_impr_generic_duality #(
        .security_order(security_order),
        .FORWARD_R(FORWARD_R),
        .wAOI22_linear(wAOI22_linear),
        .wAOI22_nonlinear(wAOI22_nonlinear),
        .ALIGN_OUT(1'b1)
    ) DUT (
        .clk(CLK),
        .rst(rst),
        .r_SR(r_SR),
        .r_duality0(r_duality0),
        .r_duality1(r_duality1),
        .a(a),
        .z(z),
        .prch0_o(prch0),
        .prch1_o(prch1)
    );


    // -------------------------------------------------------------------------
    // Output recombination
    // -------------------------------------------------------------------------

    genvar out_bit;
    generate
        for (out_bit = 0; out_bit < 8; out_bit=out_bit+1) begin : gen_output_recombination_
            assign out[out_bit] = ^z[out_bit*d +: d];
        end
    endgenerate


    // -------------------------------------------------------------------------
    // Random input sharing
    // -------------------------------------------------------------------------

    task set_random_sharing;
        input [7:0] value;

        integer bit_idx;
        integer share_idx;
        reg share_xor;

        begin
            a = {8*d{1'b0}};

            for (bit_idx = 0; bit_idx < 8; bit_idx=bit_idx+1) begin

                share_xor = 1'b0;

                // Choose d-1 shares randomly
                for (share_idx = 0; share_idx < d-1; share_idx=share_idx+1) begin
                    a[bit_idx*d+share_idx] = $random(seed);
                    share_xor = share_xor ^ a[bit_idx*d+share_idx];
                end

                a[bit_idx*d+d-1] = value[bit_idx] ^ share_xor;

            end
        end
    endtask


    // -------------------------------------------------------------------------
    // External randomness generation and DRP phase alignment
    // -------------------------------------------------------------------------

    // Fresh randomness is supplied once per clock cycle.
    // The dual-rail randomness is phase-aligned with prch0/prch1 and then
    // registered, matching the externalized randomness register boundary of
    // the nonlinear gadgets.

    function random_prch;
        input integer rand_pos;
        input [d-2:0] prch;

        integer layer;
        integer layer_offset;

        begin
            random_prch = 1'b0;

            for (layer = 1; layer < d-1; layer=layer+1) begin
                layer_offset = ((layer-1)*(2*d-layer-2))/2;

                if ((rand_pos >= layer_offset) &&
                    (rand_pos < layer_offset + d-1-layer))
                    random_prch = prch[layer-1];
            end
        end
    endfunction


    genvar rand_pair;
    generate
        if (RAND_COUNT_CONSEC > 0) begin : gen_randomness_phase_alignment_

            for (rand_pair = 0; rand_pair < RAND_WIDTH_DR/2; rand_pair=rand_pair+1) begin : gen_randomness_pair_

                localparam integer RAND_POS = rand_pair % RAND_COUNT_CONSEC_SAFE;

                assign r_duality_phase0[2*rand_pair +: 2] =
                    random_prch(RAND_POS, prch0) ? 2'b00 : r_duality_eval[2*rand_pair +: 2];

                assign r_duality_phase1[2*rand_pair +: 2] =
                    random_prch(RAND_POS, prch1) ? 2'b00 : r_duality_eval[2*rand_pair +: 2];

            end

        end else begin : gen_no_consecutive_randomness_

            // First security order has no consecutive-layer randomness
            assign r_duality_phase0 = 2'b00;
            assign r_duality_phase1 = 2'b00;

        end
    endgenerate


    // Register the phase-aligned randomness
    always @(posedge CLK) begin
        r_duality0 <= r_duality_phase0;
        r_duality1 <= r_duality_phase1;
    end


		// Randoness index mapping
    integer random_idx;

    always @(posedge CLK) begin

        for (random_idx = 0; random_idx < RAND_WIDTH_SR; random_idx=random_idx+1)
            r_SR[random_idx] <= $random(seed);

        if (RAND_COUNT_CONSEC > 0) begin
            for (random_idx = 0; random_idx < RAND_WIDTH_DR/2; random_idx=random_idx+1)
                r_duality_eval[2*random_idx +: 2] <= $random(seed) ? 2'b01 : 2'b10;
        end else begin
            r_duality_eval <= 2'b00;
        end

    end


    // -------------------------------------------------------------------------
    // Test sequence
    // -------------------------------------------------------------------------
    
    always #5000 CLK = ~CLK;

    initial begin

        CLK           	= 1'b0;
        rst           	= 1'b1;
        a             	= {8*d{1'b0}};
        r_SR          	= {RAND_WIDTH_SR{1'b0}};
        r_duality_eval 	= {RAND_WIDTH_DR{1'b0}};
        r_duality0     	= {RAND_WIDTH_DR{1'b0}};
        r_duality1     	= {RAND_WIDTH_DR{1'b0}};
        input_value   	= 8'h00;
        expected_value 	= 8'h00;
        error_count   	= 0;
        seed          	= 32'h12345678;

        $display("CONFIGURATION:");
        $display("  DESIGN         = Looped_BP_impr_Sbox_generic_duality");
        $display("  security_order = %0d", security_order);
        $display("  NUM_SHARES     = %0d", d);
        $display("  NUM_TESTS      = %0d", TEST_COUNT);
        $display("  SBOX_EXECUTIONS= %0d", SBOX_EXECUTIONS);
        $display("");
        $display("START: randomized AES S-box functional tests");
        $display("");

        // Randomness is supplied continuously by the clocked logic above
        // Initialize the pre-charge pipeline and registered DR randomness
        repeat (security_order) @(posedge CLK);

        for (test_idx = 0; test_idx < TEST_COUNT; test_idx=test_idx+1) begin

            // Apply a new primary input while leaving reset
            @(negedge CLK);

            input_value    = $random(seed);
            expected_value = aes_sbox_lookup(aes_sbox_lookup(input_value));

            set_random_sharing(input_value);
            rst = 1'b0;

            // The first S-box result appears after security_order rising edges
            // Every additional looped S-box execution needs one more cycle
            repeat (security_order + SBOX_EXECUTIONS - 1) @(posedge CLK);

            @(negedge CLK);

            if (out !== expected_value) begin
                error_count = error_count + 1;
                $display(
                    "ERROR test=%0d order=%0d input=%02h expected=%02h got=%02h time=%0t",
                    test_idx,
                    security_order,
                    input_value,
                    expected_value,
                    out,
                    $time
                );
            end

            // Re-arm the controller and pre-charge-control pipelines before
            // loading the next independent input
            rst = 1'b1;
            repeat (security_order) @(posedge CLK);

        end

        if (error_count == 0) begin
            $display(
                "PASS: %0d/%0d random tests with %0d consecutive BP_impr S-box executions correct at security order %0d",
                TEST_COUNT,
                TEST_COUNT,
                SBOX_EXECUTIONS,
                security_order
            );
        end else begin
            $display(
                "FAIL: %0d errors in %0d random tests with %0d consecutive BP_impr S-box executions at security order %0d",
                error_count,
                TEST_COUNT,
                SBOX_EXECUTIONS,
                security_order
            );
        end

        $finish;

    end

endmodule

