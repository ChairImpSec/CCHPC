module linear_CCHPC1_1_SRtSR #( parameter security_order = 1, CONF = 1'b0, INV = 1'b0
                                                            // 1'b0: xor
                                                            // 1'b1: xnor
)(
    a, b, z
);
    parameter integer d = security_order+1;

    input  [d-1:0] a;       // share format: {..., a[2], a[1], a[0]} = {..., a^1_f, a^1_t, a^0}, ^ indicates share index, _ indicates rail
    input  [d-1:0] b;       //
    output [d-1:0] z;       //
    

    //-----------------------------------------
    //-- layer0 (single-rail) -----------------
    //-----------------------------------------

    generate
        if ((CONF ^ INV) == 1'b0) begin : gen_out_
            XOR2 layer0_xor (.a(a[0]), .b(b[0]), .z(z[0]));
          end else begin: gen_out_inv_
            XNOR2 layer0_xnor (.a(a[0]), .b(b[0]), .z(z[0]));
        end
    endgenerate

    //-----------------------------------------
    //-- consecutive layers (dual-rail) -------
    //-----------------------------------------

    genvar i;
    generate       
        for (i = 1; i < d; i=i+1) begin : loop_gen_layer_
            XOR2 xor_inst (.a(a[i]), .b(b[i]), .z(z[i]));
        end
    endgenerate



endmodule