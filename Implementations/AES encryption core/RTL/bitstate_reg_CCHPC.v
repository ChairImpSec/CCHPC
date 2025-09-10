module bitstate_reg_CCHPC #(  parameter security_order = 2
)(
    clk, rst, a, z
);

    parameter integer d = security_order+1;

    input  clk;
    input  rst;
    input  [2*d-2:0] a;
    output [2*d-2:0] z;



    //-----------------------------------------
    //-- layer0 (single-rail) -----------------
    //-----------------------------------------

    REG_r reg_inst_layer0 (.clk(clk), .rst(rst), .d(a[0]), .q(z[0]));



    //-----------------------------------------
    //-- consecutive layers (dual-rail) -------
    //-----------------------------------------

    genvar i;
    generate
        for (i = 0; i < (d-1); i=i+1) begin : loop_gen_layer_

            REG_r reg_inst0 (.clk(clk), .rst(rst), .d(a[2*i+1]), .q(z[2*i+1]));
            REG_r reg_inst1 (.clk(clk), .rst(rst), .d(a[2*i+2]), .q(z[2*i+2]));

        end
    endgenerate  

endmodule