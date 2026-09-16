module nonlinear_CCHPC1_1_generic_layer0 #( parameter security_order = 1, zINV = 1'b0, FORWARD_R = 0
)(
    a, b, randL0, z, r_fwd
);
    parameter integer d = security_order+1;

    input  [d-2:0] randL0;   // single-rail random bits
    input          a;        // single-rail share
    input          b;        //
    output         z;        //
    output         r_fwd;    // random input for M(1,0)


    wire randL0_comp;
    wire a0nandb0;
    wire rand_nl;
    wire nl_out;

    //-----------------------------------------
    //-- layer0 (single-rail) -----------------
    //-----------------------------------------

    assign randL0_comp = ^randL0;

    NAND2 nand2_inst (.a(a), .b(b), .z(a0nandb0));

    generate

        // forwards the nonlinear term to M(1,0) or keeps the paper construction
        if (FORWARD_R == 0) begin : gen_default_

            assign rand_nl = randL0_comp;
            assign z       = nl_out;
            assign r_fwd   = randL0[0];

        end else begin : gen_forward_

            assign rand_nl = randL0[0];
            assign z       = randL0_comp;
            assign r_fwd   = nl_out;

        end

        // inverts output share0 based on config bit without overhead
        if (zINV == 1'b0) begin : gen_out_

            XNOR2 xor2_inst (.a(a0nandb0), .b(rand_nl), .z(nl_out));

        end else begin: gen_out_inv_

            XOR2 xor2_inst (.a(a0nandb0), .b(rand_nl), .z(nl_out));

        end

    endgenerate

endmodule

