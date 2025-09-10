module controller_CCHPC #(  parameter security_order = 2
)(
    clk, rst, done_layer0, done, prch0, prch1, prch_sel0, prch_sel1, sel, cnt_rst
);

    parameter integer d = security_order+1;

    input  clk;
    input  rst;
    input  done_layer0;
    output [d-1:0] done;
    output [d-2:0] prch0;       // for every layer except layer0
    output [d-2:0] prch1;       //
    output [d-2:0] prch_sel0;   // selects for randomness distribution in round instances 
    output [d-2:0] prch_sel1;   //
    output [2*d-2:0] sel;       // for every layer (layer0 in single rail)
    output cnt_rst;

    //-- intermediates ------------------------
    wire inverted;
    wire out0;
    wire [d-2:0] rst_del;
    
    wire [d-1:0] prch0_tmp;
    wire [d-1:0] prch1_tmp;

    wire sel0_inv;


    //-----------------------------------------
    //-- prch signal generation ---------------
    //-----------------------------------------
    // pre-charge signal offset is one clock cycle per layer
    
    assign inverted = ~prch0_tmp[0];
    REG_r reg_prech_init_inst (.clk(clk), .rst(rst), .d(inverted), .q(out0));

    assign prch0_tmp[0] = out0     | rst;
    assign prch1_tmp[0] = inverted | rst;

    genvar i;
    generate
        for (i = 0; i < (d-1); i=i+1) begin : loop_prch_gen_layer_

            REG_r_1 reg_prch0_inst (.clk(clk), .rst(rst), .d(prch0_tmp[i]), .q(prch0_tmp[i+1]));
            REG_r_1 reg_prch1_inst (.clk(clk), .rst(rst), .d(prch1_tmp[i]), .q(prch1_tmp[i+1]));

            assign prch_sel0[i] = prch0_tmp[i];
            assign prch_sel1[i] = prch1_tmp[i];

            assign prch0[i] = prch0_tmp[i+1];
            assign prch1[i] = prch1_tmp[i+1];

        end
    endgenerate

    

    //-----------------------------------------
    //-- sel signal generation ----------------
    //-----------------------------------------
    // select signal offset is one clock cycle per layer (DRP)

    REG_r reg_sel_init_inst (.clk(clk), .rst(rst), .d(1'b1), .q(sel[0]));
    assign sel0_inv = ~sel[0];

    REG_r reg_sel_t_init_inst (.clk(clk), .rst(prch0_tmp[0]), .d(  sel[0]), .q(sel[1]));
    REG_r reg_sel_f_init_inst (.clk(clk), .rst(prch0_tmp[0]), .d(sel0_inv), .q(sel[2]));

    generate
        for (i = 1; i < (d-1); i=i+1) begin : loop_sel_gen_layer_

            REG_r reg_sel_t_inst (.clk(clk), .rst(prch0_tmp[i]), .d(sel[2*i-1]), .q(sel[2*i+1]));
            REG_r reg_sel_f_inst (.clk(clk), .rst(prch0_tmp[i]), .d(sel[2*i  ]), .q(sel[2*i+2]));

        end
    endgenerate

    assign cnt_rst = sel0_inv; // counter



    //-----------------------------------------
    //-- done signal generation ---------------
    //-----------------------------------------
    assign done[0] = done_layer0;

    generate
        for (i = 0; i < (d-1); i=i+1) begin : loop_gen_done_

            REG_r reg_done_inst (.clk(clk), .rst(rst), .d(done[i]), .q(done[i+1]));

        end
    endgenerate

endmodule