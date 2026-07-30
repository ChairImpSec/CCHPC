module KeySchedule_d #( parameter security_order = 1) (clk, sel, prch0, prch1, r0, r1, Rcon, key, roundKey);
    parameter integer d                        = security_order+1;
    parameter integer nonlinear_count          = 132;
    parameter integer nonlinear_count_per_sbox = 33;

    input  clk;
    input  [d-1:0] sel;
    input  [d-2:0] prch0;
    input  [d-2:0] prch1;
    input  [((d*(d-1)))*nonlinear_count-1:0] r0;
    input  [((d*(d-1)))*nonlinear_count-1:0] r1;
    input  [7:0]       Rcon;
    input  [128*d-1:0] key;
    output [128*d-1:0] roundKey; 


    // ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    // -- Signal Definitions and Mappings -------------------------------------------------------------------------------------------------------------------------------------------

    wire [128*d-1:0] keyRoundInput;       // single-rail
    wire [128*d-1:0] keyRoundInput_reg;   // single-rail
    wire [128*d-1:0] keyRoundOutput;      // single-rail
    wire [128*d-1:0] keyRoundOutput_reg;  // single-rail
    wire [ 32*d-1:0] keyBytesSubstituted; // single-rail
    wire [ 32*d-1:0] keyRconXORed;        // single-rail

    // -- IO Mapping
    assign roundKey = keyRoundInput;

    // ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    // -- Key Schedule Function -----------------------------------------------------------------------------------------------------------------------------------------------------

    // -- KeySchedule Input Selection MUXes
    genvar i, j;
    generate
        for (i = 0; i < 128; i=i+1) begin : loop_input_mux
            for (j = 0; j < d; j=j+1) begin : loop_input_mux_layer

                assign keyRoundInput[d*i+j] = sel[j] ? key[d*i+j] : keyRoundOutput_reg[d*i+j];

            end
        end
    endgenerate

    // -- Round State Register (layer != 0) and SubBytes (also includes Round State FFs)
    generate
        for (i = 0; i < 4; i=i+1) begin : loop_SB

            Sbox_opt_reg_d #(.security_order(security_order), .MoveInputREG(1'b0), .isKeySchedule(1'b1)) SBox_inst (.clk(clk), .prch0(prch0), .prch1(prch1), .r0(r0[(i+1)*((d*(d-1)))*nonlinear_count_per_sbox-1:i*((d*(d-1)))*nonlinear_count_per_sbox]), .r1(r1[(i+1)*((d*(d-1)))*nonlinear_count_per_sbox-1:i*((d*(d-1)))*nonlinear_count_per_sbox]), .a(keyRoundInput[d*(i+1)*8-1:d*i*8]), .z(keyBytesSubstituted[d*(i+1)*8-1:d*i*8]), .z_keyschedule(keyRoundInput_reg[d*(i+1)*8-1:d*i*8]));
        
        end
    endgenerate
    generate
        for (i = 32; i < 128; i=i+1) begin : loop_REG

            assign keyRoundInput_reg[i*d] = keyRoundInput[i*d];
            REG #(.WIDTH(d-1)) REG_inst (clk, keyRoundInput[(i+1)*d-1:i*d+1], keyRoundInput_reg[(i+1)*d-1:i*d+1]); // layer != 0

        end
    endgenerate
    
    // -- Round Constant and Shifts (Rcon unshared => XOR share 0 only)
    assign keyRconXORed[d*24-1:d*16] = keyBytesSubstituted[d*16-1:d* 8];
    assign keyRconXORed[d*16-1:d* 8] = keyBytesSubstituted[d* 8-1:d* 0];
    assign keyRconXORed[d* 8-1:d* 0] = keyBytesSubstituted[d*32-1:d*24];
    generate
        for (i = 0; i < 8; i=i+1) begin : loop_Rcon_XOR

            XOR2 XOR_Rcon_inst (.a(keyBytesSubstituted[d*(i+16)]), .b(Rcon[i]), .z(keyRconXORed[d*(i+24)]));
            assign keyRconXORed[d*(i+25)-1:d*(i+24)+1] = keyBytesSubstituted[d*(i+17)-1:d*(i+16)+1];

        end
    endgenerate

    // -- XOR Words
    generate
        for (i = 0; i < 32; i=i+1) begin : loop_xorWords

            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_inst0 (.a(keyRoundInput_reg[d*(i+97)-1:d*(i+96)]), .b(keyRconXORed[d*(i+1)-1:d*i]),         .z(keyRoundOutput[d*(i+97)-1:d*(i+96)]));
            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_inst1 (.a(keyRoundInput_reg[d*(i+65)-1:d*(i+64)]), .b(keyRoundOutput[d*(i+97)-1:d*(i+96)]), .z(keyRoundOutput[d*(i+65)-1:d*(i+64)]));
            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_inst2 (.a(keyRoundInput_reg[d*(i+33)-1:d*(i+32)]), .b(keyRoundOutput[d*(i+65)-1:d*(i+64)]), .z(keyRoundOutput[d*(i+33)-1:d*(i+32)]));
            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_inst3 (.a(keyRoundInput_reg[d*(i+ 1)-1:d*(i+ 0)]), .b(keyRoundOutput[d*(i+33)-1:d*(i+32)]), .z(keyRoundOutput[d*(i+ 1)-1:d*(i+ 0)]));

        end
    endgenerate

    // -- Round State Register (layer == 0) and SubBytes (also includes Round State FFs)
    generate
        for (i = 0; i < 128; i=i+1) begin : loop_REG_layer0

            REG #(.WIDTH(1)) REG_inst (clk, keyRoundOutput[i*d], keyRoundOutput_reg[i*d]); // layer == 0
            assign keyRoundOutput_reg[(i+1)*d-1:i*d+1] = keyRoundOutput[(i+1)*d-1:i*d+1];

        end
    endgenerate

    // ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

endmodule