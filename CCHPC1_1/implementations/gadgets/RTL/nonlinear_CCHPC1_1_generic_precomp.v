module nonlinear_CCHPC1_1_generic_precomp #( parameter security_order = 1
)(
    clk, r, a, b, t
);
    parameter integer d = security_order+1;

    input           clk;
    input [(d-2):0] a;
    input [(d-2):0] b;

    input  [(((d*(d-1)))/2)-1:0] r; // single-rail random bits

    output [2*d*(d-1)-1:0] t; //



    // --- intermediates

    wire [(d-2):0] a_delayed [(d-2):0]; // [share_idx][clock_cycle_delay]
    wire [(d-2):0] b_delayed [(d-2):0];

    genvar i;
    generate

        // generate delay pipelines for merged input shares
        for (i = 0; i < (d-1); i=i+1) begin : loop_delay_
            localparam integer DEPTH = d-i-2;

            REG_pipeline_vec #(.depth(DEPTH)) reg_pipeline_a_inst (clk, a[i], a_delayed[i][DEPTH:0]);   
            REG_pipeline_vec #(.depth(DEPTH)) reg_pipeline_b_inst (clk, b[i], b_delayed[i][DEPTH:0]);

            // unused bits
            if (DEPTH < d-2) begin : tie_unused_
                wire unused_a_delay;
                wire unused_b_delay;

                assign a_delayed[i][d-2:DEPTH+1] = {(d-DEPTH-2){1'b0}};
                assign b_delayed[i][d-2:DEPTH+1] = {(d-DEPTH-2){1'b0}};

                assign unused_a_delay = ^a_delayed[i][d-2:DEPTH+1];
                assign unused_b_delay = ^b_delayed[i][d-2:DEPTH+1];
            end

        end

    endgenerate

    //-----------------------------------------
    //-- pre-processing MTGs ------------------
    //-----------------------------------------

    genvar l, k;
    generate

        for (l = 1; l < d; l = l+1) begin : gen_precomp_layer_
            for (k = 0; k < l; k = k+1) begin : gen_precomp_mtg_

                wire rand_used;

                localparam integer R_IDX = (l*(l-1))/2 + k;
                localparam integer DELAY = l-k-1;

                wire [DELAY:0] rand_pipe;

                REG_pipeline_vec #(.depth(DELAY)) reg_pipeline_r_inst (.clk(clk), .a(r[R_IDX]), .z(rand_pipe));

                assign rand_used = rand_pipe[DELAY];

                if (DELAY > 0) begin : gen_unused_rand_pipe_

                    wire unused_rand_pipe;

                    assign unused_rand_pipe = ^rand_pipe[DELAY-1:0];

                end

                mtg_opt_t_only #(.invT3(k != 0)) mtg_inst (.a(a_delayed[k][DELAY]), .b(b_delayed[k][DELAY]), .r(rand_used), .t_in(t[2*l*(l-1)+4*k+3:2*l*(l-1)+4*k]));

            end
        end

    endgenerate

endmodule

