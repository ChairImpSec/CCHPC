module nonlinear_CCHPC_wNAND_pipeline_consecutive #(  parameter security_order = 2,
                                                                CONF = 2'b00
                                                                    // 2'b00: and
                                                                    // 2'b01: nand
                                                                    // 2'b10: nor
                                                                    // 2'b11: or
)(
    clk, prch, a, b, r, z
);

    parameter integer d = security_order+1;

    input  clk;
    input  [d-2:0] prch;     // one for each layer crossing
    input  [(d-1)*d-1:0] r;  // required random bits in format {..., r[3], r[2], r[1], r[0]} = {..., r_1_f, r_1_t, r_0_f, r_0_t}, first _ indicates random bit index, second _ indicates rail
    input  [2*(d-1):0] a;    // share format: {..., a[2], a[1], a[0]} = {..., a^1_f, a^1_t, a^0}, ^ indicates share index, _ indicates rail
    input  [2*(d-1):0] b;    //
    output [2*(d-1):1] z;    //

    //-- config -------------------------------
    wire [2*(d-1):0] in_a;
    wire [2*(d-1):0] in_b;
    wire [2*(d-1):1] out_z;

    //-- consecutive layers -------------------
    wire [4*d*(d-1)-1:0] precomp_wires;
    wire [4*d*(d-1)-1:0] mux_input_wires;
    wire [2*d*(d-1)-1:0] mux_internal_wires;
    wire [2*d*(d-1)-1:0] xor_tree_inputs;

    //-----------------------------------------
    //-- CONFIG -------------------------------
    //-----------------------------------------

    generate
        assign in_a[0] = a[0];
        assign in_b[0] = b[0];


        if (CONF[0] == 1'b0) begin : gen_out_

            assign z[2*(d-1):1] = out_z[2*(d-1):1];

        end else begin: gen_out_inv_

            assign z[2*d-2] = out_z[2*d-3];
            assign z[2*d-3] = out_z[2*d-2];
            
            if (d > 2) begin : gen_wiring_higher_order_out_

                assign z[2*d-4:1] = out_z[2*d-4:1];

            end

        end
        
        if (CONF[1] == 1'b0) begin : gen_in_

            assign in_a[2*(d-1):1] = a[2*(d-1):1];
            assign in_b[2*(d-1):1] = b[2*(d-1):1];

        end else begin: gen_in_inv_

            assign in_a[2*d-2] = a[2*d-3];
            assign in_a[2*d-3] = a[2*d-2];
            assign in_b[2*d-2] = b[2*d-3];
            assign in_b[2*d-3] = b[2*d-2];
            
            if (d > 2) begin : gen_wiring_higher_order_in_

                assign in_a[2*d-4:1] = a[2*d-4:1];
                assign in_b[2*d-4:1] = b[2*d-4:1];

            end

        end

    endgenerate

    //-----------------------------------------
    //-- consecutive layers (dual-rail) -------
    //-----------------------------------------

    genvar j, k, s, t;
    generate
        
        for (j = 0; j < (d-1); j=j+1) begin : loop_gen_layer_

            //-- pre-processing ----------------------
            for (k = 0; k <= j; k=k+1) begin : loop_gen_precomp_
                
                if (k == 0) begin : gen_share_0_precomp_

                    XOR2 xor_inst0 (.a(r[2*(((j*(j+1))/2)+k)]), .b(in_a[0]), .z(precomp_wires[8*(((j*(j+1))/2)+k)+4]));
                    XOR2 xor_inst1 (.a(r[2*(((j*(j+1))/2)+k)]), .b(in_b[0]), .z(precomp_wires[8*(((j*(j+1))/2)+k)+2]));
                    XOR2 xor_inst2 (.a(precomp_wires[8*(((j*(j+1))/2)+k)+4]), .b(in_b[0]), .z(precomp_wires[8*(((j*(j+1))/2)+k)]));
                    
                end else begin : gen_share_consecutive_precomp_
                
                    XOR2 xor_inst0 (.a(r[2*(((j*(j+1))/2)+k)]), .b(in_a[2*k-1]), .z(precomp_wires[8*(((j*(j+1))/2)+k)+4]));
                    XOR2 xor_inst1 (.a(r[2*(((j*(j+1))/2)+k)]), .b(in_b[2*k-1]), .z(precomp_wires[8*(((j*(j+1))/2)+k)+2]));
                    XOR2 xor_inst2 (.a(precomp_wires[8*(((j*(j+1))/2)+k)+4]), .b(in_b[2*k-1]), .z(precomp_wires[8*(((j*(j+1))/2)+k)]));
                
                end
                
                assign precomp_wires[8*(((j*(j+1))/2)+k)+6] = r[2*(((j*(j+1))/2)+k)];

                INV inv_inst0 (.a(precomp_wires[8*(((j*(j+1))/2)+k)+6]), .z(precomp_wires[8*(((j*(j+1))/2)+k)+7]));
                INV inv_inst1 (.a(precomp_wires[8*(((j*(j+1))/2)+k)+4]), .z(precomp_wires[8*(((j*(j+1))/2)+k)+5]));
                INV inv_inst2 (.a(precomp_wires[8*(((j*(j+1))/2)+k)+2]), .z(precomp_wires[8*(((j*(j+1))/2)+k)+3]));
                INV inv_inst3 (.a(precomp_wires[8*(((j*(j+1))/2)+k)  ]), .z(precomp_wires[8*(((j*(j+1))/2)+k)+1]));

                // register pipelines between source layer and destination layers
                for (t = 0; t < 8; t=t+1) begin : loop_gen_reg_pipeline_

                    REG_r_pipeline #(.depth(j-k+1)) reg_pipeline_inst (.clk(clk), .prch(prch[j:k]), .a(precomp_wires[8*(((j*(j+1))/2)+k)+t]), .z(mux_input_wires[8*(((j*(j+1))/2)+k)+t]));

                end

                //-- muxes -------------------------------    
                DRP_MUX_wNAND mux_inst0 (.a_t(mux_input_wires[8*(((j*(j+1))/2)+k)  ]), .a_f(mux_input_wires[8*(((j*(j+1))/2)+k)+1]), .b_t(mux_input_wires[8*(((j*(j+1))/2)+k)+2]), .b_f(mux_input_wires[8*(((j*(j+1))/2)+k)+3]), .s_t(in_b[2*(j+1)-1]), .s_f(in_b[2*(j+1)]), .z_t(mux_internal_wires[4*(((j*(j+1))/2)+k)  ]), .z_f(mux_internal_wires[4*(((j*(j+1))/2)+k)+1]));
                DRP_MUX_wNAND mux_inst1 (.a_t(mux_input_wires[8*(((j*(j+1))/2)+k)+4]), .a_f(mux_input_wires[8*(((j*(j+1))/2)+k)+5]), .b_t(mux_input_wires[8*(((j*(j+1))/2)+k)+6]), .b_f(mux_input_wires[8*(((j*(j+1))/2)+k)+7]), .s_t(in_b[2*(j+1)-1]), .s_f(in_b[2*(j+1)]), .z_t(mux_internal_wires[4*(((j*(j+1))/2)+k)+2]), .z_f(mux_internal_wires[4*(((j*(j+1))/2)+k)+3]));
                DRP_MUX_wNAND mux_inst2 (.a_t(mux_internal_wires[4*(((j*(j+1))/2)+k)]), .a_f(mux_internal_wires[4*(((j*(j+1))/2)+k)+1]), .b_t(mux_internal_wires[4*(((j*(j+1))/2)+k)+2]), .b_f(mux_internal_wires[4*(((j*(j+1))/2)+k)+3]), .s_t(in_a[2*(j+1)-1]), .s_f(in_a[2*(j+1)]), .z_t(xor_tree_inputs[2*(j*d)+2*(d-j-1)+2*k]), .z_f(xor_tree_inputs[2*(j*d)+2*(d-j-1)+2*k+1]));

            end

            //-- xor tree ---------------------------
            DRP_AND and_inst (.a_t(in_a[2*j+1]), .a_f(in_a[2*j+2]), .b_t(in_b[2*j+1]), .b_f(in_b[2*j+2]), .z_t(xor_tree_inputs[2*j*d+2*(d-j-2)]), .z_f(xor_tree_inputs[2*j*d+2*(d-j-2)+1]));

            for (k = j+1; k < (d-1); k=k+1) begin : loop_xor_tree_rnd_inputs_

                assign xor_tree_inputs[2*j*d+2*(k-j-1)]   = r[2*(((k*(k+1))/2)+j+1)];
                assign xor_tree_inputs[2*j*d+2*(k-j-1)+1] = r[2*(((k*(k+1))/2)+j+1)+1];

            end

            DRP_XOR_TREE_wNAND #(.INPUTS(d)) xor_tree_inst (.a(xor_tree_inputs[2*(j+1)*d-1:2*j*d]), .z(out_z[2*j+2:2*j+1]));

        end

    endgenerate
endmodule