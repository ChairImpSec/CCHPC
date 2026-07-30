module MixOneColumn #( parameter security_order = 1) (a, z);
    parameter integer d = security_order+1;

    input  [d*32-1:0] a;
    output [d*32-1:0] z;

    wire [d-1:0] InByte0 [7:0];
    wire [d-1:0] InByte1 [7:0];
    wire [d-1:0] InByte2 [7:0];
    wire [d-1:0] InByte3 [7:0];

    wire [d-1:0] DoubleByte0 [7:0];
    wire [d-1:0] DoubleByte1 [7:0];
    wire [d-1:0] DoubleByte2 [7:0];
    wire [d-1:0] DoubleByte3 [7:0];

    wire [d-1:0] Inter0Byte0 [7:0];
    wire [d-1:0] Inter0Byte1 [7:0];
    wire [d-1:0] Inter0Byte2 [7:0];
    wire [d-1:0] Inter0Byte3 [7:0];

    wire [d-1:0] Inter1Byte0 [7:0];
    wire [d-1:0] Inter1Byte1 [7:0];
    wire [d-1:0] Inter1Byte2 [7:0];
    wire [d-1:0] Inter1Byte3 [7:0];

    wire [d-1:0] OutByte0 [7:0];
    wire [d-1:0] OutByte1 [7:0];
    wire [d-1:0] OutByte2 [7:0];
    wire [d-1:0] OutByte3 [7:0];

    // IO Mapping
    genvar i;
    generate
        for (i = 0; i < 8; i=i+1) begin : loop_mapping

            assign InByte0[i] = a[d*(i+1+24)-1:d*(i+24)];
            assign InByte1[i] = a[d*(i+1+16)-1:d*(i+16)];
            assign InByte2[i] = a[d*(i+1+ 8)-1:d*(i+ 8)];
            assign InByte3[i] = a[d*(i+1   )-1:d*(i   )];

            assign z[d*(i+1+24)-1:d*(i+24)] = OutByte0[i];
            assign z[d*(i+1+16)-1:d*(i+16)] = OutByte1[i];
            assign z[d*(i+1+ 8)-1:d*(i+ 8)] = OutByte2[i];
            assign z[d*(i+1   )-1:d*(i   )] = OutByte3[i];

        end
    endgenerate

    // -- Mul2 Byte0
    assign DoubleByte0[7] = InByte0[6];
    assign DoubleByte0[6] = InByte0[5];
    assign DoubleByte0[5] = InByte0[4];
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Byte0_inst0 (.a(InByte0[3]), .b(InByte0[7]), .z(DoubleByte0[4]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Byte0_inst1 (.a(InByte0[2]), .b(InByte0[7]), .z(DoubleByte0[3]));
    assign DoubleByte0[2] = InByte0[1];
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Byte0_inst2 (.a(InByte0[0]), .b(InByte0[7]), .z(DoubleByte0[1]));
    assign DoubleByte0[0] = InByte0[7];

    // -- Mul2 Byte1
    assign DoubleByte1[7] = InByte1[6];
    assign DoubleByte1[6] = InByte1[5];
    assign DoubleByte1[5] = InByte1[4];
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Byte1_inst0 (.a(InByte1[3]), .b(InByte1[7]), .z(DoubleByte1[4]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Byte1_inst1 (.a(InByte1[2]), .b(InByte1[7]), .z(DoubleByte1[3]));
    assign DoubleByte1[2] = InByte1[1];
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Byte1_inst2 (.a(InByte1[0]), .b(InByte1[7]), .z(DoubleByte1[1]));
    assign DoubleByte1[0] = InByte1[7];

    // -- Mul2 Byte2
    assign DoubleByte2[7] = InByte2[6];
    assign DoubleByte2[6] = InByte2[5];
    assign DoubleByte2[5] = InByte2[4];
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Byte2_inst0 (.a(InByte2[3]), .b(InByte2[7]), .z(DoubleByte2[4]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Byte2_inst1 (.a(InByte2[2]), .b(InByte2[7]), .z(DoubleByte2[3]));
    assign DoubleByte2[2] = InByte2[1];
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Byte2_inst2 (.a(InByte2[0]), .b(InByte2[7]), .z(DoubleByte2[1]));
    assign DoubleByte2[0] = InByte2[7];

    // -- Mul2 Byte3
    assign DoubleByte3[7] = InByte3[6];
    assign DoubleByte3[6] = InByte3[5];
    assign DoubleByte3[5] = InByte3[4];
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Byte3_inst0 (.a(InByte3[3]), .b(InByte3[7]), .z(DoubleByte3[4]));
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Byte3_inst1 (.a(InByte3[2]), .b(InByte3[7]), .z(DoubleByte3[3]));
    assign DoubleByte3[2] = InByte3[1];
    linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Byte3_inst2 (.a(InByte3[0]), .b(InByte3[7]), .z(DoubleByte3[1]));
    assign DoubleByte3[0] = InByte3[7];

    // CalculateOutBytes:
    generate
        for (i = 0; i < 8; i=i+1) begin : loop_calcOutByte

            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Inter0Byte0_inst (.a(DoubleByte0[i]), .b(InByte1[i]), .z(Inter0Byte0[i]));
            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Inter0Byte1_inst (.a(DoubleByte1[i]), .b(InByte2[i]), .z(Inter0Byte1[i]));
            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Inter0Byte2_inst (.a(DoubleByte2[i]), .b(InByte3[i]), .z(Inter0Byte2[i]));
            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Inter0Byte3_inst (.a(DoubleByte3[i]), .b(InByte0[i]), .z(Inter0Byte3[i]));

            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Inter1Byte0_inst (.a(Inter0Byte0[i]), .b(Inter0Byte1[i]), .z(Inter1Byte0[i]));
            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Inter1Byte1_inst (.a(Inter0Byte1[i]), .b(Inter0Byte2[i]), .z(Inter1Byte1[i]));
            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Inter1Byte2_inst (.a(Inter0Byte2[i]), .b(Inter0Byte3[i]), .z(Inter1Byte2[i]));
            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_Inter1Byte3_inst (.a(Inter0Byte3[i]), .b(Inter0Byte0[i]), .z(Inter1Byte3[i]));

            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_OutByte0_inst (.a(InByte3[i]), .b(Inter1Byte0[i]), .z(OutByte0[i]));
            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_OutByte1_inst (.a(InByte0[i]), .b(Inter1Byte1[i]), .z(OutByte1[i]));
            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_OutByte2_inst (.a(InByte1[i]), .b(Inter1Byte2[i]), .z(OutByte2[i]));
            linear_CCHPC1_1_SRtSR #(.security_order(security_order), .CONF(1'b0)) XOR_Mul2_OutByte3_inst (.a(InByte2[i]), .b(Inter1Byte3[i]), .z(OutByte3[i]));

        end
    endgenerate

endmodule