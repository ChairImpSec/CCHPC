`timescale 1ps/1ps
module sbox_bp_tb_order1;

  reg CLK;
  
  reg  prch;
  wire [67:0] r;  // dual-rail randomness (..., r1t, r0f, r0t)
  wire [23:0] a;  // concatenated shared bits (each in CCHPC representation)
  wire [23:0] z;  //
  wire [7:0] out; // unshared computed output

  reg [33:0] r_gen; // generated fresh randomness

  reg [2:0] a_bit0; // bit in CCHPC representation:  (a1f, a1t, a0)
  reg [2:0] a_bit1; //
  reg [2:0] a_bit2; //
  reg [2:0] a_bit3; //
  reg [2:0] a_bit4; //
  reg [2:0] a_bit5; //
  reg [2:0] a_bit6; //
  reg [2:0] a_bit7; //
  
  wire [2:0] z_bit0; //
  wire [2:0] z_bit1; //
  wire [2:0] z_bit2; //
  wire [2:0] z_bit3; //
  wire [2:0] z_bit4; //
  wire [2:0] z_bit5; //
  wire [2:0] z_bit6; //
  wire [2:0] z_bit7; //
  
  // generate dual-rail representation of fresh randomness  
  genvar i;
  generate
    for (i = 0; i < 34; i = i+1) begin
        assign r[2*i]   =  r_gen[i] & ~prch;
        assign r[2*i+1] = ~r_gen[i] & ~prch;
    end
  endgenerate
  
  // concatenate shared input bits
  assign a = {a_bit7, a_bit6, a_bit5, a_bit4, a_bit3, a_bit2, a_bit1, a_bit0} & {24{~prch}};
  
  // disassemble output to shared bits
  assign z_bit0 = z[ 2: 0];
  assign z_bit1 = z[ 5: 3];
  assign z_bit2 = z[ 8: 6];
  assign z_bit3 = z[11: 9];
  assign z_bit4 = z[14:12];
  assign z_bit5 = z[17:15];
  assign z_bit6 = z[20:18];
  assign z_bit7 = z[23:21];
  
  // retrieve unshared output
  assign out = {z_bit7[1] ^ z_bit7[0], z_bit6[1] ^ z_bit6[0], z_bit5[1] ^ z_bit5[0], z_bit4[1] ^ z_bit4[0], z_bit3[1] ^ z_bit3[0], z_bit2[1] ^ z_bit2[0], z_bit1[1] ^ z_bit1[0], z_bit0[1] ^ z_bit0[0]};
  
   // DUT
  sbox_bp_CCHPC_wNAND #(.security_order(1), .insert_registers(1)) DUT (

      .clk(CLK),
      .prch(prch),
      .a(a),
      .r(r),
      .z(z)

  );

always #5000 CLK = (CLK === 1'b0);

initial begin   
    
    // reset
    prch <= 1'b1;
    
    r_gen <= 34'b0000000000000000000000000000000000;
    
    a_bit0 <= 3'b000;
    a_bit1 <= 3'b000;
    a_bit2 <= 3'b000;
    a_bit3 <= 3'b000;
    a_bit4 <= 3'b000;
    a_bit5 <= 3'b000;
    a_bit6 <= 3'b000;
    a_bit7 <= 3'b000;

    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");
        
    r_gen <= { $random() & 2'b11, $random($time) };

    // input: 8'h13 => expected output: 8'h7D;
    a_bit0 <= 3'b101; //1
    a_bit1 <= 3'b010; //1
    a_bit2 <= 3'b100; //0
    a_bit3 <= 3'b011; //0
    a_bit4 <= 3'b010; //1
    a_bit5 <= 3'b100; //0
    a_bit6 <= 3'b100; //0
    a_bit7 <= 3'b011; //0
    
    prch <= 1'b0;
    
    repeat (1) @(posedge CLK);
    
    @(negedge CLK) begin
        if (out != 8'h7D)
            $display("ERROR: wrong result 0");
    end
    
    repeat (1) @(posedge CLK);

    $finish;

end
endmodule