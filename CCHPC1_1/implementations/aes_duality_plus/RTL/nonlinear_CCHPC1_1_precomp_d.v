module nonlinear_CCHPC1_1_precomp_d #( parameter security_order = 1, CONF = 2'b00
                                                                  // 2'b00: and
                                                                  // 2'b01: nand
                                                                  // 2'b10: nor
                                                                  // 2'b11: or
)(
    clk, prch0, prch1, r, a0, b0, aDR0, aDR1, bDR0, bDR1, t_in
);
    parameter integer d = security_order+1;

    input          clk;
    input  [d-2:0] prch0;
    input  [d-2:0] prch1;

    input  [((d*(d-1)))-1:0] r;   // dual-rail random bits
    
    input              a0;   // share 0
    input              b0;   // share 0
    input  [2*(d-1):1] aDR0; // dual-rail shares from duality instance 0 
    input  [2*(d-1):1] aDR1; // dual-rail shares from duality instance 1
    input  [2*(d-1):1] bDR0; // dual-rail shares from duality instance 0 
    input  [2*(d-1):1] bDR1; // dual-rail shares from duality instance 1

    output [4*d*(d-1)-1:0] t_in; //


    wire [2*(d-1):1] in_aDR0;
    wire [2*(d-1):1] in_aDR1;
    wire [2*(d-1):1] in_bDR0;
    wire [2*(d-1):1] in_bDR1;

    wire [(d-1):0] a; // merged dual-rail signals (to single-rail) from both duality instances
    wire [(d-1):0] b; // merged dual-rail signals (to single-rail) from both duality instances

    wire [(d-2):0] a_delayed [(d-2):0]; // [share_idx][clock_cycle_delay]
    wire [(d-2):0] b_delayed [(d-2):0];

    wire randL0;
    wire randL1;
    wire randL20;
    wire randL21;
    wire randL30;
    wire randL31;
    wire randL32;

    wire r1_delayed;
    wire r3_delayed;
    wire r4_delayed;
    wire r3_delayed_delayed;


    //-----------------------------------------
    //-- CONFIG -------------------------------
    //-----------------------------------------

    genvar i;
    generate

        // swap last input share rails (for both variables from both duality instances) to invert input values based on config bit
        if (d > 2) begin : gen_in_common_

            assign in_aDR0[2*(d-2):1] = aDR0[2*(d-2):1];
            assign in_aDR1[2*(d-2):1] = aDR1[2*(d-2):1];
            assign in_bDR0[2*(d-2):1] = bDR0[2*(d-2):1];
            assign in_bDR1[2*(d-2):1] = bDR1[2*(d-2):1];

        end
        
        if (CONF[1] == 1'b0) begin : gen_in_

            assign in_aDR0[2*(d-2)+2:2*(d-2)+1] = aDR0[2*(d-2)+2:2*(d-2)+1];
            assign in_aDR1[2*(d-2)+2:2*(d-2)+1] = aDR1[2*(d-2)+2:2*(d-2)+1];
            assign in_bDR0[2*(d-2)+2:2*(d-2)+1] = bDR0[2*(d-2)+2:2*(d-2)+1];
            assign in_bDR1[2*(d-2)+2:2*(d-2)+1] = bDR1[2*(d-2)+2:2*(d-2)+1];

        end else begin: gen_in_inv_

            assign in_aDR0[2*(d-2)+1] = aDR0[2*(d-2)+2];
            assign in_aDR0[2*(d-2)+2] = aDR0[2*(d-2)+1];
            assign in_aDR1[2*(d-2)+1] = aDR1[2*(d-2)+2];
            assign in_aDR1[2*(d-2)+2] = aDR1[2*(d-2)+1];
            assign in_bDR0[2*(d-2)+1] = bDR0[2*(d-2)+2];
            assign in_bDR0[2*(d-2)+2] = bDR0[2*(d-2)+1];
            assign in_bDR1[2*(d-2)+1] = bDR1[2*(d-2)+2];
            assign in_bDR1[2*(d-2)+2] = bDR1[2*(d-2)+1];

        end

        // merge dual-rail signals (to single-rail) from both duality instances (used in precomputation only as glitches are allowed)
        assign a[0] = a0;
        assign b[0] = b0;

        for (i = 1; i < d; i=i+1) begin : loop_merge_

            NOR2 merge_a_inst (.a(in_aDR0[2*i]), .b(in_aDR1[2*i]), .z(a[i]));
            NOR2 merge_b_inst (.a(in_bDR0[2*i]), .b(in_bDR1[2*i]), .z(b[i]));

        end

        // generate delay pipelines for merged input shares
        REG_pipeline_vec #(.depth(d-2)) reg_pipeline_a0_inst (clk, a[0], a_delayed[0][d-2:0]);
        REG_pipeline_vec #(.depth(d-2)) reg_pipeline_b0_inst (clk, b[0], b_delayed[0][d-2:0]);

        for (i = 1; i < (d-1); i=i+1) begin : loop_delay_

            REG_pipeline_vec #(.depth(d-i-2)) reg_pipeline_a_inst (clk, a[i], a_delayed[i][d-i-2:0]);   
            REG_pipeline_vec #(.depth(d-i-2)) reg_pipeline_b_inst (clk, b[i], b_delayed[i][d-i-2:0]);
      
        end

    endgenerate


    //-----------------------------------------
    //-- pre-processing -----------------------
    //-----------------------------------------

    generate

        if (d == 2) begin : first_order
    
            // -- layer1 ----------------------------------------------------------------------------------------------------
            assign randL1 = r[0];
            
            mtg_opt #(.invT3(0)) mtg_L1_inst (.a(a_delayed[0][0]), .b(b_delayed[0][0]), .r(randL1), .t_in(t_in[7:0]));

        end
        if (d == 3) begin : second_order

            REG #(.WIDTH(1)) reg_r1_inst (clk, r[2], r1_delayed);

            // -- layer1 ----------------------------------------------------------------------------------------------------
            assign randL1 = r[0];
    
            mtg_opt #(.invT3(0)) mtg_L1_inst (.a(a_delayed[0][0]), .b(b_delayed[0][0]), .r(randL1), .t_in(t_in[7:0]));

            // -- layer2 ----------------------------------------------------------------------------------------------------
            assign randL20 = r1_delayed;
            assign randL21 = r[4];

            mtg_opt #(.invT3(0)) mtg_L2_inst0 (.a(a_delayed[0][1]), .b(b_delayed[0][1]), .r(randL20), .t_in(t_in[15: 8]));
            mtg_opt #(.invT3(1)) mtg_L2_inst1 (.a(a_delayed[1][0]), .b(b_delayed[1][0]), .r(randL21), .t_in(t_in[23:16]));

        end
        if (d == 4) begin : third_order

            REG #(.WIDTH(1)) reg_r1_inst1 (clk, r[2], r1_delayed);
            REG #(.WIDTH(1)) reg_r3_inst1 (clk, r[6], r3_delayed);
            REG #(.WIDTH(1)) reg_r4_inst1 (clk, r[8], r4_delayed);
            REG #(.WIDTH(1)) reg_r3_inst2 (clk, r3_delayed, r3_delayed_delayed);

            // -- layer1 ----------------------------------------------------------------------------------------------------
            assign randL1 = r[0];

            mtg_opt #(.invT3(0)) mtg_L1_inst (.a(a_delayed[0][0]), .b(b_delayed[0][0]), .r(randL1), .t_in(t_in[7:0]));

            // -- layer2 ----------------------------------------------------------------------------------------------------
            assign randL20 = r1_delayed;
            assign randL21 = r[4];

            mtg_opt #(.invT3(0)) mtg_L2_inst0 (.a(a_delayed[0][1]), .b(b_delayed[0][1]), .r(randL20), .t_in(t_in[15: 8]));
            mtg_opt #(.invT3(1)) mtg_L2_inst1 (.a(a_delayed[1][0]), .b(b_delayed[1][0]), .r(randL21), .t_in(t_in[23:16]));

            // -- layer3 ----------------------------------------------------------------------------------------------------
            assign randL30 = r3_delayed_delayed;
            assign randL31 = r4_delayed;
            assign randL32 = r[10];

            mtg_opt #(.invT3(0)) mtg_L3_inst0 (.a(a_delayed[0][2]), .b(b_delayed[0][2]), .r(randL30), .t_in(t_in[31:24]));
            mtg_opt #(.invT3(1)) mtg_L3_inst1 (.a(a_delayed[1][1]), .b(b_delayed[1][1]), .r(randL31), .t_in(t_in[39:32]));
            mtg_opt #(.invT3(1)) mtg_L3_inst2 (.a(a_delayed[2][0]), .b(b_delayed[2][0]), .r(randL32), .t_in(t_in[47:40]));

        end

    endgenerate

endmodule