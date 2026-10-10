`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Technische Universität Darmstadt, Chair of Implementation Security
// Engineer: Lukas Weber
// 
// Module Name: sbox_duality_tb
// Description: AES SBox Testbench to verify unrail tool output in duality mode (--duality)
// 
// Dependencies: unrail output of an AES S-box example generated with --duality (optimized.v) and the gadget dummies (tb_modules.v)
// 
// Additional Comments:
//   Configure the parameters according to the header of the unrail output.
//   Every input byte is tested with `trials` random input sharings and random fresh randomness in both duality phases:
//   phase 0 evaluates duality instance 0 (prch0 = 0) while instance 1 is pre-charged (prch1 = 1), phase 1 vice versa.
//   Dual-rail wires are packed as [4*(d-1):0] = {duality1 [4*(d-1):2*(d-1)+1], duality0 [2*(d-1):1], layer0 [0]}.
//   The output is reconstructed from all shares, invalid encodings of the evaluating instance and a pre-charged
//   instance that is not (0,0) are counted as failures.
// 
//////////////////////////////////////////////////////////////////////////////////


module sbox_duality_tb();
    parameter integer security_order         = 1;
    parameter integer random_bit_count_dr    = 14; // "Random Bit Count (dual-rail output gadgets)"
    parameter integer random_bit_count_drtsr = 18; // "Random Bit Count (dual-rail to single-rail gadgets)"
    parameter integer disable_f2b            = 0;  // 1 if "F2B Algorithm: Disabled"
    parameter integer disable_b2f            = 0;  // 1 if "B2F Algorithm: Disabled"
    parameter integer inverse                = 0;  // 1 for inverse AES S-boxes
    parameter integer trials                 = 8;  // random sharings per input value and duality phase

    localparam integer d                      = security_order + 1;
    localparam integer RAND_COUNT             = (d*(d-1))/2;
    localparam integer RAND_COUNT_CONSEC      = ((d-1)*(d-2))/2;
    localparam integer RAND_COUNT_CONSEC_SAFE = (RAND_COUNT_CONSEC > 0) ? RAND_COUNT_CONSEC : 1;

    localparam integer IN_W  = disable_f2b ? 4*(d-1)+1 : d;
    localparam integer OUT_W = disable_b2f ? 4*(d-1)+1 : d;

    localparam integer R_SR_W    = (d-1)*random_bit_count_dr;
    localparam integer R_DR_W    = (2*RAND_COUNT_CONSEC_SAFE)*random_bit_count_dr;
    localparam integer R_DRTSR_W = RAND_COUNT*random_bit_count_drtsr;

    reg  [8*IN_W-1:0]  dut_input;   // x0 (MSB) at [IN_W-1:0]
    wire [8*OUT_W-1:0] dut_output;  // s0 (MSB) at [OUT_W-1:0]
    reg  [((R_SR_W    > 0) ? R_SR_W    : 1)-1:0] r_sr;
    reg  [((R_DR_W    > 0) ? R_DR_W    : 1)-1:0] r_dr0;
    reg  [((R_DR_W    > 0) ? R_DR_W    : 1)-1:0] r_dr1;
    reg  [((R_DRTSR_W > 0) ? R_DRTSR_W : 1)-1:0] r_sr_drtsr;
    wire         clk = 1'b0;
    reg  [d-2:0] prch0;
    reg  [d-2:0] prch1;

    `define SBOX_DUALITY_TB_PORTS \
        .x0(dut_input[0*IN_W +: IN_W]), .x1(dut_input[1*IN_W +: IN_W]), .x2(dut_input[2*IN_W +: IN_W]), .x3(dut_input[3*IN_W +: IN_W]), \
        .x4(dut_input[4*IN_W +: IN_W]), .x5(dut_input[5*IN_W +: IN_W]), .x6(dut_input[6*IN_W +: IN_W]), .x7(dut_input[7*IN_W +: IN_W]), \
        .clk(clk), .prch0(prch0), .prch1(prch1), \
        .s0(dut_output[0*OUT_W +: OUT_W]), .s1(dut_output[1*OUT_W +: OUT_W]), .s2(dut_output[2*OUT_W +: OUT_W]), .s3(dut_output[3*OUT_W +: OUT_W]), \
        .s4(dut_output[4*OUT_W +: OUT_W]), .s5(dut_output[5*OUT_W +: OUT_W]), .s6(dut_output[6*OUT_W +: OUT_W]), .s7(dut_output[7*OUT_W +: OUT_W])

    // unrail only creates the randomness ports of non-empty randomness pools
    generate
        if (random_bit_count_dr > 0 && random_bit_count_drtsr > 0) begin : gen_dut_
            unrail_module #(.security_order(security_order)) dut (`SBOX_DUALITY_TB_PORTS, .unvectored_r_sr(r_sr), .unvectored_r_dr0(r_dr0), .unvectored_r_dr1(r_dr1), .unvectored_r_sr_drtsr(r_sr_drtsr));
        end else if (random_bit_count_dr > 0) begin : gen_dut_
            unrail_module #(.security_order(security_order)) dut (`SBOX_DUALITY_TB_PORTS, .unvectored_r_sr(r_sr), .unvectored_r_dr0(r_dr0), .unvectored_r_dr1(r_dr1));
        end else if (random_bit_count_drtsr > 0) begin : gen_dut_
            unrail_module #(.security_order(security_order)) dut (`SBOX_DUALITY_TB_PORTS, .unvectored_r_sr_drtsr(r_sr_drtsr));
        end else begin : gen_dut_
            unrail_module #(.security_order(security_order)) dut (`SBOX_DUALITY_TB_PORTS);
        end
    endgenerate

    `undef SBOX_DUALITY_TB_PORTS


    //-----------------------------------------
    //-- reference S-box ----------------------
    //-----------------------------------------

    function [7:0] gf_mul(input [7:0] a, input [7:0] b);
        integer k;
        reg [7:0] p, x;
        begin
            p = 8'h00;
            x = a;
            for (k = 0; k < 8; k = k + 1) begin
                if (b[k]) p = p ^ x;
                x = {x[6:0], 1'b0} ^ (x[7] ? 8'h1b : 8'h00);
            end
            gf_mul = p;
        end
    endfunction

    function [7:0] gf_inv(input [7:0] a); // a^254, maps 0 to 0
        integer k;
        reg [7:0] r;
        begin
            r = 8'h01;
            for (k = 0; k < 254; k = k + 1) r = gf_mul(r, a);
            gf_inv = r;
        end
    endfunction

    function [7:0] rotl(input [7:0] a, input integer n);
        rotl = (a << n) | (a >> (8-n));
    endfunction

    function [7:0] reference_sbox(input [7:0] x);
        reg [7:0] t;
        begin
            if (inverse) begin
                reference_sbox = gf_inv(rotl(x, 1) ^ rotl(x, 3) ^ rotl(x, 6) ^ 8'h05);
            end else begin
                t = gf_inv(x);
                reference_sbox = t ^ rotl(t, 1) ^ rotl(t, 2) ^ rotl(t, 3) ^ rotl(t, 4) ^ 8'h63;
            end
        end
    endfunction


    //-----------------------------------------
    //-- share encoding -----------------------
    //-----------------------------------------

    // The duality instance `phase` evaluates, the other instance is pre-charged to (0,0)
    function [IN_W-1:0] encode_input(input value, input [d-2:0] shares, input integer phase);
        integer s;
        begin
            encode_input    = {IN_W{1'b0}};
            encode_input[0] = value ^ (^shares);
            for (s = 1; s < d; s = s + 1) begin
                if (disable_f2b) begin
                    encode_input[2*(d-1)*phase + 2*s-1] =  shares[s-1]; // true rail
                    encode_input[2*(d-1)*phase + 2*s]   = ~shares[s-1]; // false rail
                end else begin
                    encode_input[s] = shares[s-1];
                end
            end
        end
    endfunction

    // Returns 1'bx if a share of the evaluating instance is not a valid (t,f) = (v,~v) encoding
    // or a share of the pre-charged instance is not (0,0)
    function decode_output(input [OUT_W-1:0] v, input integer phase);
        integer s, evaluating, precharged;
        begin
            evaluating    = 2*(d-1)*phase;
            precharged    = 2*(d-1)*(1-phase);
            decode_output = v[0];
            for (s = 1; s < d; s = s + 1) begin
                if (disable_b2f) begin
                    if (((v[evaluating + 2*s-1] ^ v[evaluating + 2*s]) === 1'b1) && ({v[precharged + 2*s], v[precharged + 2*s-1]} === 2'b00))
                        decode_output = decode_output ^ v[evaluating + 2*s-1];
                    else
                        decode_output = 1'bx;
                end else begin
                    decode_output = decode_output ^ v[s];
                end
            end
        end
    endfunction


    //-----------------------------------------
    //-- test ---------------------------------
    //-----------------------------------------

    integer value, trial, phase, b, k, errors;
    reg [7:0]   test_input, expected_output, decoded_output;
    reg [d-2:0] shares;

    initial begin
        errors = 0;

        $display("\n=== Start Duality Testbench (%0s S-box, security order %0d, F2B %0s, B2F %0s) ===",
                 inverse ? "inverse" : "forward", security_order, disable_f2b ? "disabled" : "enabled", disable_b2f ? "disabled" : "enabled");

        for (value = 0; value <= 255; value = value + 1) begin
            for (trial = 0; trial < trials; trial = trial + 1) begin
                for (phase = 0; phase < 2; phase = phase + 1) begin
                    test_input      = value[7:0];
                    expected_output = reference_sbox(test_input);

                    prch0 = (phase == 0) ? {(d-1){1'b0}} : {(d-1){1'b1}};
                    prch1 = (phase == 1) ? {(d-1){1'b0}} : {(d-1){1'b1}};

                    for (b = 0; b < 8; b = b + 1) begin
                        shares = $random;
                        dut_input[b*IN_W +: IN_W] = encode_input(test_input[7-b], shares, phase);
                    end
                    for (k = 0; k < R_SR_W;    k = k + 1) r_sr[k]       = $random;
                    for (k = 0; k < R_DR_W;    k = k + 1) r_dr0[k]      = $random;
                    for (k = 0; k < R_DR_W;    k = k + 1) r_dr1[k]      = $random;
                    for (k = 0; k < R_DRTSR_W; k = k + 1) r_sr_drtsr[k] = $random;

                    #1;

                    for (b = 0; b < 8; b = b + 1) begin
                        decoded_output[7-b] = decode_output(dut_output[b*OUT_W +: OUT_W], phase);
                    end

                    if (decoded_output !== expected_output) begin
                        errors = errors + 1;
                        if (errors <= 10) begin
                            $display("time=%0t, input=%h, output=%h, expected=%h, trial=%0d, phase=%0d FAILED", $time, test_input, decoded_output, expected_output, trial, phase);
                        end
                    end
                end
            end
        end

        $display("=== End Testbench with pass=%b (%0d of %0d checks failed) ===\n", errors == 0, errors, 2*256*trials);
        $finish;
    end

endmodule
