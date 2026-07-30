module Looped_Round_d #( parameter security_order = 1) (clk, rst, r0, r1, plaintext, key, ciphertext, done_layer0);
    parameter integer d                        = security_order+1;
    parameter integer nonlinear_count          = 660;
    parameter integer nonlinear_count_per_sbox = 33;

    input  clk;
    input  rst;
    input  [((d*(d-1)))*nonlinear_count-1:0] r0; // dual-rail randomness, certain bits are given in single-rail and assigned to r0, r1
    input  [((d*(d-1)))*nonlinear_count-1:0] r1; // 
    input  [128*d-1:0] plaintext;
    input  [128*d-1:0] key;
    output [128*d-1:0] ciphertext;
    output done_layer0;

    // ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    // -- Signal Definitions and Mappings -------------------------------------------------------------------------------------------------------------------------------------------

    wire [d-2:0] prch0; // for each dual-rail layer in duality instance 0
    wire [d-2:0] prch1; // for each dual-rail layer in duality instance 1
    wire [d-1:0] sel;   // for each layer
    wire [d-1:0] MCsel; // for each layer
    wire [7:0]   Rcon;  // layer0 only

    // -- Intermediates
    wire [128*d-1:0] roundOutput;      // single-rail
    wire [128*d-1:0] roundInput;       // single-rail
    wire [128*d-1:0] roundKey;         // single-rail
    wire [128*d-1:0] keyXORed;         // single-rail
    wire [128*d-1:0] bytesSubstituted; // single-rail
    wire [128*d-1:0] rowsShifted;      // single-rail
    wire [128*d-1:0] columnsMixed;     // single-rail

    // -- IO Mapping
    assign ciphertext[128*d-1:0] = keyXORed[128*d-1:0];

    // ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    // -- Control -------------------------------------------------------------------------------------------------------------------------------------------------------------------

    Controller #(.security_order(security_order)) Controller_inst (.clk(clk), .rst(rst), .prch0(prch0), .prch1(prch1), .sel(sel), .MCsel(MCsel), .Rcon(Rcon), .done_layer0(done_layer0));

    // ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    // -- Round Function ------------------------------------------------------------------------------------------------------------------------------------------------------------

    // -- Round Input Selection MUXes
    genvar i, j;
    generate
        for (i = 0; i < 128; i=i+1) begin : loop_input_mux
            for (j = 0; j < d; j=j+1) begin : loop_input_mux_layer

                assign roundInput[d*i+j] = sel[j] ? plaintext[d*i+j] : roundOutput[d*i+j];

            end
        end
    endgenerate

    // -- Key XOR
    generate
        for (i = 0; i < 128; i=i+1) begin : loop_keyXOR
    
            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) keyXOR_inst (.a(roundInput[d*(i+1)-1:d*i]), .b(roundKey[d*(i+1)-1:d*i]), .z(keyXORed[d*(i+1)-1:d*i]));

        end
    endgenerate

    // -- SubBytes
    generate
        for (i = 0; i < 16; i=i+1) begin : loop_SB

            Sbox_opt_reg_d #(.security_order(security_order), .MoveInputREG(1'b1), .isKeySchedule(1'b0)) SBox_inst (.clk(clk), .prch0(prch0), .prch1(prch1), .r0(r0[(i+1)*((d*(d-1)))*nonlinear_count_per_sbox-1:i*((d*(d-1)))*nonlinear_count_per_sbox]), .r1(r1[(i+1)*((d*(d-1)))*nonlinear_count_per_sbox-1:i*((d*(d-1)))*nonlinear_count_per_sbox]), .a(keyXORed[d*(i+1)*8-1:d*i*8]), .z(bytesSubstituted[d*(i+1)*8-1:d*i*8]), .z_keyschedule());

        end
    endgenerate

    // -- ShiftRows
    assign rowsShifted[128*d-1:120*d] = bytesSubstituted[128*d-1:120*d]; //  0 ->  0
    assign rowsShifted[120*d-1:112*d] = bytesSubstituted[ 88*d-1: 80*d]; //  1 ->  5
    assign rowsShifted[112*d-1:104*d] = bytesSubstituted[ 48*d-1: 40*d]; //  2 -> 10
    assign rowsShifted[104*d-1: 96*d] = bytesSubstituted[  8*d-1:  0*d]; //  3 -> 15
    assign rowsShifted[ 96*d-1: 88*d] = bytesSubstituted[ 96*d-1: 88*d]; //  4 ->  4
    assign rowsShifted[ 88*d-1: 80*d] = bytesSubstituted[ 56*d-1: 48*d]; //  5 ->  9
    assign rowsShifted[ 80*d-1: 72*d] = bytesSubstituted[ 16*d-1:  8*d]; //  6 -> 14
    assign rowsShifted[ 72*d-1: 64*d] = bytesSubstituted[104*d-1: 96*d]; //  7 ->  3
    assign rowsShifted[ 64*d-1: 56*d] = bytesSubstituted[ 64*d-1: 56*d]; //  8 ->  8
    assign rowsShifted[ 56*d-1: 48*d] = bytesSubstituted[ 24*d-1: 16*d]; //  9 -> 13
    assign rowsShifted[ 48*d-1: 40*d] = bytesSubstituted[112*d-1:104*d]; // 10 ->  2
    assign rowsShifted[ 40*d-1: 32*d] = bytesSubstituted[ 72*d-1: 64*d]; // 11 ->  7
    assign rowsShifted[ 32*d-1: 24*d] = bytesSubstituted[ 32*d-1: 24*d]; // 12 -> 12
    assign rowsShifted[ 24*d-1: 16*d] = bytesSubstituted[120*d-1:112*d]; // 13 ->  1
    assign rowsShifted[ 16*d-1:  8*d] = bytesSubstituted[ 80*d-1: 72*d]; // 14 ->  6
    assign rowsShifted[  8*d-1:  0*d] = bytesSubstituted[ 40*d-1: 32*d]; // 15 -> 11

    // -- MixColumns
    generate
        for (i = 0; i < 4; i=i+1) begin : loop_MC
    
             MixOneColumn #(.security_order(security_order)) MixOneColumn_inst (.a(rowsShifted[(i+1)*d*32-1:i*d*32]), .z(columnsMixed[(i+1)*d*32-1:i*d*32]));

        end
    endgenerate

    // ---- MC Selection MUX
    generate
        for (i = 0; i < 128; i=i+1) begin : loop_MC_mux
            for (j = 0; j < d; j=j+1) begin : loop_MC_mux_layer

                assign roundOutput[d*i+j] = MCsel[j] ? rowsShifted[d*i+j] : columnsMixed[d*i+j];

            end
        end
    endgenerate

    // ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    // -- Key Schedule --------------------------------------------------------------------------------------------------------------------------------------------------------------

    KeySchedule_d #(.security_order(security_order)) KeySchedule_inst (.clk(clk), .sel(sel), .prch0(prch0), .prch1(prch1), .r0(r0[20*((d*(d-1)))*nonlinear_count_per_sbox-1:16*((d*(d-1)))*nonlinear_count_per_sbox]), .r1(r1[20*((d*(d-1)))*nonlinear_count_per_sbox-1:16*((d*(d-1)))*nonlinear_count_per_sbox]), .Rcon(Rcon), .key(key), .roundKey(roundKey));

    // ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

endmodule