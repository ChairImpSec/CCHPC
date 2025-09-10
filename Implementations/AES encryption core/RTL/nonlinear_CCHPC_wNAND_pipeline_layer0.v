module nonlinear_CCHPC_wNAND_pipeline_layer0 #(  parameter security_order = 2
)(
    a, b, r, z
);

    parameter integer d = security_order+1;

    input  [(d-1)*d-1:0] r; // required random bits in format {..., r[3], r[2], r[1], r[0]} = {..., r_1_f, r_1_t, r_0_f, r_0_t}, first _ indicates random bit index, second _ indicates rail
    input  a;               // single-rail
    input  b;               //
    output z;               //

    //-- layer0 -------------------------------
    wire [d-1:0] layer0_wires;

    //-----------------------------------------
    //-- layer0 (single-rail) -----------------
    //-----------------------------------------

    genvar i;
    generate
        AND2 layer0_and (.a(a), .b(b), .z(layer0_wires[0]));

        for (i = 0; i < (d-1); i=i+1) begin : loop_gen_layer_0_
            XOR2 xor_rand_inst (.a(layer0_wires[i]), .b(r[i*(i+1)]), .z(layer0_wires[i+1]));
        end

        assign z = layer0_wires[d-1];
    endgenerate   

endmodule