module REG_SRtDR #( parameter security_order = 1, INV = 1'b0
)(
    clk, prch, a, z
);
    parameter integer d = security_order+1;

    input         clk;
    input [d-2:0] prch;

    input  [  (d-1):0] a;       // share format: {..., a[2], a[1], a[0]} = {..., a^1_f, a^1_t, a^0}, ^ indicates share index, _ indicates rail
    output [2*(d-1):0] z;       //
    
    //-- config -------------------------------
    wire [2*(d-1):1] dr;        // dual-rail input
    wire [2*(d-1):1] dr_prch;   // dual-rail input pre-charged



    //-----------------------------------------
    //-- layer0 (single-rail) -----------------
    //-----------------------------------------

    REG #(.WIDTH(1)) reg_layer0_inst (clk, a[0], z[0]); // share 0 single-rail               

    //-----------------------------------------
    //-- consecutive layers (dual-rail) -------
    //-----------------------------------------

    genvar i;
    generate       
        for (i = 0; i < (d-1); i=i+1) begin : loop_gen_layer_

            // convert all shares > 0 to dual-rail
            assign dr[2*i+1] = a[i+1];
            INV not_inst (.a(dr[2*i+1]), .z(dr[2*i+2]));

            // pre-charge each layer
            NOR2 prch_inst0 (.a(dr[2*i+1]), .b(prch[i]), .z(dr_prch[2*i + ((INV && i == d-2) ? 1 : 2)]));
            NOR2 prch_inst1 (.a(dr[2*i+2]), .b(prch[i]), .z(dr_prch[2*i + ((INV && i == d-2) ? 2 : 1)]));

            // register stage
            REG #(.WIDTH(2)) reg_inst (clk, dr_prch[2*i+2:2*i+1], z[2*i+2:2*i+1]);

        end
    endgenerate


endmodule