`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Simulation-only dummy implementations of the CCHPC1.1 gadgets (normal and duality) used by unrail.
//
// Every dummy has the exact ports and parameters of its counterpart in /cchpc_rtl, but is purely combinational
// (registers are transparent, clk is ignored) and computes on the real share encoding:
//   - single-rail bus [d-1:0]:          {..., a^1, a^0}
//   - dual-rail bus [2*(d-1):0]:        {..., a^1_f, a^1_t, a^0}, a pre-charged share is (t,f) = (0,0)
//   - duality instance bus [2*(d-1):1]: {..., a^1_f, a^1_t}, one bus per duality instance, share 0 is a separate single-rail bit
// Linear gadgets follow the dual-rail pre-charge logic (a pre-charged input share gives a pre-charged output share).
// Non-linear gadgets reconstruct the unmasked inputs from all shares (invalid or unexpectedly pre-charged shares give 'x')
// and output a fresh sharing whose shares 1..d-1 are taken from r_SR. Inversions (CONF/INV/aINV/bINV/zINV) are applied
// at the same share as in the real gadgets.
//
// NOR2 is the only standard cell instantiated directly by unrail output (duality dual-rail to single-rail mapping).
//////////////////////////////////////////////////////////////////////////////////


//-----------------------------------------
//-- helpers ------------------------------
//-----------------------------------------

// DRP XOR on N interleaved dual-rail shares, INV swaps the rails of the last share
module tb_DRP_XOR_shares #( parameter integer N = 1, parameter INV = 1'b0 )(a, b, z);
    input  [2*N:1] a;
    input  [2*N:1] b;
    output [2*N:1] z;

    wire [2*N:1] out_z;

    genvar i;
    generate
        for (i = 0; i < N; i=i+1) begin : gen_share_
            assign out_z[2*i+1] = (a[2*i+1] & b[2*i+2]) | (a[2*i+2] & b[2*i+1]); // true rail
            assign out_z[2*i+2] = (a[2*i+1] & b[2*i+1]) | (a[2*i+2] & b[2*i+2]); // false rail
        end
        for (i = 1; i <= 2*N; i=i+1) begin : gen_out_
            assign z[i] = out_z[(INV && i == 2*N) ? i-1 : (INV && i == 2*N-1) ? i+1 : i];
        end
    endgenerate
endmodule

// Value of N interleaved dual-rail shares, 'x' if a share is not a valid (t,f) = (v,~v) encoding
module tb_DR_value #( parameter integer N = 1 )(a, v);
    input  [2*N:1]  a;
    output [N-1:0]  v;

    genvar i;
    generate
        for (i = 0; i < N; i=i+1) begin : gen_share_
            assign v[i] = (a[2*i+1] ^ a[2*i+2]) ? a[2*i+1] : 1'bx;
        end
    endgenerate
endmodule

// Value of N shares given by both duality instances: exactly one instance has to evaluate while the other one is
// pre-charged (or both evaluate the same value), otherwise 'x'
module tb_duality_value #( parameter integer N = 1 )(a0, a1, v);
    input  [2*N:1]  a0;
    input  [2*N:1]  a1;
    output [N-1:0]  v;

    genvar i;
    generate
        for (i = 0; i < N; i=i+1) begin : gen_share_
            wire t0 = a0[2*i+1], f0 = a0[2*i+2];
            wire t1 = a1[2*i+1], f1 = a1[2*i+2];
            assign v[i] = ((t0 ^ f0) && !(t1 | f1))               ? t0 :
                          ((t1 ^ f1) && !(t0 | f0))               ? t1 :
                          ((t0 ^ f0) && (t1 ^ f1) && (t0 == t1))  ? t0 : 1'bx;
        end
    endgenerate
endmodule

// Encodes N share values as interleaved dual-rail shares, share i is pre-charged to (0,0) while prch[i] is set
module tb_DR_encode #( parameter integer N = 1 )(v, prch, z);
    input  [N-1:0] v;
    input  [N-1:0] prch;
    output [2*N:1] z;

    genvar i;
    generate
        for (i = 0; i < N; i=i+1) begin : gen_share_
            assign z[2*i+1] = prch[i] ? 1'b0 :  v[i];
            assign z[2*i+2] = prch[i] ? 1'b0 : ~v[i];
        end
    endgenerate
endmodule

// Unmasked non-linear function as configured by CONF and the unrail inversion parameters
module tb_nonlinear_function #( parameter CONF = 2'b00, aINV = 1'b0, bINV = 1'b0, zINV = 1'b0 )(a, b, z);
    input  a;
    input  b;
    output z;

    assign z = ((a ^ CONF[1] ^ aINV) & (b ^ CONF[1] ^ bINV)) ^ CONF[0] ^ zINV;
endmodule


//-----------------------------------------
//-- cells --------------------------------
//-----------------------------------------

module NOR2 (a, b, z);
    input  a;
    input  b;
    output z;

    assign z = ~(a | b);
endmodule


//-----------------------------------------
//-- linear gadgets -----------------------
//-----------------------------------------

module linear_CCHPC1_1_generic_SRtSR #( parameter security_order = 1, CONF = 1'b0, INV = 1'b0
)(
    a, b, z
);
    parameter integer d = security_order+1;

    input  [d-1:0] a;
    input  [d-1:0] b;
    output [d-1:0] z;

    assign z[0]     = a[0] ^ b[0] ^ (CONF ^ INV);
    assign z[d-1:1] = a[d-1:1] ^ b[d-1:1];
endmodule

module linear_CCHPC1_1_generic_DRtDR #( parameter security_order = 1, CONF = 1'b0, wAOI22 = 1'b1, INV = 1'b0
)(
    a, b, z
);
    parameter integer d = security_order+1;

    input  [2*(d-1):0] a;
    input  [2*(d-1):0] b;
    output [2*(d-1):0] z;

    assign z[0] = a[0] ^ b[0];

    tb_DRP_XOR_shares #(.N(d-1), .INV(CONF ^ INV)) xor_inst (.a(a[2*(d-1):1]), .b(b[2*(d-1):1]), .z(z[2*(d-1):1]));
endmodule

module linear_CCHPC1_1_generic_DRtDR_duality #( parameter security_order = 1, CONF = 1'b0, wAOI22 = 1, INV = 0
)(
    a_layer0, b_layer0, a_duality0, a_duality1, b_duality0, b_duality1, z_layer0, z_duality0, z_duality1
);
    parameter integer d = security_order+1;

    input              a_layer0;
    input              b_layer0;
    input  [2*(d-1):1] a_duality0;
    input  [2*(d-1):1] a_duality1;
    input  [2*(d-1):1] b_duality0;
    input  [2*(d-1):1] b_duality1;
    output             z_layer0;
    output [2*(d-1):1] z_duality0;
    output [2*(d-1):1] z_duality1;

    assign z_layer0 = a_layer0 ^ b_layer0;

    tb_DRP_XOR_shares #(.N(d-1), .INV(CONF ^ INV)) xor_duality0_inst (.a(a_duality0), .b(b_duality0), .z(z_duality0));
    tb_DRP_XOR_shares #(.N(d-1), .INV(CONF ^ INV)) xor_duality1_inst (.a(a_duality1), .b(b_duality1), .z(z_duality1));
endmodule


//-----------------------------------------
//-- inversion gadgets (no cchpc_rtl counterpart, used by unrail for remaining NOT gates) --
//-----------------------------------------

module not_CCHPC1_1_generic_SRtSR #( parameter security_order = 1, INV = 1'b0
)(
    a, z
);
    parameter integer d = security_order+1;

    input  [d-1:0] a;
    output [d-1:0] z;

    assign z[0]     = INV ? a[0] : ~a[0];
    assign z[d-1:1] = a[d-1:1];
endmodule

module not_CCHPC1_1_generic_DRtDR #( parameter security_order = 1, INV = 1'b0
)(
    a, z
);
    parameter integer d = security_order+1;

    input  [2*(d-1):0] a;
    output [2*(d-1):0] z;

    genvar i;
    generate
        for (i = 0; i <= 2*(d-1); i=i+1) begin : gen_out_
            assign z[i] = a[(!INV && i == 2*(d-1)) ? i-1 : (!INV && i == 2*(d-1)-1) ? i+1 : i];
        end
    endgenerate
endmodule


//-----------------------------------------
//-- non-linear gadgets -------------------
//-----------------------------------------

module nonlinear_CCHPC1_1_generic_DRtDR #(
    parameter security_order = 1,
    parameter CONF           = 2'b00,
    parameter FORWARD_R      = 0,
    parameter wAOI22         = 0,
    parameter OPT_PRCH       = 0,
    parameter aINV = 1'b0, bINV = 1'b0, zINV = 1'b0,
    parameter ALIGN_OUT = 0
)(
    clk, prch, a, b, r_SR, r_DR, z
);
    parameter integer d = security_order+1;

    localparam integer RAIL_FACTOR            = 2;
    localparam integer RAND_COUNT_CONSEC      = ((d-1)*(d-2))/2;
    localparam integer RAND_COUNT_CONSEC_SAFE = (RAND_COUNT_CONSEC > 0) ? RAND_COUNT_CONSEC : 1;

    input         clk;
    input [d-2:0] prch;

    input  [2*(d-1):0] a;
    input  [2*(d-1):0] b;

    input  [d-2:0] r_SR;
    input  [RAIL_FACTOR*RAND_COUNT_CONSEC_SAFE-1:0] r_DR;

    output [2*(d-1):0] z;

    wire [d-2:0] a_shares, b_shares;
    wire         z_value;

    tb_DR_value #(.N(d-1)) a_value_inst (.a(a[2*(d-1):1]), .v(a_shares));
    tb_DR_value #(.N(d-1)) b_value_inst (.a(b[2*(d-1):1]), .v(b_shares));

    tb_nonlinear_function #(.CONF(CONF), .aINV(aINV), .bINV(bINV), .zINV(zINV)) function_inst (
        .a(a[0] ^ (^a_shares)),
        .b(b[0] ^ (^b_shares)),
        .z(z_value)
    );

    assign z[0] = z_value ^ (^r_SR);
    tb_DR_encode #(.N(d-1)) z_encode_inst (.v(r_SR), .prch(prch), .z(z[2*(d-1):1]));
endmodule

module nonlinear_CCHPC1_1_generic_DRtSR #(
    parameter security_order = 1,
    parameter CONF           = 2'b00,
    parameter FORWARD_R      = 0,
    parameter wAOI22         = 0,
    parameter RAND_REG       = 0,
    parameter aINV = 1'b0, bINV = 1'b0, zINV = 1'b0,
    parameter ALIGN_OUT = 0
)(
    clk, prch, a, b, r_SR, z_SR
);
    parameter integer d = security_order+1;

    localparam integer RAND_COUNT = (d*(d-1))/2;

    input         clk;
    input [d-2:0] prch;

    input  [2*(d-1):0] a;
    input  [2*(d-1):0] b;

    input  [RAND_COUNT-1:0] r_SR;

    output [d-1:0] z_SR;

    wire [d-2:0] a_shares, b_shares;
    wire         z_value;

    tb_DR_value #(.N(d-1)) a_value_inst (.a(a[2*(d-1):1]), .v(a_shares));
    tb_DR_value #(.N(d-1)) b_value_inst (.a(b[2*(d-1):1]), .v(b_shares));

    tb_nonlinear_function #(.CONF(CONF), .aINV(aINV), .bINV(bINV), .zINV(zINV)) function_inst (
        .a(a[0] ^ (^a_shares)),
        .b(b[0] ^ (^b_shares)),
        .z(z_value)
    );

    assign z_SR[0]     = z_value ^ (^r_SR[d-2:0]);
    assign z_SR[d-1:1] = r_SR[d-2:0];
endmodule

module nonlinear_CCHPC1_1_generic_DRtDR_duality #(
    parameter security_order = 1,
    parameter CONF           = 2'b00,
    parameter FORWARD_R      = 0,
    parameter wAOI22         = 0,
    parameter OPT_PRCH       = 0,
    parameter aINV = 1'b0, bINV = 1'b0, zINV = 1'b0,
    parameter ALIGN_OUT = 0
)(
    clk, prch0, prch1, a_layer0, a_duality0, a_duality1, b_layer0, b_duality0, b_duality1, r_SR, r_duality0, r_duality1, z_layer0, z_duality0, z_duality1
);
    parameter integer d = security_order+1;

    localparam integer RAND_COUNT_CONSEC      = ((d-1)*(d-2))/2;
    localparam integer RAND_COUNT_CONSEC_SAFE = (RAND_COUNT_CONSEC > 0) ? RAND_COUNT_CONSEC : 1;
    localparam integer RAIL_FACTOR = 2;

    input         clk;
    input [d-2:0] prch0;
    input [d-2:0] prch1;

    input             a_layer0;
    input             b_layer0;
    input [2*(d-1):1] a_duality0;
    input [2*(d-1):1] a_duality1;
    input [2*(d-1):1] b_duality0;
    input [2*(d-1):1] b_duality1;

    input [d-2:0] r_SR;
    input [RAIL_FACTOR*RAND_COUNT_CONSEC_SAFE-1:0] r_duality0;
    input [RAIL_FACTOR*RAND_COUNT_CONSEC_SAFE-1:0] r_duality1;

    output             z_layer0;
    output [2*(d-1):1] z_duality0;
    output [2*(d-1):1] z_duality1;

    wire [d-2:0] a_shares, b_shares;
    wire         z_value;

    tb_duality_value #(.N(d-1)) a_value_inst (.a0(a_duality0), .a1(a_duality1), .v(a_shares));
    tb_duality_value #(.N(d-1)) b_value_inst (.a0(b_duality0), .a1(b_duality1), .v(b_shares));

    tb_nonlinear_function #(.CONF(CONF), .aINV(aINV), .bINV(bINV), .zINV(zINV)) function_inst (
        .a(a_layer0 ^ (^a_shares)),
        .b(b_layer0 ^ (^b_shares)),
        .z(z_value)
    );

    assign z_layer0 = z_value ^ (^r_SR);
    tb_DR_encode #(.N(d-1)) z_encode_duality0_inst (.v(r_SR), .prch(prch0), .z(z_duality0));
    tb_DR_encode #(.N(d-1)) z_encode_duality1_inst (.v(r_SR), .prch(prch1), .z(z_duality1));
endmodule

module nonlinear_CCHPC1_1_generic_DRtSR_duality #(
    parameter security_order = 1,
    parameter CONF           = 2'b00,
    parameter FORWARD_R      = 0,
    parameter wAOI22         = 0,
    parameter RAND_REG       = 0,
    parameter aINV = 1'b0, bINV = 1'b0, zINV = 1'b0,
    parameter ALIGN_OUT      = 0
)(
    clk, prch0, prch1, a_layer0, a_duality0, a_duality1, b_layer0, b_duality0, b_duality1, r_SR, z_SR
);
    parameter integer d = security_order+1;

    localparam integer RAND_COUNT = (d*(d-1))/2;

    input         clk;
    input [d-2:0] prch0;
    input [d-2:0] prch1;

    input             a_layer0;
    input             b_layer0;
    input [2*(d-1):1] a_duality0;
    input [2*(d-1):1] a_duality1;
    input [2*(d-1):1] b_duality0;
    input [2*(d-1):1] b_duality1;

    input [RAND_COUNT-1:0] r_SR;

    output [d-1:0] z_SR;

    wire [d-2:0] a_shares, b_shares;
    wire         z_value;

    tb_duality_value #(.N(d-1)) a_value_inst (.a0(a_duality0), .a1(a_duality1), .v(a_shares));
    tb_duality_value #(.N(d-1)) b_value_inst (.a0(b_duality0), .a1(b_duality1), .v(b_shares));

    tb_nonlinear_function #(.CONF(CONF), .aINV(aINV), .bINV(bINV), .zINV(zINV)) function_inst (
        .a(a_layer0 ^ (^a_shares)),
        .b(b_layer0 ^ (^b_shares)),
        .z(z_value)
    );

    assign z_SR[0]     = z_value ^ (^r_SR[d-2:0]);
    assign z_SR[d-1:1] = r_SR[d-2:0];
endmodule


//-----------------------------------------
//-- registers ----------------------------
//-----------------------------------------

module reg_SRtSR_generic #( parameter security_order = 1, INV = 1'b0
)(
    clk, prch, a, z
);
    parameter integer d = security_order+1;

    input         clk;
    input [d-2:0] prch;

    input  [(d-1):0] a;
    output [(d-1):0] z;

    assign z[0]     = INV ? ~a[0] : a[0];
    assign z[d-1:1] = a[d-1:1];
endmodule

module reg_SRtDR_generic #(
    parameter security_order = 1,
    parameter INV            = 1'b0,
    parameter OPT_PRCH       = 0
)(
    clk, prch, a, z
);
    parameter integer d = security_order+1;

    localparam [d-2:0] TOP_SHARE = 1 << (d-2);

    input         clk;
    input [d-2:0] prch;

    input  [  (d-1):0] a;
    output [2*(d-1):0] z;

    assign z[0] = a[0];
    tb_DR_encode #(.N(d-1)) z_encode_inst (.v(a[d-1:1] ^ (INV ? TOP_SHARE : {(d-1){1'b0}})), .prch(prch), .z(z[2*(d-1):1]));
endmodule

module reg_SRtDR_generic_duality #(
    parameter security_order = 1,
    parameter INV            = 1'b0,
    parameter OPT_PRCH       = 0
)(
    clk, prch0, prch1, a, z_layer0, z_duality0, z_duality1
);
    parameter integer d = security_order+1;

    localparam [d-2:0] TOP_SHARE = 1 << (d-2);

    input         clk;
    input [d-2:0] prch0;
    input [d-2:0] prch1;

    input  [  (d-1):0] a;
    output             z_layer0;
    output [2*(d-1):1] z_duality0;
    output [2*(d-1):1] z_duality1;

    wire [d-2:0] shares = a[d-1:1] ^ (INV ? TOP_SHARE : {(d-1){1'b0}});

    assign z_layer0 = a[0];
    tb_DR_encode #(.N(d-1)) z_encode_duality0_inst (.v(shares), .prch(prch0), .z(z_duality0));
    tb_DR_encode #(.N(d-1)) z_encode_duality1_inst (.v(shares), .prch(prch1), .z(z_duality1));
endmodule
