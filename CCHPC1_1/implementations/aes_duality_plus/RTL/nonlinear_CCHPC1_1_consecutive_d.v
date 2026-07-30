module nonlinear_CCHPC1_1_consecutive_d #( parameter security_order = 1, CONF = 2'b00
                                                                      // 2'b00: and
                                                                      // 2'b01: nand
                                                                      // 2'b10: nor
                                                                      // 2'b11: or
)(
    clk, prch, aDR, bDR, r, t_in, zDR
);
    parameter integer d = security_order+1;

    input          clk;
    input  [d-2:0] prch;
    
    input  [2*(d-1):1] aDR; // dual-rail shares
    input  [2*(d-1):1] bDR; // dual-rail shares

    input  [((d*(d-1)))-1:0] r; // dual-rail random bits

    input  [4*d*(d-1)-1:0] t_in; // dual-rail

    output [2*(d-1):1] zDR; // dual-rail shares

    //-- config -------------------------------
    wire [2*(d-1):1] in_aDR;
    wire [2*(d-1):1] in_bDR;

    wire [2*(d-1):1] a;
    wire [2*(d-1):1] b;

    wire [4*d*(d-1)-1:0] t_out;

    //-----------------------------------------
    //-- CONFIG -------------------------------
    //-----------------------------------------

    genvar i;
    generate
        
        // swap last share rails (for both variables from both duality instances) to invert values based on config bit
        if (d > 2) begin : gen_in_common_

            assign in_aDR[2*(d-2):1] = aDR[2*(d-2):1];
            assign in_bDR[2*(d-2):1] = bDR[2*(d-2):1];

        end

        if (CONF[1] == 1'b0) begin : gen_in_

            assign in_aDR[2*(d-2)+2:2*(d-2)+1] = aDR[2*(d-2)+2:2*(d-2)+1];
            assign in_bDR[2*(d-2)+2:2*(d-2)+1] = bDR[2*(d-2)+2:2*(d-2)+1];

        end else begin: gen_in_inv_

            assign in_aDR[2*(d-2)+1] = aDR[2*(d-2)+2];
            assign in_aDR[2*(d-2)+2] = aDR[2*(d-2)+1];
            assign in_bDR[2*(d-2)+1] = bDR[2*(d-2)+2];
            assign in_bDR[2*(d-2)+2] = bDR[2*(d-2)+1];

        end
        
        assign a[2*(d-1):1] = in_aDR[2*(d-1):1];
        assign b[2*(d-1):1] = in_bDR[2*(d-1):1];

    endgenerate

    //-----------------------------------------
    //-- consecutive layers (dual-rail) -------
    //-----------------------------------------

    generate

        if (d == 2) begin : first_order

            REG_prch_wNOR #(.WIDTH(8)) reg_L1_inst (clk, prch[0], t_in[7:0], t_out[7:0]);

            // select    
            op_opt op_t_inst10 (.a(a[2:1]), .b(b[2:1]), .t_out(t_out[3:0]), .z(zDR[1]));
            op_opt op_f_inst10 (.a(a[2:1]), .b(b[2:1]), .t_out(t_out[7:4]), .z(zDR[2]));

        end
        if (d == 3) begin : second_order

            REG_prch_wNOR #(.WIDTH(8)) reg_L1_inst (clk, prch[0], t_in[7:0], t_out[7:0]);
            
            wire tmp10 [1:0];

            // select    
            op_opt op_t_inst10 (.a(a[2:1]), .b(b[2:1]), .t_out(t_out[3:0]), .z(tmp10[0]));
            op_opt op_f_inst10 (.a(a[2:1]), .b(b[2:1]), .t_out(t_out[7:4]), .z(tmp10[1]));

            wire tmp11 [2:1];

            AOI22 aoi22_inst10 (.a(tmp10[0]), .b(r[5]), .c(tmp10[1]), .d(r[4]), .z(tmp11[1]));
            AOI22 aoi22_inst11 (.a(tmp10[0]), .b(r[4]), .c(tmp10[1]), .d(r[5]), .z(tmp11[2]));
            INV inv_inst10 (.a(tmp11[1]), .z(zDR[1]));
            INV inv_inst11 (.a(tmp11[2]), .z(zDR[2]));




            REG_prch_wNOR #(.WIDTH(16)) reg_L2_inst (clk, prch[1], t_in[23:8], t_out[23:8]);

            wire tmp20 [3:0];

            // select
            op_opt op_t_inst20 (.a(a[4:3]), .b(b[4:3]), .t_out(t_out[11: 8]), .z(tmp20[0]));
            op_opt op_f_inst20 (.a(a[4:3]), .b(b[4:3]), .t_out(t_out[15:12]), .z(tmp20[1]));

            op_opt op_t_inst21 (.a(a[4:3]), .b(b[4:3]), .t_out(t_out[19:16]), .z(tmp20[2]));
            op_opt op_f_inst21 (.a(a[4:3]), .b(b[4:3]), .t_out(t_out[23:20]), .z(tmp20[3]));

            wire tmp21 [1:0];

            AOI22 aoi22_inst0 (.a(tmp20[0]), .b(tmp20[3]), .c(tmp20[1]), .d(tmp20[2]), .z(tmp21[0]));
            AOI22 aoi22_inst1 (.a(tmp20[0]), .b(tmp20[2]), .c(tmp20[1]), .d(tmp20[3]), .z(tmp21[1]));
            INV inv_inst0 (.a(tmp21[0]), .z(zDR[3]));
            INV inv_inst1 (.a(tmp21[1]), .z(zDR[4]));

        end
        if (d == 4) begin : third_order

            REG_prch_wNOR #(.WIDTH(8)) reg_L1_inst (clk, prch[0], t_in[7:0], t_out[7:0]);
            
            wire tmp10 [1:0];

            // select    
            op_opt op_t_inst10 (.a(a[2:1]), .b(b[2:1]), .t_out(t_out[3:0]), .z(tmp10[0]));
            op_opt op_f_inst10 (.a(a[2:1]), .b(b[2:1]), .t_out(t_out[7:4]), .z(tmp10[1]));

            wire tmp11 [2:1];
            wire tmp12 [2:1];
            wire tmp13 [2:1];

            AOI22 aoi22_inst10 (.a(r[4]), .b(r[9]), .c(r[5]), .d(r[8]), .z(tmp11[1]));
            AOI22 aoi22_inst11 (.a(r[4]), .b(r[8]), .c(r[5]), .d(r[9]), .z(tmp11[2]));
            INV inv_inst10 (.a(tmp11[1]), .z(tmp12[1]));
            INV inv_inst11 (.a(tmp11[2]), .z(tmp12[2]));

            AOI22 aoi22_inst12 (.a(tmp12[1]), .b(tmp10[1]), .c(tmp12[2]), .d(tmp10[0]), .z(tmp13[1]));
            AOI22 aoi22_inst13 (.a(tmp12[1]), .b(tmp10[0]), .c(tmp12[2]), .d(tmp10[1]), .z(tmp13[2]));
            INV inv_inst12 (.a(tmp13[1]), .z(zDR[1]));
            INV inv_inst13 (.a(tmp13[2]), .z(zDR[2]));





            REG_prch_wNOR #(.WIDTH(16)) reg_L2_inst (clk, prch[1], t_in[23:8], t_out[23:8]);

            wire tmp20 [3:0];

            // select
            op_opt op_t_inst20 (.a(a[4:3]), .b(b[4:3]), .t_out(t_out[11: 8]), .z(tmp20[0]));
            op_opt op_f_inst20 (.a(a[4:3]), .b(b[4:3]), .t_out(t_out[15:12]), .z(tmp20[1]));

            op_opt op_t_inst21 (.a(a[4:3]), .b(b[4:3]), .t_out(t_out[19:16]), .z(tmp20[2]));
            op_opt op_f_inst21 (.a(a[4:3]), .b(b[4:3]), .t_out(t_out[23:20]), .z(tmp20[3]));

            wire tmp21 [1:0];
            wire tmp22 [1:0];
            wire tmp23 [1:0];

            AOI22 aoi22_inst20 (.a(tmp20[0]), .b(tmp20[3]), .c(tmp20[1]), .d(tmp20[2]), .z(tmp21[0]));
            AOI22 aoi22_inst21 (.a(tmp20[0]), .b(tmp20[2]), .c(tmp20[1]), .d(tmp20[3]), .z(tmp21[1]));
            INV inv_inst20 (.a(tmp21[0]), .z(tmp22[0]));
            INV inv_inst21 (.a(tmp21[1]), .z(tmp22[1]));

            AOI22 aoi22_inst22 (.a(tmp22[0]), .b(r[11]), .c(tmp22[1]), .d(r[10]), .z(tmp23[0]));
            AOI22 aoi22_inst23 (.a(tmp22[0]), .b(r[10]), .c(tmp22[1]), .d(r[11]), .z(tmp23[1]));
            INV inv_inst22 (.a(tmp23[0]), .z(zDR[3]));
            INV inv_inst23 (.a(tmp23[1]), .z(zDR[4]));






            REG_prch_wNOR #(.WIDTH(24)) reg_L3_inst (clk, prch[2], t_in[47:24], t_out[47:24]);

            wire tmp30 [5:0];

            // select
            op_opt op_t_inst30 (.a(a[6:5]), .b(b[6:5]), .t_out(t_out[27:24]), .z(tmp30[0]));
            op_opt op_f_inst30 (.a(a[6:5]), .b(b[6:5]), .t_out(t_out[31:28]), .z(tmp30[1]));

            op_opt op_t_inst31 (.a(a[6:5]), .b(b[6:5]), .t_out(t_out[35:32]), .z(tmp30[2]));
            op_opt op_f_inst31 (.a(a[6:5]), .b(b[6:5]), .t_out(t_out[39:36]), .z(tmp30[3]));

            op_opt op_t_inst32 (.a(a[6:5]), .b(b[6:5]), .t_out(t_out[43:40]), .z(tmp30[4]));
            op_opt op_f_inst32 (.a(a[6:5]), .b(b[6:5]), .t_out(t_out[47:44]), .z(tmp30[5]));

            wire tmp31 [5:0];

            AOI22 aoi22_inst30 (.a(tmp30[0]), .b(tmp30[3]), .c(tmp30[1]), .d(tmp30[2]), .z(tmp31[0]));
            AOI22 aoi22_inst31 (.a(tmp30[0]), .b(tmp30[2]), .c(tmp30[1]), .d(tmp30[3]), .z(tmp31[1]));
            INV inv_inst30 (.a(tmp31[0]), .z(tmp31[2]));
            INV inv_inst31 (.a(tmp31[1]), .z(tmp31[3]));

            AOI22 aoi22_inst32 (.a(tmp30[4]), .b(tmp31[3]), .c(tmp30[5]), .d(tmp31[2]), .z(tmp31[4]));
            AOI22 aoi22_inst33 (.a(tmp30[4]), .b(tmp31[2]), .c(tmp30[5]), .d(tmp31[3]), .z(tmp31[5]));
            INV inv_inst32 (.a(tmp31[4]), .z(zDR[5]));
            INV inv_inst33 (.a(tmp31[5]), .z(zDR[6]));

        end

    endgenerate

endmodule