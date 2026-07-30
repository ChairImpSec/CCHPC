module nonlinear_CCHPC1_1_DRtDR_order2 #(parameter CONF = 2'b00, aINV = 1'b0, bINV = 1'b0, zINV = 1'b0
                                       // 2'b00: and
                                       // 2'b01: nand
                                       // 2'b10: nor
                                       // 2'b11: or
)(
    clk, prch, a, b, r, z
);

    input  clk;
    input  [1:0] prch;
    input  [5:0] r;
    input  [4:0] a;
    input  [4:0] b;
    output [4:0] z;
    
    wire [4:0] in_a;
    wire [4:0] in_b;
    
    wire randL0;
    wire randL1;
    wire randL20;
    wire randL21;
    
    wire a0nandb0;
    wire [ 7:0] t_in_layer1;
    wire [15:0] t_in_layer2;
    wire [ 7:0] t_out_layer1;
    wire [15:0] t_out_layer2;
    
    wire [1:0] in_a_delayed [1:0];
    wire [1:0] in_b_delayed [1:0];

    wire r1_delayed;

    // -- CONFIG ----------------------------------------------------------------------------------------------------

    generate
        assign in_a[2:0] = a[2:0];
        assign in_b[2:0] = b[2:0];
        
        if (CONF[1] ^ aINV == 1'b0) begin : gen_in_a_

            assign in_a[4:3] = a[4:3];

        end else begin: gen_in_inv_

            assign in_a[3] = a[4];
            assign in_a[4] = a[3];

        end

        if (CONF[1] ^ bINV == 1'b0) begin : gen_in_b_

            assign in_b[4:3] = b[4:3];

        end else begin: gen_in_inv_

            assign in_b[3] = b[4];
            assign in_b[4] = b[3];

        end

    endgenerate

    REG_pipeline_vec #(.depth(1)) reg_pipeline_a0_inst (clk, in_a[0], in_a_delayed[0][1:0]);
    REG_pipeline_vec #(.depth(1)) reg_pipeline_b0_inst (clk, in_b[0], in_b_delayed[0][1:0]);
    REG_pipeline_vec #(.depth(0)) reg_pipeline_a1_inst (clk, in_a[1], in_a_delayed[1][0:0]);   
    REG_pipeline_vec #(.depth(0)) reg_pipeline_b1_inst (clk, in_b[1], in_b_delayed[1][0:0]);

    REG #(.WIDTH(1)) reg_r1_inst (clk, r[2], r1_delayed);


    // -- layer0 ----------------------------------------------------------------------------------------------------

    assign randL0 = r[0] ^ r[2];

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

    AOI22 aoi22_inst10 (.a(tmp10[0]), .b(r[5]), .c(tmp10[1]), .d(r[4]), .z(tmp11[1]));
    AOI22 aoi22_inst11 (.a(tmp10[0]), .b(r[4]), .c(tmp10[1]), .d(r[5]), .z(tmp11[2]));
    INV inv_inst10 (.a(tmp11[1]), .z(z[1]));
    INV inv_inst11 (.a(tmp11[2]), .z(z[2]));

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

    wire tmp21 [2:1];

    AOI22 aoi22_inst20 (.a(tmp20[0]), .b(tmp20[3]), .c(tmp20[1]), .d(tmp20[2]), .z(tmp21[1]));
    AOI22 aoi22_inst21 (.a(tmp20[0]), .b(tmp20[2]), .c(tmp20[1]), .d(tmp20[3]), .z(tmp21[2]));
    INV inv_inst20 (.a(tmp21[1]), .z(z[3]));
    INV inv_inst21 (.a(tmp21[2]), .z(z[4]));


endmodule