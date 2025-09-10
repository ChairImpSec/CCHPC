module mux_CCHPC_wNAND #(  parameter security_order = 2
)(
    a, b, s, z
);

    parameter integer d = security_order+1;

    input  [2*d-2:0] a;       // share format: {..., a[2], a[1], a[0]} = {..., a^1_f, a^1_t, a^0}, ^ indicates share index, _ indicates rail
    input  [2*d-2:0] b;       //
    input  [2*d-2:0] s;       // unshared (should not depend on secret)
    output [2*d-2:0] z;       //



    //-- intermediates ------------------------
    wire [2+4*(d-1)-1:0] w;
    


    //-----------------------------------------
    //-- layer0 (single-rail) -----------------
    //-----------------------------------------

    XOR2 layer0_xor0 (.a(a[0]), .b(b[0]), .z(w[0]));
    AND2 layer0_and  (.a(s[0]), .b(w[0]), .z(w[1]));
    XOR2 layer0_xor1 (.a(w[1]), .b(b[0]), .z(z[0]));
     

    //-----------------------------------------
    //-- consecutive layers (dual-rail) -------
    //-----------------------------------------

    genvar i;
    generate       
        for (i = 0; i < (d-1); i=i+1) begin : loop_gen_layer_
            DRP_MUX_wNAND mux_inst (.a_t(a[2*i+1]), .a_f(a[2*i+2]), .b_t(b[2*i+1]), .b_f(b[2*i+2]), .s_t(s[2*i+1]), .s_f(s[2*i+2]), .z_t(z[2*i+1]), .z_f(z[2*i+2]));
        end
    endgenerate


endmodule