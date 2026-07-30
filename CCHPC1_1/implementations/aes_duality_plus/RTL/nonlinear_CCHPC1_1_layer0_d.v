module nonlinear_CCHPC1_1_layer0_d #( parameter security_order = 1, CONF = 2'b00
                                                                 // 2'b00: and
                                                                 // 2'b01: nand
                                                                 // 2'b10: nor
                                                                 // 2'b11: or
)(
    a, b, r, z
);
    parameter integer d = security_order+1;

    input  [((d*(d-1)))-1:0] r;   // dual-rail random bits
    input                    a;   // single-rail
    input                    b;   //
    output                   z;   //


    wire randL0;
    wire a0nandb0;

    //-----------------------------------------
    //-- layer0 (single-rail) -----------------
    //-----------------------------------------

    generate

        if (d == 2) begin : first_order

            assign randL0 = r[0];

        end
        if (d == 3) begin : second_order

            assign randL0 = r[0] ^ r[2];

        end
        if (d == 4) begin : third_order

            assign randL0 = r[0] ^ r[2] ^ r[6];

        end


        NAND2 nand2_inst (.a(a), .b(b), .z(a0nandb0));

        if (CONF[0] == 1'b0) begin : gen_out_   // inverts output share 0 based on config bit without overhead

            XNOR2 xor2_inst (.a(a0nandb0), .b(randL0), .z(z));

        end else begin: gen_out_inv_

            XOR2 xor2_inst (.a(a0nandb0), .b(randL0), .z(z));

        end


    endgenerate

endmodule