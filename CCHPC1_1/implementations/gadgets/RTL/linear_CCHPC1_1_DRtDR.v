module linear_CCHPC1_1_DRtDR #( parameter security_order = 1, CONF = 1'b0, INV = 1'b0
                                                            // 1'b0: xor
                                                            // 1'b1: xnor
)(
    a, b, z
);
    parameter integer d = security_order+1;

    input  [2*(d-1):0] a;       // share format: {..., a[2], a[1], a[0]} = {..., a^1_f, a^1_t, a^0}, ^ indicates share index, _ indicates rail
    input  [2*(d-1):0] b;       //
    output [2*(d-1):0] z;       //
    
    //-- config -------------------------------
    wire [2*(d-1):1] tmp;


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
        for (i = 0; i < (d-1); i=i+1) begin : loop_gen_layer_

            AOI22 aoi22_inst0 (.a(a[2*i+1]), .b(b[2*i+2]), .c(a[2*i+2]), .d(b[2*i+1]), .z(tmp[2*i+1]));
            AOI22 aoi22_inst1 (.a(a[2*i+1]), .b(b[2*i+1]), .c(a[2*i+2]), .d(b[2*i+2]), .z(tmp[2*i+2]));
            INV inv_inst0 (.a(tmp[2*i+1]), .z(z[2*i+1]));
            INV inv_inst1 (.a(tmp[2*i+2]), .z(z[2*i+2]));

        end
    endgenerate

endmodule