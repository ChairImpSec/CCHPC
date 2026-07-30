module nonlinear_CCHPC1_1_DRtDR_order3 #(parameter CONF = 2'b00, aINV = 1'b0, bINV = 1'b0, zINV = 1'b0
                                       // 2'b00: and
                                       // 2'b01: nand
                                       // 2'b10: nor
                                       // 2'b11: or
)(
    clk, prch, a, b, r, z
);

    input  clk;
    input  [2:0] prch;
    input  [11:0] r;
    input  [6:0] a;
    input  [6:0] b;
    output [6:0] z;
    
    wire [6:0] in_a;
    wire [6:0] in_b;
    
    wire randL0;
    wire randL1;
    wire randL20;
    wire randL21;
    wire randL30;
    wire randL31;
    wire randL32;
    
    wire a0nandb0;
    wire [ 7:0] t_in_layer1;
    wire [15:0] t_in_layer2;
    wire [23:0] t_in_layer3;
    wire [ 7:0] t_out_layer1;
    wire [15:0] t_out_layer2;
    wire [23:0] t_out_layer3;

    wire [2:0] in_a_delayed [2:0];
    wire [2:0] in_b_delayed [2:0];

    wire r1_delayed;
    wire r3_delayed;
    wire r4_delayed;
    wire r3_delayed_delayed;

    // -- CONFIG ----------------------------------------------------------------------------------------------------

    generate
        assign in_a[4:0] = a[4:0];
        assign in_b[4:0] = b[4:0];
        
        if ((CONF[1] ^ aINV) == 1'b0) begin : gen_in_a_

            assign in_a[6:5] = a[6:5];

        end else begin: gen_in_inv_

            assign in_a[5] = a[6];
            assign in_a[6] = a[5];

        end

        if ((CONF[1] ^ bINV) == 1'b0) begin : gen_in_b_

            assign in_b[6:5] = b[6:5];

        end else begin: gen_in_inv_

            assign in_b[5] = b[6];
            assign in_b[6] = b[5];

        end

    endgenerate

    REG_pipeline_vec #(.depth(2)) reg_pipeline_a0_inst (clk, in_a[0], in_a_delayed[0][2:0]);
    REG_pipeline_vec #(.depth(2)) reg_pipeline_b0_inst (clk, in_b[0], in_b_delayed[0][2:0]);
    REG_pipeline_vec #(.depth(1)) reg_pipeline_a1_inst (clk, in_a[1], in_a_delayed[1][1:0]);   
    REG_pipeline_vec #(.depth(1)) reg_pipeline_b1_inst (clk, in_b[1], in_b_delayed[1][1:0]);
    REG_pipeline_vec #(.depth(0)) reg_pipeline_a2_inst (clk, in_a[3], in_a_delayed[2][0:0]);   
    REG_pipeline_vec #(.depth(0)) reg_pipeline_b2_inst (clk, in_b[3], in_b_delayed[2][0:0]);

    REG #(.WIDTH(1)) reg_r1_inst1 (clk, r[2], r1_delayed);
    REG #(.WIDTH(1)) reg_r3_inst1 (clk, r[6], r3_delayed);
    REG #(.WIDTH(1)) reg_r4_inst1 (clk, r[8], r4_delayed);
    REG #(.WIDTH(1)) reg_r3_inst2 (clk, r3_delayed, r3_delayed_delayed);

    // -- layer0 ----------------------------------------------------------------------------------------------------

    assign randL0 = r[0] ^ r[2] ^ r[6];

    NAND2 and2_inst00 (.a(in_a[0]),  .b(in_b[0]), .z(a0nandb0));

    if ((CONF[0] ^ zINV) == 1'b0) begin : gen_out_

        XNOR2 xor2_inst00 (.a(a0nandb0), .b(randL0), .z(z[0]));

    end else begin: gen_out_inv_

        XOR2  xor2_inst00 (.a(a0nandb0), .b(randL0), .z(z[0]));

    end

    // -- layer1 ----------------------------------------------------------------------------------------------------

    // pre    
    assign randL1 = r[0];
    
    mtg_opt #(.invT3(0)) mtg_L1_inst (.a(in_a_delayed[0][0]), .b(in_b_delayed[0][0]), .r(randL1), .t_in(t_in_layer1[7:0]));

    REG_prch_wNOR #(.WIDTH(8)) reg_L1_inst (clk, prch[0], t_in_layer1[7:0], t_out_layer1[7:0]);
    
    wire tmp10 [1:0];

    // select    
    op_opt op_t_inst10 (.a(in_a[2:1]), .b(in_b[2:1]), .t_out(t_out_layer1[3:0]), .z(tmp10[0]));
    op_opt op_f_inst10 (.a(in_a[2:1]), .b(in_b[2:1]), .t_out(t_out_layer1[7:4]), .z(tmp10[1]));

    wire tmp11 [2:1];
    wire tmp12 [2:1];
    wire tmp13 [2:1];

    AOI22 aoi22_inst10 (.a(r[4]), .b(r[9]), .c(r[5]), .d(r[8]), .z(tmp11[1]));
    AOI22 aoi22_inst11 (.a(r[4]), .b(r[8]), .c(r[5]), .d(r[9]), .z(tmp11[2]));
    INV inv_inst10 (.a(tmp11[1]), .z(tmp12[1]));
    INV inv_inst11 (.a(tmp11[2]), .z(tmp12[2]));

    AOI22 aoi22_inst12 (.a(tmp12[1]), .b(tmp10[1]), .c(tmp12[2]), .d(tmp10[0]), .z(tmp13[1]));
    AOI22 aoi22_inst13 (.a(tmp12[1]), .b(tmp10[0]), .c(tmp12[2]), .d(tmp10[1]), .z(tmp13[2]));
    INV inv_inst12 (.a(tmp13[1]), .z(z[1]));
    INV inv_inst13 (.a(tmp13[2]), .z(z[2]));

    // -- layer2 ----------------------------------------------------------------------------------------------------

    // pre
    assign randL20 = r1_delayed;
    assign randL21 = r[4];

    mtg_opt #(.invT3(0)) mtg_L2_inst0 (.a(in_a_delayed[0][1]), .b(in_b_delayed[0][1]), .r(randL20), .t_in(t_in_layer2[ 7:0]));
    mtg_opt #(.invT3(1)) mtg_L2_inst1 (.a(in_a_delayed[1][0]), .b(in_b_delayed[1][0]), .r(randL21), .t_in(t_in_layer2[15:8]));

    REG_prch_wNOR #(.WIDTH(16)) reg_L2_inst (clk, prch[1], t_in_layer2[15:0], t_out_layer2[15:0]);  

    wire tmp20 [3:0];

    // select
    op_opt op_t_inst20 (.a(in_a[4:3]), .b(in_b[4:3]), .t_out(t_out_layer2[ 3: 0]), .z(tmp20[0]));
    op_opt op_f_inst20 (.a(in_a[4:3]), .b(in_b[4:3]), .t_out(t_out_layer2[ 7: 4]), .z(tmp20[1]));

    op_opt op_t_inst21 (.a(in_a[4:3]), .b(in_b[4:3]), .t_out(t_out_layer2[11: 8]), .z(tmp20[2]));
    op_opt op_f_inst21 (.a(in_a[4:3]), .b(in_b[4:3]), .t_out(t_out_layer2[15:12]), .z(tmp20[3]));

    wire tmp21 [1:0];
    wire tmp22 [1:0];
    wire tmp23 [1:0];

    AOI22 aoi22_inst20 (.a(tmp20[0]), .b(tmp20[3]), .c(tmp20[1]), .d(tmp20[2]), .z(tmp21[0]));
    AOI22 aoi22_inst21 (.a(tmp20[0]), .b(tmp20[2]), .c(tmp20[1]), .d(tmp20[3]), .z(tmp21[1]));
    INV inv_inst20 (.a(tmp21[0]), .z(tmp22[0]));
    INV inv_inst21 (.a(tmp21[1]), .z(tmp22[1]));

    AOI22 aoi22_inst22 (.a(tmp22[0]), .b(r[11]), .c(tmp22[1]), .d(r[10]), .z(tmp23[0]));
    AOI22 aoi22_inst23 (.a(tmp22[0]), .b(r[10]), .c(tmp22[1]), .d(r[11]), .z(tmp23[1]));
    INV inv_inst22 (.a(tmp23[0]), .z(z[3]));
    INV inv_inst23 (.a(tmp23[1]), .z(z[4]));

    // -- layer3 ----------------------------------------------------------------------------------------------------

    // pre
    assign randL30 = r3_delayed_delayed;
    assign randL31 = r4_delayed;
    assign randL32 = r[10];

    mtg_opt #(.invT3(0)) mtg_L3_inst0 (.a(in_a_delayed[0][2]), .b(in_b_delayed[0][2]), .r(randL30), .t_in(t_in_layer3[ 7: 0]));
    mtg_opt #(.invT3(1)) mtg_L3_inst1 (.a(in_a_delayed[1][1]), .b(in_b_delayed[1][1]), .r(randL31), .t_in(t_in_layer3[15: 8]));
    mtg_opt #(.invT3(1)) mtg_L3_inst2 (.a(in_a_delayed[2][0]), .b(in_b_delayed[2][0]), .r(randL32), .t_in(t_in_layer3[23:16]));

    REG_prch_wNOR #(.WIDTH(24)) reg_L3_inst (clk, prch[2], t_in_layer3[23:0], t_out_layer3[23:0]);

    wire tmp30 [5:0];

    // select
    op_opt op_t_inst30 (.a(in_a[6:5]), .b(in_b[6:5]), .t_out(t_out_layer3[ 3: 0]), .z(tmp30[0]));
    op_opt op_f_inst30 (.a(in_a[6:5]), .b(in_b[6:5]), .t_out(t_out_layer3[ 7: 4]), .z(tmp30[1]));

    op_opt op_t_inst31 (.a(in_a[6:5]), .b(in_b[6:5]), .t_out(t_out_layer3[11: 8]), .z(tmp30[2]));
    op_opt op_f_inst31 (.a(in_a[6:5]), .b(in_b[6:5]), .t_out(t_out_layer3[15:12]), .z(tmp30[3]));

    op_opt op_t_inst32 (.a(in_a[6:5]), .b(in_b[6:5]), .t_out(t_out_layer3[19:16]), .z(tmp30[4]));
    op_opt op_f_inst32 (.a(in_a[6:5]), .b(in_b[6:5]), .t_out(t_out_layer3[23:20]), .z(tmp30[5]));

    wire tmp31 [5:0];

    AOI22 aoi22_inst30 (.a(tmp30[0]), .b(tmp30[3]), .c(tmp30[1]), .d(tmp30[2]), .z(tmp31[0]));
    AOI22 aoi22_inst31 (.a(tmp30[0]), .b(tmp30[2]), .c(tmp30[1]), .d(tmp30[3]), .z(tmp31[1]));
    INV inv_inst30 (.a(tmp31[0]), .z(tmp31[2]));
    INV inv_inst31 (.a(tmp31[1]), .z(tmp31[3]));

    AOI22 aoi22_inst32 (.a(tmp30[4]), .b(tmp31[3]), .c(tmp30[5]), .d(tmp31[2]), .z(tmp31[4]));
    AOI22 aoi22_inst33 (.a(tmp30[4]), .b(tmp31[2]), .c(tmp30[5]), .d(tmp31[3]), .z(tmp31[5]));
    INV inv_inst32 (.a(tmp31[4]), .z(z[5]));
    INV inv_inst33 (.a(tmp31[5]), .z(z[6]));


endmodule