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

module OR2 (a, b, z);
    input  a;
    input  b;
    output z;
	
	assign z = a | b;

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

module NOR2 (a, b, z);
    input  a;
    input  b;
    output z;
	
	assign z = ~(a | b);

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



//-----------------------------------------
// -- DUAL-RAIL GADGETS -------------------
//-----------------------------------------

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

module WDDL_XOR (a_t, a_f, b_t, b_f, z_t, z_f);
    input  a_t;
    input  a_f;
    input  b_t;
    input  b_f;
    output z_t;
    output z_f;

    wire [3:0] w;

    AND2 U1 (.a( a_t), .b( b_f), .z(w[0]));
    AND2 U2 (.a( a_f), .b( b_t), .z(w[1]));
    OR2  U3 (.a(w[0]), .b(w[1]), .z( z_t));

    OR2  U4 (.a( a_f), .b( b_t), .z(w[2]));
    OR2  U5 (.a( a_t), .b( b_f), .z(w[3]));
    AND2 U6 (.a(w[2]), .b(w[3]), .z( z_f));

endmodule

//-----------------------------------------

module MUX_selDR (x, y, s_t, s_f, z);
    input  x;
    input  y;
    input  s_t;
    input  s_f;
    output z;

    // multiplexer with dual-rail select

    wire [1:0] w;

    AND2 U1 (.a(   x), .b( s_t), .z(w[0]));
    AND2 U2 (.a(   y), .b( s_f), .z(w[1]));
    OR2  U3 (.a(w[0]), .b(w[1]), .z(   z));

endmodule

//-----------------------------------------

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

module DRP_XOR (a_t, a_f, b_t, b_f, z_t, z_f);
    input  a_t;
    input  a_f;
    input  b_t;
    input  b_f;
    output z_t;
    output z_f;

    MUX_selDR U1 (.x(a_t), .y(b_t), .s_t(b_f), .s_f(a_f), .z(z_t));
    MUX_selDR U2 (.x(a_t), .y(b_f), .s_t(b_t), .s_f(a_f), .z(z_f));

endmodule

//-----------------------------------------

module DRP_MUX (a_t, a_f, b_t, b_f, s_t, s_f, z_t, z_f);
    input  a_t;
    input  a_f;
    input  b_t;
    input  b_f;
    input  s_t;
    input  s_f;
    output z_t;
    output z_f;
      
    MUX_selDR U1 (.x(a_t), .y(b_t), .s_t(s_t), .s_f(s_f), .z(z_t));
    MUX_selDR U2 (.x(a_f), .y(b_f), .s_t(s_t), .s_f(s_f), .z(z_f));

endmodule

//-----------------------------------------

module DRP_XOR_TREE #( parameter INPUTS = 6 ) (a, z);
    input  [2*INPUTS-1:0] a;
    output [1:0] z;

    wire [INPUTS+(INPUTS%2)-1:0] next_tree_stage_inputs; 

    genvar i;
    generate
        
            for (i = 0; i < (INPUTS/2); i=i+1) begin : loop_gen_nodes_

                DRP_XOR xor_inst (.a_t(a[4*i]), .a_f(a[4*i+1]), .b_t(a[4*i+2]), .b_f(a[4*i+3]), .z_t(next_tree_stage_inputs[2*i]), .z_f(next_tree_stage_inputs[2*i+1]));

            end

            if (INPUTS == 2) begin : last_node_   // end of recursion

                assign z = next_tree_stage_inputs;

            end else if (INPUTS % 2 == 0) begin : next_tree_stage_even_inputs_  // instantiate next tree stage

                DRP_XOR_TREE #(.INPUTS(INPUTS/2)) xor_tree_inst (.a(next_tree_stage_inputs), .z(z));        

            end else begin : next_tree_stage_uneven_inputs_   // for an uneven amount of inputs: instantiate next tree stage and keep additional unprocessed input

                assign next_tree_stage_inputs[INPUTS-1] = a[2*INPUTS-2];
                assign next_tree_stage_inputs[INPUTS]   = a[2*INPUTS-1];
                DRP_XOR_TREE #(.INPUTS((INPUTS+1)/2)) xor_tree_inst (.a(next_tree_stage_inputs), .z(z));

            end

    endgenerate
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

    wire [1:0] w;
    
    MUX_selDR_wNAND U1 (.x(a_t), .y(b_t), .s_t(b_f), .s_f(a_f), .z(z_t));
    MUX_selDR_wNAND U2 (.x(a_t), .y(b_f), .s_t(b_t), .s_f(a_f), .z(z_f));

endmodule

//-----------------------------------------

module DRP_MUX_wNAND (a_t, a_f, b_t, b_f, s_t, s_f, z_t, z_f);
    input  a_t;
    input  a_f;
    input  b_t;
    input  b_f;
    input  s_t;
    input  s_f;
    output z_t;
    output z_f;

    MUX_selDR_wNAND U1 (.x(a_t), .y(b_t), .s_t(s_t), .s_f(s_f), .z(z_t));
    MUX_selDR_wNAND U2 (.x(a_f), .y(b_f), .s_t(s_t), .s_f(s_f), .z(z_f));

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

            if (INPUTS == 2) begin : last_node_   // end of recursion

                assign z = next_tree_stage_inputs;

            end else if (INPUTS % 2 == 0) begin : next_tree_stage_even_inputs_  // instantiate next tree stage

                DRP_XOR_TREE_wNAND #(.INPUTS(INPUTS/2)) xor_tree_inst (.a(next_tree_stage_inputs), .z(z));        

            end else begin : next_tree_stage_uneven_inputs_   // for an uneven amount of inputs: instantiate next tree stage and keep additional unprocessed input

                assign next_tree_stage_inputs[INPUTS-1] = a[2*INPUTS-2];
                assign next_tree_stage_inputs[INPUTS]   = a[2*INPUTS-1];
                DRP_XOR_TREE_wNAND #(.INPUTS((INPUTS+1)/2)) xor_tree_inst (.a(next_tree_stage_inputs), .z(z));

            end

    endgenerate
endmodule

//-----------------------------------------
