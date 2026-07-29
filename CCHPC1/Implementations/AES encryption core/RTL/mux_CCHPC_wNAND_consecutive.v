module mux_CCHPC_wNAND_consecutive #(  parameter security_order = 2
)(
    a, b, s, z
);

    parameter integer d = security_order+1;

    input  [2*d-2:1] s;       // unshared (should not depend on secret)
    input  [2*d-2:1] a;       // share format: {..., a[2], a[1], a[0]} = {..., a^1_f, a^1_t, a^0}, ^ indicates share index, _ indicates rail
    input  [2*d-2:1] b;       //
    output [2*d-2:1] z;       //

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