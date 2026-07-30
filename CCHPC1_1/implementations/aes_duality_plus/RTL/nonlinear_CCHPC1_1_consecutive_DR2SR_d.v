module nonlinear_CCHPC1_1_consecutive_DR2SR_d #( parameter security_order = 1, CONF = 2'b00
                                                                            // 2'b00: and
                                                                            // 2'b01: nand
                                                                            // 2'b10: nor
                                                                            // 2'b11: or
)(
    clk, prch, aDR, bDR, r, t_in, z
);
    parameter integer d = security_order+1;

    input          clk;
    input  [d-2:0] prch;
    
    input  [2*(d-1):1] aDR; // dual-rail shares
    input  [2*(d-1):1] bDR; // dual-rail shares

    input  [((d*(d-1)))-1:0] r; // dual-rail random bits

    input  [2*d*(d-1)-1:0] t_in; // single-rail

    output [(d-1):1] z; // single-rail

    //-- config -------------------------------
    wire [2*(d-1):1] in_aDR;
    wire [2*(d-1):1] in_bDR;

    wire [2*(d-1):1] a;
    wire [2*(d-1):1] b;

    wire [2*d*(d-1)-1:0] t_out;

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

            REG_prch_wNOR #(.WIDTH(4)) reg_L1_inst (clk, prch[0], t_in[3:0], t_out[3:0]);
            
            // select
            op_opt op_f_inst10 (.a(a[2:1]), .b(b[2:1]), .t_out(t_out[3:0]), .z(z[1]));

        end
        if (d == 3) begin : second_order

            REG_prch_wNOR #(.WIDTH(4)) reg_L1_inst (clk, prch[0], t_in[3:0], t_out[3:0]);
            
            wire tmp10;

            // select
            op_opt op_f_inst10 (.a(a[2:1]), .b(b[2:1]), .t_out(t_out[3:0]), .z(tmp10));

            XOR2 xor2_inst10 (.a(tmp10), .b(r[4]), .z(z[1]));



            REG_prch_wNOR #(.WIDTH(8)) reg_L2_inst (clk, prch[1], t_in[11:4], t_out[11:4]);

            wire tmp20 [1:0];

            // select
            op_opt op_f_inst20 (.a(a[4:3]), .b(b[4:3]), .t_out(t_out[ 7:4]), .z(tmp20[0]));
            op_opt op_f_inst21 (.a(a[4:3]), .b(b[4:3]), .t_out(t_out[11:8]), .z(tmp20[1]));

            // XOR
            XOR2 xor2_inst20 (.a(tmp20[0]), .b(tmp20[1]), .z(z[2]));

        end
        if (d == 4) begin : third_order

            REG_prch_wNOR #(.WIDTH(4)) reg_L1_inst (clk, prch[0], t_in[3:0], t_out[3:0]);
            
            wire tmp10 [1:0];

            // select
            op_opt op_f_inst10 (.a(a[2:1]), .b(b[2:1]), .t_out(t_out[3:0]), .z(tmp10[0]));

            XOR2 xor2_inst10 (.a(r[4]), .b(r[8]), .z(tmp10[1]));
            XOR2 xor2_inst11 (.a(tmp10[0]), .b(tmp10[1]), .z(z[1]));




            REG_prch_wNOR #(.WIDTH(8)) reg_L2_inst (clk, prch[1], t_in[11:4], t_out[11:4]);

            wire tmp20 [1:0];
            wire tmp21;

            // select
            op_opt op_f_inst20 (.a(a[4:3]), .b(b[4:3]), .t_out(t_out[ 7:4]), .z(tmp20[0]));
            op_opt op_f_inst21 (.a(a[4:3]), .b(b[4:3]), .t_out(t_out[11:8]), .z(tmp20[1]));

            // XOR
            XOR2 xor2_inst20 (.a(tmp20[0]), .b(tmp20[1]), .z(tmp21));
            XOR2 xor2_inst21 (.a(tmp20[0]), .b(r[10]), .z(z[2]));






            REG_prch_wNOR #(.WIDTH(12)) reg_L3_inst (clk, prch[2], t_in[23:12], t_out[23:12]);

            wire tmp30 [2:0];

            // select
            op_opt op_f_inst30 (.a(a[6:5]), .b(b[6:5]), .t_out(t_out[15:12]), .z(tmp30[0]));
            op_opt op_f_inst31 (.a(a[6:5]), .b(b[6:5]), .t_out(t_out[19:16]), .z(tmp30[1]));
            op_opt op_f_inst32 (.a(a[6:5]), .b(b[6:5]), .t_out(t_out[23:20]), .z(tmp30[2]));

            wire tmp31;

            XOR2 xor_inst30  (.a(tmp30[0]), .b(tmp30[1]), .z(tmp31));
            XNOR2 xor_inst31 (.a(tmp30[2]), .b(tmp31   ), .z(z[3]) );

        end

    endgenerate

endmodule