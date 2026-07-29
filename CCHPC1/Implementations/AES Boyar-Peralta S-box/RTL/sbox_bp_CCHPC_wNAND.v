
module sbox_bp_CCHPC_wNAND #( parameter security_order = 1,
                                        insert_registers = 1
)(
    clk, prch, a, r, z
);

    parameter integer d = security_order+1;

    input  clk;
    input  [d-2:0] prch;
    input  [8*((2*(d-1))+1)-1:0] a;
    input  [34*(((d-1)*d-1)+1)-1:0] r;
    output [8*((2*(d-1))+1)-1:0] z;

    //-- config -------------------------------
    wire [2*(d-1):0] t [27:1];
    wire [2*(d-1):0] m [63:1];
    wire [2*(d-1):0] l [29:0];
    
    wire [2*(d-1):0] in_a [7:0];
    wire [(d-1)*d-1:0] in_r [33:0];
    wire [2*(d-1):0] out_z [7:0];
    
    
    // io index mapping
    genvar i;
    generate
        for (i = 0; i < 8; i=i+1) begin : loop_assign_a_z_
            
            assign in_a[i]  = a[(i+1)*(2*(d-1)+1)-1:i*(2*(d-1)+1)]; // data input
            assign z[(i+1)*(2*(d-1)+1)-1:i*(2*(d-1)+1)] = out_z[i]; // data output

        end
        for (i = 0; i < 34; i=i+1) begin : loop_assign_r_
            
            assign in_r[i] = r[(i+1)*(d-1)*d-1:i*(d-1)*d]; // fresh randomness input

        end
    endgenerate


    // T1 = U0 + U3
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t01 (.a(in_a[7]), .b(in_a[4]), .z(t[1]));

    // T2 = U0 + U5
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t02 (.a(in_a[7]), .b(in_a[2]), .z(t[2]));

    // T3 = U0 + U6
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t03 (.a(in_a[7]), .b(in_a[1]), .z(t[3]));

    // T4 = U3 + U5
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t04 (.a(in_a[4]), .b(in_a[2]), .z(t[4]));

    // T5 = U4 + U6
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t05 (.a(in_a[3]), .b(in_a[1]), .z(t[5]));

    // T6 = T1 + T5
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t06 (.a(t[1]), .b(t[5]), .z(t[6]));

    // T7 = U1 + U2
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t07 (.a(in_a[6]), .b(in_a[5]), .z(t[7]));

    // T8 = U7 + T6
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t08 (.a(in_a[0]), .b(t[6]), .z(t[8]));

    // T9 = U7 + T7
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t09 (.a(in_a[0]), .b(t[7]), .z(t[9]));

    // T10 = T6 + T7
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t10 (.a(t[6]), .b(t[7]), .z(t[10]));

    // T11 = U1 + U5
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t11 (.a(in_a[6]), .b(in_a[2]), .z(t[11]));

    // T12 = U2 + U5
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t12 (.a(in_a[5]), .b(in_a[2]), .z(t[12]));

    // T13 = T3 + T4
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t13 (.a(t[3]), .b(t[4]), .z(t[13]));

    // T14 = T6 + T11
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t14 (.a(t[6]), .b(t[11]), .z(t[14]));

    // T15 = T5 + T11
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t15 (.a(t[5]), .b(t[11]), .z(t[15]));

    // T16 = T5 + T12
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t16 (.a(t[5]), .b(t[12]), .z(t[16]));

    // T17 = T9 + T16
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t17 (.a(t[9]), .b(t[16]), .z(t[17]));

    // T18 = U3 + U7
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t18 (.a(in_a[4]), .b(in_a[0]), .z(t[18]));

    // T19 = T7 + T18
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t19 (.a(t[7]), .b(t[18]), .z(t[19]));

    // T20 = T1 + T19
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t20 (.a(t[1]), .b(t[19]), .z(t[20]));

    // T21 = U6 + U7
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t21 (.a(in_a[1]), .b(in_a[0]), .z(t[21]));

    // T22 = T7 + T21
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t22 (.a(t[7]), .b(t[21]), .z(t[22]));

    // T23 = T2 + T22
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t23 (.a(t[2]), .b(t[22]), .z(t[23]));

    // T24 = T2 + T10
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t24 (.a(t[2]), .b(t[10]), .z(t[24]));

    // T25 = T20 + T17
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t25 (.a(t[20]), .b(t[17]), .z(t[25]));

    // T26 = T3 + T16
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t26 (.a(t[3]), .b(t[16]), .z(t[26]));

    // T27 = T1 + T12
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_t27 (.a(t[1]), .b(t[12]), .z(t[27]));

    //---------------------------------------------

    // M1 = T13 x T6
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m01 (.clk(clk), .prch(prch), .a(t[13]), .b(t[6]), .r(in_r[0]), .z(m[1]));

    // M2 = T23 x T8
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m02 (.clk(clk), .prch(prch), .a(t[23]), .b(t[8]), .r(in_r[1]), .z(m[2]));

    // M3 = T14 + M1
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m03 (.a(t[14]), .b(m[1]), .z(m[3]));

    // M4 = T19 x X7
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m04 (.clk(clk), .prch(prch), .a(t[19]), .b(in_a[0]), .r(in_r[2]), .z(m[4]));

    // M5 = M4 + M1
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m05 (.a(m[4]), .b(m[1]), .z(m[5]));

    // M6 = T3 x T16
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m06 (.clk(clk), .prch(prch), .a(t[3]), .b(t[16]), .r(in_r[3]), .z(m[6]));

    // M7 = T22 x T9
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m07 (.clk(clk), .prch(prch), .a(t[22]), .b(t[9]), .r(in_r[4]), .z(m[7]));

    // M8 = T26 + M6
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m08 (.a(t[26]), .b(m[6]), .z(m[8]));

    // M9 = T20 x T17
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m09 (.clk(clk), .prch(prch), .a(t[20]), .b(t[17]), .r(in_r[5]), .z(m[9]));

    // M10 = M9 + M6
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m10 (.a(m[9]), .b(m[6]), .z(m[10]));

    // M11 = T1 x T15
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m11 (.clk(clk), .prch(prch), .a(t[1]), .b(t[15]), .r(in_r[6]), .z(m[11]));

    // M12 = T4 x T27
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m12 (.clk(clk), .prch(prch), .a(t[4]), .b(t[27]), .r(in_r[7]), .z(m[12]));

    // M13 = M12 + M11
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m13 (.a(m[12]), .b(m[11]), .z(m[13]));

    // M14 = T2 x T10
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m14 (.clk(clk), .prch(prch), .a(t[2]), .b(t[10]), .r(in_r[8]), .z(m[14]));

    // M15 = M14 + M11
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m15 (.a(m[14]), .b(m[11]), .z(m[15]));

    // M16 = M3 + M2
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m16 (.a(m[3]), .b(m[2]), .z(m[16]));

    // M17 = M5 + T24
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m17 (.a(m[5]), .b(t[24]), .z(m[17]));

    // M18 = M8 + M7
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m18 (.a(m[8]), .b(m[7]), .z(m[18]));

    // M19 = M10 + M15
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m19 (.a(m[10]), .b(m[15]), .z(m[19]));

    // M20 = M16 + M13
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m20 (.a(m[16]), .b(m[13]), .z(m[20]));

    // M21 = M17 + M15
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m21 (.a(m[17]), .b(m[15]), .z(m[21]));

    // M22 = M18 + M13
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m22 (.a(m[18]), .b(m[13]), .z(m[22]));

    // M23 = M19 + T25
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m23 (.a(m[19]), .b(t[25]), .z(m[23]));

    // M24 = M22 + M23
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m24 (.a(m[22]), .b(m[23]), .z(m[24]));

    // M25 = M22 x M20
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m25 (.clk(clk), .prch(prch), .a(m[22]), .b(m[20]), .r(in_r[9]), .z(m[25]));

    // M26 = M21 + M25
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m26 (.a(m[21]), .b(m[25]), .z(m[26]));

    // M27 = M20 + M21
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m27 (.a(m[20]), .b(m[21]), .z(m[27]));

    // M28 = M23 + M25
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m28 (.a(m[23]), .b(m[25]), .z(m[28]));

    // M29 = M28 x M27
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m29 (.clk(clk), .prch(prch), .a(m[28]), .b(m[27]), .r(in_r[10]), .z(m[29]));

    // M30 = M26 x M24
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m30 (.clk(clk), .prch(prch), .a(m[26]), .b(m[24]), .r(in_r[11]), .z(m[30]));

    // M31 = M20 x M23
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m31 (.clk(clk), .prch(prch), .a(m[20]), .b(m[23]), .r(in_r[12]), .z(m[31]));

    // M32 = M27 x M31
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m32 (.clk(clk), .prch(prch), .a(m[27]), .b(m[31]), .r(in_r[13]), .z(m[32]));

    // M33 = M27 + M25
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m33 (.a(m[27]), .b(m[25]), .z(m[33]));

    // M34 = M21 x M22
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m34 (.clk(clk), .prch(prch), .a(m[21]), .b(m[22]), .r(in_r[14]), .z(m[34]));

    // M35 = M24 x M34
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m35 (.clk(clk), .prch(prch), .a(m[24]), .b(m[34]), .r(in_r[15]), .z(m[35]));

    // M36 = M24 + M25
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m36 (.a(m[24]), .b(m[25]), .z(m[36]));

    // M37 = M21 + M29
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m37 (.a(m[21]), .b(m[29]), .z(m[37]));

    // M38 = M32 + M33
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m38 (.a(m[32]), .b(m[33]), .z(m[38]));

    // M39 = M23 + M30
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m39 (.a(m[23]), .b(m[30]), .z(m[39]));

    // M40 = M35 + M36
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m40 (.a(m[35]), .b(m[36]), .z(m[40]));

    // M41 = M38 + M40
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m41 (.a(m[38]), .b(m[40]), .z(m[41]));

    // M42 = M37 + M39
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m42 (.a(m[37]), .b(m[39]), .z(m[42]));

    // M43 = M37 + M38
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m43 (.a(m[37]), .b(m[38]), .z(m[43]));

    // M44 = M39 + M40
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m44 (.a(m[39]), .b(m[40]), .z(m[44]));

    // M45 = M42 + M41
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_m45 (.a(m[42]), .b(m[41]), .z(m[45]));

    // M46 = M44 x T6
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m46 (.clk(clk), .prch(prch), .a(m[44]), .b(t[6]), .r(in_r[16]), .z(m[46]));

    // M47 = M40 x T8
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m47 (.clk(clk), .prch(prch), .a(m[40]), .b(t[8]), .r(in_r[17]), .z(m[47]));

    // M48 = M39 x X7
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m48 (.clk(clk), .prch(prch), .a(m[39]), .b(in_a[0]), .r(in_r[18]), .z(m[48]));

    // M49 = M43 x T16
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m49 (.clk(clk), .prch(prch), .a(m[43]), .b(t[16]), .r(in_r[19]), .z(m[49]));

    // M50 = M38 x T9
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m50 (.clk(clk), .prch(prch), .a(m[38]), .b(t[9]), .r(in_r[20]), .z(m[50]));

    // M51 = M37 x T17
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m51 (.clk(clk), .prch(prch), .a(m[37]), .b(t[17]), .r(in_r[21]), .z(m[51]));

    // M52 = M42 x T15
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m52 (.clk(clk), .prch(prch), .a(m[42]), .b(t[15]), .r(in_r[22]), .z(m[52]));

    // M53 = M45 x T27
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m53 (.clk(clk), .prch(prch), .a(m[45]), .b(t[27]), .r(in_r[23]), .z(m[53]));

    // M54 = M41 x T10
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m54 (.clk(clk), .prch(prch), .a(m[41]), .b(t[10]), .r(in_r[24]), .z(m[54]));

    // M55 = M44 x T13
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m55 (.clk(clk), .prch(prch), .a(m[44]), .b(t[13]), .r(in_r[25]), .z(m[55]));

    // M56 = M40 x T23
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m56 (.clk(clk), .prch(prch), .a(m[40]), .b(t[23]), .r(in_r[26]), .z(m[56]));

    // M57 = M39 x T19
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m57 (.clk(clk), .prch(prch), .a(m[39]), .b(t[19]), .r(in_r[27]), .z(m[57]));

    // M58 = M43 x T3
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m58 (.clk(clk), .prch(prch), .a(m[43]), .b(t[3]), .r(in_r[28]), .z(m[58]));

    // M59 = M38 x T22
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m59 (.clk(clk), .prch(prch), .a(m[38]), .b(t[22]), .r(in_r[29]), .z(m[59]));

    // M60 = M37 x T20
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m60 (.clk(clk), .prch(prch), .a(m[37]), .b(t[20]), .r(in_r[30]), .z(m[60]));

    // M61 = M42 x T1
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m61 (.clk(clk), .prch(prch), .a(m[42]), .b(t[1]), .r(in_r[31]), .z(m[61]));

    // M62 = M45 x T4
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m62 (.clk(clk), .prch(prch), .a(m[45]), .b(t[4]), .r(in_r[32]), .z(m[62]));

    // M63 = M41 x T2
    nonlinear_CCHPC_wNAND #(.security_order(security_order), .insert_registers(insert_registers), .CONF(2'b00)) and_m63 (.clk(clk), .prch(prch), .a(m[41]), .b(t[2]), .r(in_r[33]), .z(m[63]));

    //---------------------------------------------

    // L0 = M61 + M62
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l00 (.a(m[61]), .b(m[62]), .z(l[0]));

    // L1 = M50 + M56
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l01 (.a(m[50]), .b(m[56]), .z(l[1]));

    // L2 = M46 + M48
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l02 (.a(m[46]), .b(m[48]), .z(l[2]));

    // L3 = M47 + M55
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l03 (.a(m[47]), .b(m[55]), .z(l[3]));

    // L4 = M54 + M58
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l04 (.a(m[54]), .b(m[58]), .z(l[4]));

    // L5 = M49 + M61
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l05 (.a(m[49]), .b(m[61]), .z(l[5]));

    // L6 = M62 + L5
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l06 (.a(m[62]), .b(l[5]), .z(l[6]));

    // L7 = M46 + L3
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l07 (.a(m[46]), .b(l[3]), .z(l[7]));

    // L8 = M51 + M59
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l08 (.a(m[51]), .b(m[59]), .z(l[8]));

    // L9 = M52 + M53
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l09 (.a(m[52]), .b(m[53]), .z(l[9]));

    // L10 = M53 + L4
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l10 (.a(m[53]), .b(l[4]), .z(l[10]));

    // L11 = M60 + L2
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l11 (.a(m[60]), .b(l[2]), .z(l[11]));

    // L12 = M48 + M51
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l12 (.a(m[48]), .b(m[51]), .z(l[12]));

    // L13 = M50 + L0
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l13 (.a(m[50]), .b(l[0]), .z(l[13]));

    // L14 = M52 + M61
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l14 (.a(m[52]), .b(m[61]), .z(l[14]));

    // L15 = M55 + L1
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l15 (.a(m[55]), .b(l[1]), .z(l[15]));

    // L16 = M56 + L0
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l16 (.a(m[56]), .b(l[0]), .z(l[16]));

    // L17 = M57 + L1
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l17 (.a(m[57]), .b(l[1]), .z(l[17]));

    // L18 = M58 + L8
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l18 (.a(m[58]), .b(l[8]), .z(l[18]));

    // L19 = M63 + L4
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l19 (.a(m[63]), .b(l[4]), .z(l[19]));

    // L20 = L0 + L1
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l20 (.a(l[0]), .b(l[1]), .z(l[20]));

    // L21 = L1 + L7
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l21 (.a(l[1]), .b(l[7]), .z(l[21]));

    // L22 = L3 + L12
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l22 (.a(l[3]), .b(l[12]), .z(l[22]));

    // L23 = L18 + L2
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l23 (.a(l[18]), .b(l[2]), .z(l[23]));

    // L24 = L15 + L9
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l24 (.a(l[15]), .b(l[9]), .z(l[24]));

    // L25 = L6 + L10
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l25 (.a(l[6]), .b(l[10]), .z(l[25]));

    // L26 = L7 + L9
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l26 (.a(l[7]), .b(l[9]), .z(l[26]));

    // L27 = L8 + L10
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l27 (.a(l[8]), .b(l[10]), .z(l[27]));

    // L28 = L11 + L14
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l28 (.a(l[11]), .b(l[14]), .z(l[28]));

    // L29 = L11 + L17
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_l29 (.a(l[11]), .b(l[17]), .z(l[29]));

    // S0 = L6 + L24
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_s00 (.a(l[6]), .b(l[24]), .z(out_z[7]));

    // S1 = L16 # L26
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b1)) xnor_s01 (.a(l[16]), .b(l[26]), .z(out_z[6]));

    // S2 = L19 # L28
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b1)) xnor_s02 (.a(l[19]), .b(l[28]), .z(out_z[5]));

    // S3 = L6 + L21
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_s03 (.a(l[6]), .b(l[21]), .z(out_z[4]));

    // S4 = L20 + L22
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_s04 (.a(l[20]), .b(l[22]), .z(out_z[3]));

    // S5 = L25 + L29
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b0)) xor_s05 (.a(l[25]), .b(l[29]), .z(out_z[2]));

    // S6 = L13 # L27
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b1)) xnor_s06 (.a(l[13]), .b(l[27]), .z(out_z[1]));

    // S7 = L6 # L23
    linear_CCHPC_wNAND #(.security_order(security_order), .CONF(1'b1)) xnor_s07 (.a(l[6]), .b(l[23]), .z(out_z[0]));


endmodule
