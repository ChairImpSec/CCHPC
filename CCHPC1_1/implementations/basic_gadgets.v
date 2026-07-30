`timescale 1ps/1ps

//-----------------------------------------
// -- SINGLE-RAIL GATES -------------------
//-----------------------------------------

module INV (a, z);
    input  a;
    output z;
	
	assign z = ~a;

endmodule	

//-----------------------------------------

module AND2 (a, b, z);
    input  a;
    input  b;
    output z;
	
	assign z = a & b;

endmodule	

//-----------------------------------------

module AND3 (a, b, c, z);
    input  a;
    input  b;
    input  c;
    output z;
	
	assign z = a & b & c;

endmodule	

//-----------------------------------------

module AND4 (a, b, c, d, z);
    input  a;
    input  b;
    input  c;
    input  d;
    output z;
	
	assign z = a & b & c & d;

endmodule	

//-----------------------------------------

module OR2 (a, b, z);
    input  a;
    input  b;
    output z;
	
	assign z = a | b;

endmodule	

//-----------------------------------------

module OR3 (a, b, c, z);
    input  a;
    input  b;
    input  c;
    output z;
	
	assign z = a | b | c;

endmodule	

//-----------------------------------------

module OR4 (a, b, c, d, z);
    input  a;
    input  b;
    input  c;
    input  d;
    output z;
	
	assign z = a | b | c | d;

endmodule	

//-----------------------------------------

module XOR2 (a, b, z);
    input  a;
    input  b;
    output z;
	
	assign z = a ^ b;

endmodule

//-----------------------------------------

module XNOR2 (a, b, z);
    input  a;
    input  b;
    output z;
	
	assign z = ~(a ^ b);

endmodule

//-----------------------------------------

module NAND2 (a, b, z);
    input  a;
    input  b;
    output z;
	
	assign z = ~(a & b);

endmodule	

//-----------------------------------------

module NAND3 (a, b, c, z);
    input  a;
    input  b;
    input  c;
    output z;
	
	assign z = ~(a & b & c);

endmodule	

//-----------------------------------------

module NAND4 (a, b, c, d, z);
    input  a;
    input  b;
    input  c;
    input  d;
    output z;
	
	assign z = ~(a & b & c & d);

endmodule	

//-----------------------------------------

module NOR2 (a, b, z);
    input  a;
    input  b;
    output z;
	
	assign z = ~(a | b);

endmodule	

//-----------------------------------------

module NOR3 (a, b, c, z);
    input  a;
    input  b;
    input  c;
    output z;
	
	assign z = ~(a | b | c);

endmodule

//-----------------------------------------

module NOR4 (a, b, c, d, z);
    input  a;
    input  b;
    input  c;
    input  d;
    output z;
	
	assign z = ~(a | b | c | d);

endmodule	

//-----------------------------------------

module MUX2 (s, a, b, z);
    input  s;
    input  a;
    input  b;
    output z;
	
	assign z = (~s & a) | (s & b);

endmodule	

//-----------------------------------------

module AOI22 (a, b, c, d, z);
    input  a;
    input  b;
    input  c;
    input  d;
    output z;
	
	assign z = ~((a & b) | (c & d));

endmodule	

//-----------------------------------------

module OAI22 (a, b, c, d, z);
    input  a;
    input  b;
    input  c;
    input  d;
    output z;
	
	assign z = ~((a | b) & (c | d));

endmodule

//-----------------------------------------

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

module REG_r (clk, rst, d, q);
    input  clk;
    input  rst;
    input  d;
    output reg q;

    always @(posedge clk)
    begin
      if (rst)
        q <= 0;
      else
        q <= d;
    end

endmodule

//-----------------------------------------

module REG_r_1 (clk, rst, d, q);
    input  clk;
    input  rst;
    input  d;
    output reg q;

    always @(posedge clk)
    begin
      if (rst)
        q <= 1;
      else
        q <= d;
    end

endmodule

//-----------------------------------------

module REG_pipeline_vec #(  parameter depth = 2
)(
    clk, a, z
);

    input  clk;
    input  a;
    output [depth:0] z;
//output [0:0] z;

//assign z = a;

    //-- intermediates ------------------------
    wire [depth:0] w;


    //-----------------------------------------
    //-- registers ----------------------------
    //-----------------------------------------
    assign w[0] = a; 

    genvar i;
    generate
        for (i = 0; i < depth; i=i+1) begin : loop_gen_regs_

            REG #(.WIDTH(1)) reg_inst (.clk(clk), .d(w[i]), .q(w[i+1]));

        end
    endgenerate  

    assign z[depth:0] = w[depth:0];

endmodule

//-----------------------------------------

module NOR_prch_vec #(  parameter WIDTH = 2
)(
    prch, a, z
);

    input  prch;
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

module REG_prch_wNOR #(  parameter WIDTH = 2
)(
    clk, prch, a, z
);

    input  clk;
    input  prch;
    input  [WIDTH-1:0] a;
    output [WIDTH-1:0] z;

    wire [WIDTH-1:0] w;

    NOR_prch_vec #(.WIDTH(WIDTH)) ctrl_inst (prch, a[WIDTH-1:0], w[WIDTH-1:0]);
    REG          #(.WIDTH(WIDTH)) reg_inst  (clk,  w[WIDTH-1:0], z[WIDTH-1:0]);

endmodule

//-----------------------------------------



//-----------------------------------------
// -- DUAL-RAIL GADGETS (utilize NAND) ----
//-----------------------------------------

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

module DRP_XOR_wNAND (a_t, a_f, b_t, b_f, z_t, z_f);
    input  a_t;
    input  a_f;
    input  b_t;
    input  b_f;
    output z_t;
    output z_f;

    //wire [3:0] w;

    //NAND2 U1 (.a( a_t), .b( b_f), .z(w[0]));
    //NAND2 U2 (.a( a_f), .b( b_t), .z(w[1]));
    //NAND2 U3 (.a(w[0]), .b(w[1]), .z( z_t));

    //NAND2 U4 (.a( a_t), .b( b_t), .z(w[2]));
    //NAND2 U5 (.a( a_f), .b( b_f), .z(w[3]));
    //NAND2 U6 (.a(w[2]), .b(w[3]), .z( z_f));

    wire [1:0] w;
    
    MUX_selDR_wNAND U1 (.x(a_t), .y(b_t), .s_t(b_f), .s_f(a_f), .z(z_t));
    MUX_selDR_wNAND U2 (.x(a_t), .y(b_f), .s_t(b_t), .s_f(a_f), .z(z_f));

endmodule

//-----------------------------------------

module DRP_XOR_TREE_wNAND #( parameter INPUTS = 6 ) (a, z);
    input  [2*INPUTS-1:0] a;
    output [1:0] z;

    wire [INPUTS+(INPUTS%2)-1:0] next_tree_stage_inputs; 

    genvar i;
    generate
        
            for (i = 0; i < (INPUTS/2); i=i+1) begin : loop_gen_nodes_

                DRP_XOR_wNAND xor_inst (.a_t(a[4*i]), .a_f(a[4*i+1]), .b_t(a[4*i+2]), .b_f(a[4*i+3]), .z_t(next_tree_stage_inputs[2*i]), .z_f(next_tree_stage_inputs[2*i+1]));

            end

            if (INPUTS == 2) begin : last_node_   // end of tree reached

                assign z = next_tree_stage_inputs;

            end else if (INPUTS % 2 == 0) begin : next_tree_stage_even_inputs_  // instantiate next tree stage

                DRP_XOR_TREE_wNAND #(.INPUTS(INPUTS/2)) xor_tree_inst (.a(next_tree_stage_inputs), .z(z));        

            end else begin : next_tree_stage_uneven_inputs_   // for an uneven amount of inputs: instantiate next tree stage with additional unprocessed input

                assign next_tree_stage_inputs[INPUTS-1] = a[2*INPUTS-2];
                assign next_tree_stage_inputs[INPUTS]   = a[2*INPUTS-1];
                DRP_XOR_TREE_wNAND #(.INPUTS((INPUTS+1)/2)) xor_tree_inst (.a(next_tree_stage_inputs), .z(z));

            end

    endgenerate
endmodule

//-----------------------------------------


//-----------------------------------------
// -- Gadget Layer Modules ----------------
//-----------------------------------------

module mtg_opt_t_only #( parameter invT3 = 1) (
    a, b, r, t_in
);

    input        r;
    input        a;
    input        b;
    output [3:0] t_in;  

    assign t_in[0] = r;
    XOR2 xor2_inst1 (.a(a), .b(t_in[0]), .z(t_in[1]));
    XOR2 xor2_inst2 (.a(b), .b(t_in[0]), .z(t_in[2]));

    generate
        if (invT3 == 1) begin : first_mtg_instance
            XOR2  xor2_inst3 (.a(b), .b(t_in[1]), .z(t_in[3]));
        end else begin : following_mtg_instance
            XNOR2 xor2_inst3 (.a(b), .b(t_in[1]), .z(t_in[3]));
        end
    endgenerate
   
endmodule

module mtg_opt #( parameter invT3 = 1) (
    a, b, r, t_in
);

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

module op_opt (
    a, b, t_out, z
);
    input  [2:1] a; 
    input  [2:1] b; 
    input  [3:0] t_out;
    output       z;  

    wire [3:0] s;  

    NAND3 nand3_inst3 (.a(t_out[3]), .b(a[1]), .c(b[1]), .z(s[3]));
    NAND3 nand3_inst2 (.a(t_out[2]), .b(a[1]), .c(b[2]), .z(s[2]));
    NAND3 nand3_inst1 (.a(t_out[1]), .b(a[2]), .c(b[1]), .z(s[1]));
    NAND3 nand3_inst0 (.a(t_out[0]), .b(a[2]), .c(b[2]), .z(s[0]));
    
    NAND4 nand4_inst0 (.a(s[3]), .b(s[2]), .c(s[1]), .d(s[0]), .z(z));


endmodule
