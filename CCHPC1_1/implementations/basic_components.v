`timescale 1ps/1ps

//-----------------------------------------
// -- SINGLE-RAIL GATES -------------------
//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module INV (a, z);
    input  a;
    output z;
	
	assign z = ~a;

endmodule	

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module AND2 (a, b, z);
    input  a;
    input  b;
    output z;
	
	assign z = a & b;

endmodule	

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module AND3 (a, b, c, z);
    input  a;
    input  b;
    input  c;
    output z;
	
	assign z = a & b & c;

endmodule	

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module AND4 (a, b, c, d, z);
    input  a;
    input  b;
    input  c;
    input  d;
    output z;
	
	assign z = a & b & c & d;

endmodule	

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module OR2 (a, b, z);
    input  a;
    input  b;
    output z;
	
	assign z = a | b;

endmodule	

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module OR3 (a, b, c, z);
    input  a;
    input  b;
    input  c;
    output z;
	
	assign z = a | b | c;

endmodule	

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module OR4 (a, b, c, d, z);
    input  a;
    input  b;
    input  c;
    input  d;
    output z;
	
	assign z = a | b | c | d;

endmodule	

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module XOR2 (a, b, z);
    input  a;
    input  b;
    output z;
	
	assign z = a ^ b;

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module XNOR2 (a, b, z);
    input  a;
    input  b;
    output z;
	
	assign z = ~(a ^ b);

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module NAND2 (a, b, z);
    input  a;
    input  b;
    output z;
	
	assign z = ~(a & b);

endmodule	

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module NAND3 (a, b, c, z);
    input  a;
    input  b;
    input  c;
    output z;
	
	assign z = ~(a & b & c);

endmodule	

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module NAND4 (a, b, c, d, z);
    input  a;
    input  b;
    input  c;
    input  d;
    output z;
	
	assign z = ~(a & b & c & d);

endmodule	

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module NOR2 (a, b, z);
    input  a;
    input  b;
    output z;
	
	assign z = ~(a | b);

endmodule	

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module NOR3 (a, b, c, z);
    input  a;
    input  b;
    input  c;
    output z;
	
	assign z = ~(a | b | c);

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module NOR4 (a, b, c, d, z);
    input  a;
    input  b;
    input  c;
    input  d;
    output z;
	
	assign z = ~(a | b | c | d);

endmodule	

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module MUX2 (s, a, b, z);
    input  s;
    input  a;
    input  b;
    output z;
	
	assign z = (~s & a) | (s & b);

endmodule	

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module AOI22 (a, b, c, d, z);
    input  a;
    input  b;
    input  c;
    input  d;
    output z;
	
	assign z = ~((a & b) | (c & d));

endmodule	

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module OAI22 (a, b, c, d, z);
    input  a;
    input  b;
    input  c;
    input  d;
    output z;
	
	assign z = ~((a | b) & (c | d));

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module REG #( parameter WIDTH = 6 ) (clk, d, q);
    input  clk;
    input  [WIDTH-1:0] d;
    output reg [WIDTH-1:0] q;

    always @(posedge clk)
    begin
        q <= d;
    end

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module REG_pipeline_vec #(  parameter depth = 2)(clk, a, z);
    input  clk;
    input  a;
    output [depth:0] z;

    //-- intermediates ------------------------
    wire [depth:0] w;


    //-----------------------------------------
    //-- registers ----------------------------
    //-----------------------------------------
    assign w[0] = a; 

    genvar i;
    generate
        if (depth == 0) begin : gen_unused_
            wire unused_clk;
            assign unused_clk = clk;
        end

        for (i = 0; i < depth; i=i+1) begin : loop_gen_regs_

            REG #(.WIDTH(1)) reg_inst (.clk(clk), .d(w[i]), .q(w[i+1]));

        end
    endgenerate  

    assign z[depth:0] = w[depth:0];

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module NOR_prch_vec #(  parameter WIDTH = 2)(prch, a, z);
    input              prch;
    input  [WIDTH-1:0] a;
    output [WIDTH-1:0] z;

    genvar i;
    generate
        for (i = 0; i < WIDTH; i=i+1) begin : loop_gen_prch_

            NOR2 ctrl_prch_inst (.a(a[i]), .b(prch), .z(z[i]));

        end
    endgenerate  

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module AND_prch_vec #(  parameter WIDTH = 2)(prch_n, a, z);

    input              prch_n;
    input  [WIDTH-1:0] a;
    output [WIDTH-1:0] z;

    genvar i;
    generate
        for (i = 0; i < WIDTH; i=i+1) begin : loop_gen_prch_

            AND2 ctrl_prch_inst (.a(a[i]), .b(prch_n), .z(z[i]));

        end
    endgenerate  

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module REG_prch_wNOR #(  parameter WIDTH = 2)(clk, prch, a, z);
    input  clk;
    input  prch;
    input  [WIDTH-1:0] a;
    output [WIDTH-1:0] z;

    wire [WIDTH-1:0] w;

    NOR_prch_vec #(.WIDTH(WIDTH)) ctrl_inst (prch, a[WIDTH-1:0], w[WIDTH-1:0]);
    REG          #(.WIDTH(WIDTH)) reg_inst  (clk,  w[WIDTH-1:0], z[WIDTH-1:0]);

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module REG_prch_SRtDR #( parameter IN_WIDTH = 1, CHUNK_IN_WIDTH = 1)(clk, prch, prch_n, a, z);
    input  clk;
    input  prch;
    input  prch_n;
    input  [IN_WIDTH-1:0]   a; // single-rail
    output [2*IN_WIDTH-1:0] z; // dual-rail

    wire [2*IN_WIDTH-1:0] w;

    genvar i;
    generate
        if ((IN_WIDTH % CHUNK_IN_WIDTH) != 0) begin : gen_invalid_
            initial begin
                $error("WIDTH must be divisible by CHUNK_WIDTH");
                $finish;
            end

        end else begin : gen_valid_

            for (i = 0; i < IN_WIDTH/CHUNK_IN_WIDTH; i=i+1) begin : gen_chunk_

                NOR_prch_vec #(.WIDTH(CHUNK_IN_WIDTH)) nor_inst (prch,   a[CHUNK_IN_WIDTH*(i+1)-1:CHUNK_IN_WIDTH*i], w[2*CHUNK_IN_WIDTH*(i+1)-1:2*CHUNK_IN_WIDTH*i+CHUNK_IN_WIDTH]);  // ~( true | prch)
                AND_prch_vec #(.WIDTH(CHUNK_IN_WIDTH)) and_inst (prch_n, a[CHUNK_IN_WIDTH*(i+1)-1:CHUNK_IN_WIDTH*i], w[2*CHUNK_IN_WIDTH*i+CHUNK_IN_WIDTH-1:2*CHUNK_IN_WIDTH*i]);      // ~(~true | prch) = true & prch_n

            end

        end
    endgenerate

    REG #(.WIDTH(2*IN_WIDTH)) reg_inst (clk, w, z);

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module XOR2_TREE #( parameter NUM_INPUTS = 6 ) (a, z);
    input  [NUM_INPUTS-1:0] a;
    output                  z;

    wire [((NUM_INPUTS+1)/2)-1:0] next_tree_stage_inputs;

    genvar i;
    generate
        
        if (NUM_INPUTS < 1) begin : gen_invalid_
            initial begin
                $error("%m: NUM_INPUTS=%0d is invalid. INPUTS must be >= 1.", NUM_INPUTS);
                $finish;
            end

        end else if (NUM_INPUTS == 1) begin : gen_one_
            assign z = a[0];
        end else begin : gen_tree_

            for (i = 0; i < (NUM_INPUTS/2); i=i+1) begin : loop_gen_nodes_

                XOR2 xor_inst (.a(a[2*i]), .b(a[2*i+1]), .z(next_tree_stage_inputs[i]));

            end

            if ((NUM_INPUTS % 2) != 0) begin : gen_forward_last_
                assign next_tree_stage_inputs[(NUM_INPUTS/2)] = a[NUM_INPUTS-1];
            end

            XOR2_TREE #(.NUM_INPUTS((NUM_INPUTS+1)/2)) xor_tree_inst (.a(next_tree_stage_inputs), .z(z));

        end

    endgenerate
    
endmodule

//-----------------------------------------


//-----------------------------------------
// -- DUAL-RAIL GADGETS (utilize NAND) ----
//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module WDDL_AND (a_t, a_f, b_t, b_f, z_t, z_f);
    input  a_t;
    input  a_f;
    input  b_t;
    input  b_f;
    output z_t;
    output z_f;

    AND2 U1 (.a(a_t), .b(b_t), .z(z_t));
    OR2  U2 (.a(a_f), .b(b_f), .z(z_f));

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module DRP_AND (a_t, a_f, b_t, b_f, z_t, z_f);
    input  a_t;
    input  a_f;
    input  b_t;
    input  b_f;
    output z_t;
    output z_f;
    
    WDDL_AND U1 (.a_t(a_t), .a_f(a_f), .b_t(b_t), .b_f(b_f), .z_t(z_t), .z_f(z_f));

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module CCHPC_AND_wPublic_generic_duality_DRtDR #(parameter security_order = 1)(a_layer0, a_duality0, a_duality1, b_layer0_pub, b_duality0_pub, b_duality1_pub, z_layer0, z_duality0, z_duality1);
    parameter integer d = security_order + 1;
    
    input             a_layer0;       // share 0
    input             b_layer0_pub;   // copy 0
    input [2*(d-1):1] a_duality0;     // dual-rail shares from duality instance 0 
    input [2*(d-1):1] a_duality1;     // dual-rail shares from duality instance 1
    input [2*(d-1):1] b_duality0_pub; // dual-rail copies from duality instance 0 
    input [2*(d-1):1] b_duality1_pub; // dual-rail copies from duality instance 1

    output             z_layer0;   // share 0
    output [2*(d-1):1] z_duality0; // dual-rail shares from duality instance 0 
    output [2*(d-1):1] z_duality1; // dual-rail shares from duality instance 1
    
    AND2 U1 (.a(a_layer0), .b(b_layer0_pub), .z(z_layer0));

    genvar l;
    generate
        for (l = 1; l < d; l = l+1) begin : gen_AND_pub_

            DRP_AND U2 (.a_t(a_duality0[2*l-1]), .a_f(a_duality0[2*l]), .b_t(b_duality0_pub[2*l-1]), .b_f(b_duality0_pub[2*l]), .z_t(z_duality0[2*l-1]), .z_f(z_duality0[2*l]));
            DRP_AND U3 (.a_t(a_duality1[2*l-1]), .a_f(a_duality1[2*l]), .b_t(b_duality1_pub[2*l-1]), .b_f(b_duality1_pub[2*l]), .z_t(z_duality1[2*l-1]), .z_f(z_duality1[2*l]));

        end
    endgenerate

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module MUX_selDR_wNAND (x, y, s_t, s_f, z);
    input  x;
    input  y;
    input  s_t;
    input  s_f;
    output z;

    // multiplexer with dual-rail select

    wire [1:0] w;

    NAND2 U1 (.a(   x), .b( s_t), .z(w[0]));
    NAND2 U2 (.a(   y), .b( s_f), .z(w[1]));
    NAND2 U3 (.a(w[0]), .b(w[1]), .z(   z));

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module DRP_XOR2_wNAND (a_t, a_f, b_t, b_f, z_t, z_f);
    input  a_t;
    input  a_f;
    input  b_t;
    input  b_f;
    output z_t;
    output z_f;

    (* keep = "true", dont_touch = "yes" *) wire [1:0] w;
    
    MUX_selDR_wNAND U1 (.x(a_t), .y(b_t), .s_t(b_f), .s_f(a_f), .z(z_t));
    MUX_selDR_wNAND U2 (.x(a_t), .y(b_f), .s_t(b_t), .s_f(a_f), .z(z_f));

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module DRP_XOR2_wAOI22 (a_t, a_f, b_t, b_f, z_t, z_f);
    input  a_t;
    input  a_f;
    input  b_t;
    input  b_f;
    output z_t;
    output z_f;

    (* keep = "true", dont_touch = "yes" *) wire [1:0] w;

    AOI22 aoi22_inst0 (.a(a_t), .b(b_f), .c(a_f), .d(b_t), .z(w[0]));
    AOI22 aoi22_inst1 (.a(a_t), .b(b_t), .c(a_f), .d(b_f), .z(w[1]));
    INV inv_inst0 (.a(w[0]), .z(z_t));
    INV inv_inst1 (.a(w[1]), .z(z_f));

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module DRP_XOR2 #( parameter wAOI22 = 0 ) (a_t, a_f, b_t, b_f, z_t, z_f);
    input  a_t;
    input  a_f;
    input  b_t;
    input  b_f;
    output z_t;
    output z_f;

    generate
        if (wAOI22 == 1) begin
            DRP_XOR2_wAOI22 xor_inst (.a_t(a_t), .a_f(a_f), .b_t(b_t), .b_f(b_f), .z_t(z_t), .z_f(z_f)); // area opt.
        end else begin 
            DRP_XOR2_wNAND xor_inst (.a_t(a_t), .a_f(a_f), .b_t(b_t), .b_f(b_f), .z_t(z_t), .z_f(z_f)); // latency opt.
        end
    endgenerate

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module DRP_MUX4_RAIL_wNAND (s0, s1, d, z);
    input  [1:0] s0; 
    input  [1:0] s1; 
    input  [3:0] d;
    output       z;  

    (* keep = "true", dont_touch = "yes" *) wire [3:0] w;  

    NAND3 nand3_inst3 (.a(d[3]), .b(s0[0]), .c(s1[0]), .z(w[3]));
    NAND3 nand3_inst2 (.a(d[2]), .b(s0[0]), .c(s1[1]), .z(w[2]));
    NAND3 nand3_inst1 (.a(d[1]), .b(s0[1]), .c(s1[0]), .z(w[1]));
    NAND3 nand3_inst0 (.a(d[0]), .b(s0[1]), .c(s1[1]), .z(w[0]));
    
    NAND4 nand4_inst0 (.a(w[3]), .b(w[2]), .c(w[1]), .d(w[0]), .z(z));

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module DRP_MUX4_RAIL_wAOI22 (s0_n, s1, d, z);
    input  [1:0] s0_n;
    input  [1:0] s1;
    input  [3:0] d;
    output       z;

    (* keep = "true", dont_touch = "yes" *) wire [1:0] w_n;

    AOI22 aoi22_stage1_0 (.a(d[3]), .b(s1[0]), .c(d[2]), .d(s1[1]), .z(w_n[1]));
    AOI22 aoi22_stage1_1 (.a(d[1]), .b(s1[0]), .c(d[0]), .d(s1[1]), .z(w_n[0]));

    AOI22 aoi22_stage2 (.a(w_n[1]), .b(s0_n[1]), .c(w_n[0]), .d(s0_n[0]), .z(z));

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module DRP_MUX4_RAIL #( parameter wAOI22 = 0, s0_IS_INV = 0 ) (s0, s1, d, z);
    input  [1:0] s0;
    input  [1:0] s1;
    input  [3:0] d;
    output       z;

    (* keep = "true", dont_touch = "yes" *) wire [1:0] s0_in;

    generate
        if (wAOI22 == 1 && s0_IS_INV == 0) begin
            INV inv_a_t (.a(s0[0]), .z(s0_in[0]));
            INV inv_a_f (.a(s0[1]), .z(s0_in[1]));
        end else begin 
            assign s0_in[0] = s0[0];
            assign s0_in[1] = s0[1];
        end

        if (wAOI22 == 1) begin
            DRP_MUX4_RAIL_wAOI22 mux_inst (.s0_n(s0_in), .s1(s1), .d(d), .z(z)); // area opt. (a must be inverted value and pre-charge state)
        end else begin 
            DRP_MUX4_RAIL_wNAND mux_inst (.s0(s0_in), .s1(s1), .d(d), .z(z)); // latency opt.
        end
    endgenerate

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module DRP_MUX4_RAIL_parallel #( parameter wAOI22 = 0, NUM_INPUTS = 1) (s0, s1, d, z);
    input  [1:0] s0;
    input  [1:0] s1;
    input  [NUM_INPUTS*4-1:0] d;
    output [NUM_INPUTS-1:0] z;

    (* keep = "true", dont_touch = "yes" *) wire [1:0] s0_in;

    generate
        if (wAOI22 == 1) begin
            INV inv_a_t (.a(s0[0]), .z(s0_in[0]));
            INV inv_a_f (.a(s0[1]), .z(s0_in[1]));
        end else begin 
            assign s0_in[0] = s0[0];
            assign s0_in[1] = s0[1];
        end

        genvar i;
        for (i = 0; i < NUM_INPUTS; i=i+1) begin : loop_gen_parallel_muxes_

            DRP_MUX4_RAIL #(.wAOI22(wAOI22), .s0_IS_INV(wAOI22)) mux_inst (.s0(s0_in), .s1(s1), .d(d[4*i+3:4*i]), .z(z[i]));

        end
    endgenerate

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module DRP_MUX4 #( parameter wAOI22 = 0, s0_IS_INV = 0 ) (s0, s1, d_t, d_f, z);
    input  [1:0] s0;
    input  [1:0] s1;
    input  [3:0] d_t;
    input  [3:0] d_f;
    output [1:0] z;

    (* keep = "true", dont_touch = "yes" *) wire [1:0] s0_in;

    generate
        if (wAOI22 == 1 && s0_IS_INV == 0) begin
            INV inv_a_t (.a(s0[0]), .z(s0_in[0]));
            INV inv_a_f (.a(s0[1]), .z(s0_in[1]));
        end else begin 
            assign s0_in[0] = s0[0];
            assign s0_in[1] = s0[1];
        end
    endgenerate

    DRP_MUX4_RAIL #(.wAOI22(wAOI22), .s0_IS_INV(wAOI22)) mux_inst_t (.s0(s0_in), .s1(s1), .d(d_t), .z(z[0]));
    DRP_MUX4_RAIL #(.wAOI22(wAOI22), .s0_IS_INV(wAOI22)) mux_inst_f (.s0(s0_in), .s1(s1), .d(d_f), .z(z[1]));

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module DRP_MUX4_parallel #( parameter wAOI22 = 0, NUM_INPUTS = 1 ) (s0, s1, d, z);
    input  [1:0] s0;
    input  [1:0] s1;
    input  [NUM_INPUTS*8-1:0] d;
    output [NUM_INPUTS*2-1:0] z;

    (* keep = "true", dont_touch = "yes" *) wire [1:0] s0_in;

    generate
        if (wAOI22 == 1) begin
            INV inv_a_t (.a(s0[0]), .z(s0_in[0]));
            INV inv_a_f (.a(s0[1]), .z(s0_in[1]));
        end else begin 
            assign s0_in[0] = s0[0];
            assign s0_in[1] = s0[1];
        end

        genvar i;
        for (i = 0; i < NUM_INPUTS; i=i+1) begin : loop_gen_parallel_muxes_

            DRP_MUX4 #(.wAOI22(wAOI22), .s0_IS_INV(wAOI22)) mux_inst (.s0(s0_in), .s1(s1), .d_t(d[i*8+3:i*8]), .d_f(d[i*8+7:i*8+4]), .z(z[i*2+1:i*2]));

        end
    endgenerate

endmodule

//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module DRP_XOR2_TREE #( parameter NUM_INPUTS = 6, wAOI22 = 0 ) (a, z);
    localparam NEXT_INPUTS = (NUM_INPUTS + 1) / 2;
    
    input  [2*NUM_INPUTS-1:0] a;
    output [1:0] z;

    wire [2*NEXT_INPUTS-1:0] next_tree_stage_inputs;

    genvar i;
    generate
        
        if (NUM_INPUTS < 1) begin : gen_invalid_
            initial begin
                $error("%m: NUM_INPUTS=%0d is invalid. INPUTS must be >= 1.", NUM_INPUTS);
                $finish;
            end

        end else if (NUM_INPUTS == 1) begin : gen_one_
            assign z[0] = a[0];
            assign z[1] = a[1];

            assign next_tree_stage_inputs = 2'b00;
            wire [2*NEXT_INPUTS-1:0] unused_next_tree_stage_inputs;
            assign unused_next_tree_stage_inputs = next_tree_stage_inputs; 

        end else begin : gen_tree_

            for (i = 0; i < (NUM_INPUTS/2); i=i+1) begin : loop_gen_nodes_

                DRP_XOR2 #(.wAOI22(wAOI22)) xor_inst (.a_t(a[4*i]), .a_f(a[4*i+1]), .b_t(a[4*i+2]), .b_f(a[4*i+3]), .z_t(next_tree_stage_inputs[2*i]), .z_f(next_tree_stage_inputs[2*i+1]));

            end

            if ((NUM_INPUTS % 2) != 0) begin : gen_forward_last_
                assign next_tree_stage_inputs[2*(NUM_INPUTS/2)+0] = a[2*NUM_INPUTS-2];
                assign next_tree_stage_inputs[2*(NUM_INPUTS/2)+1] = a[2*NUM_INPUTS-1];
            end

            DRP_XOR2_TREE #(.NUM_INPUTS(NEXT_INPUTS), .wAOI22(wAOI22)) xor_tree_inst (.a(next_tree_stage_inputs), .z(z));

        end

    endgenerate
    
endmodule

//-----------------------------------------

module SRtDR_conversion #( parameter WIDTH = 1, CHUNK_WIDTH = 1, SWAP_RAILS = 0)(a, z);
    input  [WIDTH-1:0]   a;
    output [2*WIDTH-1:0] z;

    genvar i;
    generate

        if ((WIDTH % CHUNK_WIDTH) != 0) begin : gen_invalid_
            initial begin
                $error("WIDTH must be divisible by CHUNK_WIDTH");
                $finish;
            end

        end else begin : gen_conversion_

            for (i = 0; i < WIDTH/CHUNK_WIDTH; i = i+1) begin : gen_conversion_loop_

                if (SWAP_RAILS == 0) begin : gen_normal_

                    assign z[2*CHUNK_WIDTH*(i+1)-1:2*CHUNK_WIDTH*i] = {
                        ~a[CHUNK_WIDTH*(i+1)-1:CHUNK_WIDTH*i],
                        a[CHUNK_WIDTH*(i+1)-1:CHUNK_WIDTH*i]
                    };

                end else begin : gen_swapped_

                    assign z[2*CHUNK_WIDTH*(i+1)-1 : 2*CHUNK_WIDTH*i] = {
                        a[CHUNK_WIDTH*(i+1)-1:CHUNK_WIDTH*i],
                        ~a[CHUNK_WIDTH*(i+1)-1:CHUNK_WIDTH*i]
                    };

                end

            end
        end

    endgenerate

endmodule

//-----------------------------------------
// -- Gadget Layer Modules ----------------
//-----------------------------------------

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module mtg_opt_t_only #( parameter invT3 = 1) (a, b, r, t_in);
    input        r;
    input        a;
    input        b;
    output [3:0] t_in;  

    wire t0;
    wire t1;
    wire t2;
    wire t3;

    assign t0 = r;
    XOR2 xor2_inst1 (.a(a), .b(t0), .z(t1));
    XOR2 xor2_inst2 (.a(b), .b(t0), .z(t2));

    generate
        if (invT3 == 1) begin : first_mtg_instance_
            XOR2  xor2_inst3 (.a(b), .b(t1), .z(t3));
        end else begin : following_mtg_instance_
            XNOR2 xor2_inst3 (.a(b), .b(t1), .z(t3));
        end
    endgenerate

    assign t_in[0] = t0;
    assign t_in[1] = t1;
    assign t_in[2] = t2;
    assign t_in[3] = t3;
   
endmodule

(* keep_hierarchy = "yes", dont_touch = "yes" *)
module mtg_opt #( parameter invT3 = 1) (a, b, r, t_in);
    input        r;
    input        a;
    input        b;
    output [7:0] t_in;  

    mtg_opt_t_only #(.invT3(invT3)) mtg_t_inst (.a(a), .b(b), .r(r), .t_in(t_in[7:4]));

    assign t_in[0] = ~t_in[4];
    assign t_in[1] = ~t_in[5];
    assign t_in[2] = ~t_in[6];
    assign t_in[3] = ~t_in[7];
   
endmodule

//-----------------------------------------

module CCHPC_DRtSR_XOR_COMP #(parameter NUM_INPUTS = 1, INVERT = 0) (a, z);
    input  [NUM_INPUTS-1:0] a;
    output                  z;

    generate
        if (INVERT == 0) begin : gen_xor_
            assign z = ^a;
        end else begin : gen_xnor_
            assign z = ~(^a);
        end
    endgenerate

endmodule

//-----------------------------------------


module CCHPC_DRtSR_generic_merge #(parameter security_order = 1) (a_layer0, a_duality0, a_duality1, z);
    parameter integer d = security_order+1;

    input              a_layer0;
    input  [2*(d-1):1] a_duality0;
    input  [2*(d-1):1] a_duality1;
    output [d-1:0]     z;

    genvar l;
    generate

        assign z[0] = a_layer0;

        for (l = 1; l < d; l = l+1) begin : gen_merge_

            wire unused_a_duality0;
            wire unused_a_duality1;

            assign unused_a_duality0 = a_duality0[2*l-1];
            assign unused_a_duality1 = a_duality1[2*l-1];

            NOR2 merge_inst (.a(a_duality0[2*l]), .b(a_duality1[2*l]), .z(z[l]));

        end

    endgenerate

endmodule

