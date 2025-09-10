module precharger_reg_CCHPC #(  parameter security_order = 2
)(
    clk, rst, prch, a, z
);

    parameter integer d = security_order+1;

    input  clk;
    input  rst;
    input  [d-2:0] prch;     // for every layer except layer0
    input  a;
    output [2*d-2:0] z;

    //-- intermediates ------------------------
    wire [2*d-3:0] w;



    //-----------------------------------------
    //-- layer0 (single-rail) -----------------
    //-----------------------------------------

    assign z[0] = a;

    //-----------------------------------------
    //-- consecutive layers (dual-rail) -------
    //-----------------------------------------

    REG_r reg_inst1 (.clk(clk), .rst(prch[0]), .d( a), .q(w[0]));
    REG_r reg_inst2 (.clk(clk), .rst(prch[0]), .d(~a), .q(w[1]));
    assign z[1] = w[0];
    assign z[2] = w[1];

    genvar i;
    generate 
        for (i = 1; i < (d-1); i=i+1) begin : loop_gen_layer_

            REG_r reg_inst0 (.clk(clk), .rst(prch[i]), .d(w[2*i-2]), .q(w[2*i  ]));
            REG_r reg_inst1 (.clk(clk), .rst(prch[i]), .d(w[2*i-1]), .q(w[2*i+1]));
            assign z[2*i+1] = w[2*i  ];
            assign z[2*i+2] = w[2*i+1];

        end
    endgenerate

endmodule