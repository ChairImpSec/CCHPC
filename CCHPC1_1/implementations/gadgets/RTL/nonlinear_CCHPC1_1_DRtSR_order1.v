module nonlinear_CCHPC1_1_DRtSR_order1 #( parameter CONF = 2'b00, aINV = 1'b0, bINV = 1'b0, zINV = 1'b0
                                       // 2'b00: and
                                       // 2'b01: nand
                                       // 2'b10: nor
                                       // 2'b11: or
)(
    clk, prch, a, b, r, z
);

    input  clk;
    input  [0:0] prch;
    input  [1:0] r;
    input  [2:0] a;
    input  [2:0] b;
    output [1:0] z;
    
    wire [2:0] in_a;
    wire [2:0] in_b;
    
    wire randL0;
    wire randL1;
    
    wire a0nandb0;
    wire [3:0] t_in_layer1;
    wire [3:0] t_out_layer1;

    // -- CONFIG ----------------------------------------------------------------------------------------------------

    generate
        assign in_a[0] = a[0];
        assign in_b[0] = b[0];
        
        if ((CONF[1] ^ aINV) == 1'b0) begin : gen_in_a_

            assign in_a[2:1] = a[2:1];

        end else begin: gen_in_a_inv_

            assign in_a[1] = a[2];
            assign in_a[2] = a[1];

        end

        if ((CONF[1] ^ bINV) == 1'b0) begin : gen_in_b_

            assign in_b[2:1] = b[2:1];

        end else begin: gen_in_b_inv_

            assign in_b[1] = b[2];
            assign in_b[2] = b[1];

        end

    endgenerate

    // -- layer0 ----------------------------------------------------------------------------------------------------

    assign randL0 = r[0];

    NAND2 and2_inst00 (.a(in_a[0]), .b(in_b[0]), .z(a0nandb0));

    if ((CONF[0] ^ zINV) == 1'b0) begin : gen_out_

        XNOR2 xor2_inst00 (.a(a0nandb0), .b(randL0), .z(z[0]));

    end else begin: gen_out_inv_

        XOR2  xor2_inst00 (.a(a0nandb0), .b(randL0), .z(z[0]));

    end

    // -- layer1 ----------------------------------------------------------------------------------------------------

    assign randL1 = r[0];
    
    mtg_opt_t_only #(.invT3(0)) mtg_L1_inst (.a(in_a[0]), .b(in_b[0]), .r(randL1), .t_in(t_in_layer1[3:0]));

    REG_prch_wNOR #(.WIDTH(4)) reg_L1_inst (clk, prch[0], t_in_layer1[3:0], t_out_layer1[3:0]);
    
    // select
    op_opt op_f_inst10 (.a(in_a[2:1]), .b(in_b[2:1]), .t_out(t_out_layer1[3:0]), .z(z[1]));

endmodule