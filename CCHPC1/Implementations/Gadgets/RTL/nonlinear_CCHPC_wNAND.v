module nonlinear_CCHPC_wNAND #(  parameter security_order   = 1,
                                           insert_registers = 1,    // CCHPC / CCHPC_RS
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
    input  [d-2:0] prch;     // for every layer crossing
    input  [(d-1)*d-1:0] r;  // required random bits in format {..., r_0_f, r_0_t}, _ indicates random bit index then rail
    input  [2*(d-1):0] a;    // share format: {..., a[2], a[1], a[0]} = {..., a^1_f, a^1_t, a^0}, ^ indicates share index, _ indicates rail
    input  [2*(d-1):0] b;    //
    output [2*(d-1):0] z;    //

    //-- config -------------------------------
    wire [2*(d-1):0] in_a;
    wire [2*(d-1):0] in_b;
    wire [2*(d-1):0] out_z;

    //-- layer0 -------------------------------
    wire [d-1:0] layer0_wires;

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

        assign z[0] = out_z[0];

        if (CONF[0] == 1'b0) begin : gen_out_
            assign z[2*(d-1):1] = out_z[2*(d-1):1];
        end else begin: gen_out_inv_
            assign z[2*(d-1):1] = {out_z[2*d-3], out_z[2*d-2], out_z[2*d-4:1]};
        end
        
        if (CONF[1] == 1'b0) begin : gen_in_
            assign in_a[2*(d-1):1] = a[2*(d-1):1];
            assign in_b[2*(d-1):1] = b[2*(d-1):1];
        end else begin: gen_in_inv_
            assign in_a[2*(d-1):1] = {a[2*d-3], a[2*d-2], a[2*d-4:1]};
            assign in_b[2*(d-1):1] = {b[2*d-3], b[2*d-2], b[2*d-4:1]};
        end
    endgenerate



    //-----------------------------------------
    //-- layer0 (single-rail) -----------------
    //-----------------------------------------

    AND2 layer0_and (.a(in_a[0]), .b(in_b[0]), .z(layer0_wires[0]));

    genvar i;
    generate
        for (i = 0; i < (d-1); i=i+1) begin : loop_gen_layer_0_
            XOR2 xor_rand_inst (.a(layer0_wires[i]), .b(r[i*(i+1)]), .z(layer0_wires[i+1]));
        end
    endgenerate

    assign out_z[0] = layer0_wires[d-1];
    


    //-----------------------------------------
    //-- consecutive layers (dual-rail) -------
    //-----------------------------------------

    genvar j, k, t;
    generate        
        for (j = 0; j < (d-1); j=j+1) begin : loop_gen_layer_

            //-- pre-processing ----------------------
            for (k = 0; k <= j; k=k+1) begin : loop_gen_precomp_
            
                
                if (k == 0) begin : gen_share_selection_0_

                    XOR2 xor_inst0 (.a(r[2*(((j*(j+1))/2)+k)]), .b(in_a[0]), .z(precomp_wires[8*(((j*(j+1))/2)+k)+4]));
                    XOR2 xor_inst1 (.a(r[2*(((j*(j+1))/2)+k)]), .b(in_b[0]), .z(precomp_wires[8*(((j*(j+1))/2)+k)+2]));
                    XOR2 xor_inst2 (.a(precomp_wires[8*(((j*(j+1))/2)+k)+4]), .b(in_b[0]), .z(precomp_wires[8*(((j*(j+1))/2)+k)]));
                    
                end else begin : gen_share_selection_
                
                    XOR2 xor_inst0 (.a(r[2*(((j*(j+1))/2)+k)]), .b(in_a[2*k-1]), .z(precomp_wires[8*(((j*(j+1))/2)+k)+4]));
                    XOR2 xor_inst1 (.a(r[2*(((j*(j+1))/2)+k)]), .b(in_b[2*k-1]), .z(precomp_wires[8*(((j*(j+1))/2)+k)+2]));
                    XOR2 xor_inst2 (.a(precomp_wires[8*(((j*(j+1))/2)+k)+4]), .b(in_b[2*k-1]), .z(precomp_wires[8*(((j*(j+1))/2)+k)]));
                
                end
                
                assign precomp_wires[8*(((j*(j+1))/2)+k)+6] = r[2*(((j*(j+1))/2)+k)];
                INV inv_inst0 (.a(precomp_wires[8*(((j*(j+1))/2)+k)+6]), .z(precomp_wires[8*(((j*(j+1))/2)+k)+7]));
                INV inv_inst1 (.a(precomp_wires[8*(((j*(j+1))/2)+k)+4]), .z(precomp_wires[8*(((j*(j+1))/2)+k)+5]));
                INV inv_inst2 (.a(precomp_wires[8*(((j*(j+1))/2)+k)+2]), .z(precomp_wires[8*(((j*(j+1))/2)+k)+3]));
                INV inv_inst3 (.a(precomp_wires[8*(((j*(j+1))/2)+k)]), .z(precomp_wires[8*(((j*(j+1))/2)+k)+1]));


                // intermediate result registers / wires
                if (insert_registers == 1) begin : gen_precomp_regs_
                    for (t = 0; t < 8; t=t+1) begin : loop_gen_precomp_regs_
                        REG_r reg_inst (.clk(clk), .rst(prch[j]), .d(precomp_wires[8*(((j*(j+1))/2)+k)+t]), .q(mux_input_wires[8*(((j*(j+1))/2)+k)+t]));
                    end
                end else begin: gen_precomp_wires_to_muxes_
                    for (t = 0; t < 8; t=t+1) begin : loop_gen_precomp_wires_to_muxes_
                        assign mux_input_wires[8*(((j*(j+1))/2)+k)+t] = precomp_wires[8*(((j*(j+1))/2)+k)+t];
                    end
                end

                //-- muxes -------------------------------    
                DRP_MUX_wNAND mux_inst0 (.a_t(mux_input_wires[8*(((j*(j+1))/2)+k)  ]), .a_f(mux_input_wires[8*(((j*(j+1))/2)+k)+1]), .b_t(mux_input_wires[8*(((j*(j+1))/2)+k)+2]), .b_f(mux_input_wires[8*(((j*(j+1))/2)+k)+3]), .s_t(b[2*(j+1)-1]), .s_f(b[2*(j+1)]), .z_t(mux_internal_wires[4*(((j*(j+1))/2)+k)  ]), .z_f(mux_internal_wires[4*(((j*(j+1))/2)+k)+1]));
                DRP_MUX_wNAND mux_inst1 (.a_t(mux_input_wires[8*(((j*(j+1))/2)+k)+4]), .a_f(mux_input_wires[8*(((j*(j+1))/2)+k)+5]), .b_t(mux_input_wires[8*(((j*(j+1))/2)+k)+6]), .b_f(mux_input_wires[8*(((j*(j+1))/2)+k)+7]), .s_t(b[2*(j+1)-1]), .s_f(b[2*(j+1)]), .z_t(mux_internal_wires[4*(((j*(j+1))/2)+k)+2]), .z_f(mux_internal_wires[4*(((j*(j+1))/2)+k)+3]));
                DRP_MUX_wNAND mux_inst2 (.a_t(mux_internal_wires[4*(((j*(j+1))/2)+k)]), .a_f(mux_internal_wires[4*(((j*(j+1))/2)+k)+1]), .b_t(mux_internal_wires[4*(((j*(j+1))/2)+k)+2]), .b_f(mux_internal_wires[4*(((j*(j+1))/2)+k)+3]), .s_t(a[2*(j+1)-1]), .s_f(a[2*(j+1)]), .z_t(xor_tree_inputs[2*(j*d)+2*(d-j-1)+2*k]), .z_f(xor_tree_inputs[2*(j*d)+2*(d-j-1)+2*k+1]));


            end

            //-- xor tree ---------------------------
            DRP_AND and_inst (.a_t(in_a[2*j+1]), .a_f(in_a[2*j+2]), .b_t(in_b[2*j+1]), .b_f(in_b[2*j+2]), .z_t(xor_tree_inputs[2*j*d+2*(d-j-2)]), .z_f(xor_tree_inputs[2*j*d+2*(d-j-2)+1]));
            
            for (k = j+1; k < (d-1); k=k+1) begin : loop_rnd_to_xor_tree_

                assign xor_tree_inputs[2*j*d+2*(k-j-1)]   = r[2*(((k*(k+1))/2)+j+1)];
                assign xor_tree_inputs[2*j*d+2*(k-j-1)+1] = r[2*(((k*(k+1))/2)+j+1)+1];

            end

            DRP_XOR_TREE_wNAND #(.INPUTS(d)) xor_tree_inst (.a(xor_tree_inputs[2*(j+1)*d-1:2*j*d]), .z(out_z[2*j+2:2*j+1]));

        end
    endgenerate
endmodule