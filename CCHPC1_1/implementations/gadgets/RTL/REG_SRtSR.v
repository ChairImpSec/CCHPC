module REG_SRtSR #( parameter security_order = 1, INV = 1'b0
)(
    clk, prch, a, z
);
    parameter integer d = security_order+1;

    input         clk;
    input [d-2:0] prch;

    input  [(d-1):0] a;       // share format: {..., a[2], a[1], a[0]} = {..., a^1_f, a^1_t, a^0}, ^ indicates share index, _ indicates rail
    output [(d-1):0] z;       //
    

    //-----------------------------------------
    //-- layer0 (single-rail) -----------------
    //-----------------------------------------

    generate
        if (INV) begin : gen_layer0_inv_
            REG #(.WIDTH(1)) reg_layer0_inst (clk, ~a[0], z[0]);
        end else begin : gen_layer0_
            REG #(.WIDTH(1)) reg_layer0_inst (clk,  a[0], z[0]);
        end
    endgenerate

    //-----------------------------------------
    //-- consecutive layers (dual-rail) -------
    //-----------------------------------------

    REG #(.WIDTH(d-1)) reg_layer0_inst (clk, a[d-1:1], z[d-1:1]);

endmodule