`timescale 1ps/1ps
module nonlinear_tb_order5;

  reg CLK;
  
  reg  [4:0]  prch;
  reg  [29:0] r; // (..., r1t, r0f, r0t)
  reg  [10:0] a; // (... , a1f, a1t, a0)
  reg  [10:0] b;
  wire [10:0] z;
  

  nonlinear_CCHPC_wNAND #(.security_order(5), .insert_registers(1)) DUT (

      .clk(CLK),
      .prch(prch),
      .a(a),
      .b(b),
      .r(r),
      .z(z)

  );

always #5000 CLK = (CLK === 1'b0);

initial begin

    // reset
    prch <= 5'b11111;
    
    r <= 30'b00000000000000000000000000000;
    
    a <= 11'b00000000000;
    b <= 11'b00000000000;
    
    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");
    

    // Case 0:
    r <= 30'b010110100110101010101010101010;
    
    a <= 11'b10101001011;
    b <= 11'b10101010101;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b11110;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b11100;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b11000;
        
    repeat (1) @(posedge CLK);
    
    prch <= 5'b10000;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b00000;
        
    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || z[5] == z[6] || z[7] == z[8] || z[9] == z[10])
            $display("ERROR: not DR 0");
        if ((z[0] ^ z[1] ^ z[3] ^ z[5] ^ z[7] ^ z[9]) != ((a[0] ^ a[1] ^ a[3] ^ a[5] ^ a[7] ^ a[9]) & (b[0] ^ b[1] ^ b[3] ^ b[5] ^ b[7] ^ b[9])))
            $display("ERROR: wrong result 0");
    end

    repeat (1) @(posedge CLK);
    
    
    // reset
    prch <= 5'b11111;
    
    r <= 30'b00000000000000000000000000000;
    
    a <= 11'b00000000000;
    b <= 11'b00000000000;
    
    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");


    // Case 1:
    r <= 30'b011010101001100101100101100101;
    
    a <= 11'b10101010101;
    b <= 11'b10011010100;

    repeat (1) @(posedge CLK);
    
    prch <= 5'b11110;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b11100;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b11000;
        
    repeat (1) @(posedge CLK);
    
    prch <= 5'b10000;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b00000;
    
    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || z[5] == z[6] || z[7] == z[8] || z[9] == z[10])
            $display("ERROR: not DR 1");
        if ((z[0] ^ z[1] ^ z[3] ^ z[5] ^ z[7] ^ z[9]) != ((a[0] ^ a[1] ^ a[3] ^ a[5] ^ a[7] ^ a[9]) & (b[0] ^ b[1] ^ b[3] ^ b[5] ^ b[7] ^ b[9])))
            $display("ERROR: wrong result 1");
    end

    repeat (1) @(posedge CLK);
    
    
    // reset
    prch <= 5'b11111;
    
    r <= 30'b00000000000000000000000000000;
    
    a <= 11'b00000000000;
    b <= 11'b00000000000;
    
    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // Case 2:
    r <= 30'b101010010101100110101010010110;
    
    a <= 11'b01100101100;
    b <= 11'b01101010011;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b11110;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b11100;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b11000;
        
    repeat (1) @(posedge CLK);
    
    prch <= 5'b10000;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b00000;
    
    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || z[5] == z[6] || z[7] == z[8] || z[9] == z[10])
            $display("ERROR: not DR 2");
        if ((z[0] ^ z[1] ^ z[3] ^ z[5] ^ z[7] ^ z[9]) != ((a[0] ^ a[1] ^ a[3] ^ a[5] ^ a[7] ^ a[9]) & (b[0] ^ b[1] ^ b[3] ^ b[5] ^ b[7] ^ b[9])))
            $display("ERROR: wrong result 2");
    end

    repeat (1) @(posedge CLK);
    

    // reset
    prch <= 5'b11111;
    
    r <= 30'b00000000000000000000000000000;
    
    a <= 11'b00000000000;
    b <= 11'b00000000000;
    
    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");


    // Case 3:
    r <= 30'b010101101010101001010110010110;
    
    a <= 11'b10101001010;
    b <= 11'b01010101101;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b11110;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b11100;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b11000;
        
    repeat (1) @(posedge CLK);
    
    prch <= 5'b10000;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b00000;
    
    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || z[5] == z[6] || z[7] == z[8] || z[9] == z[10])
            $display("ERROR: not DR 3");
        if ((z[0] ^ z[1] ^ z[3] ^ z[5] ^ z[7] ^ z[9]) != ((a[0] ^ a[1] ^ a[3] ^ a[5] ^ a[7] ^ a[9]) & (b[0] ^ b[1] ^ b[3] ^ b[5] ^ b[7] ^ b[9])))
            $display("ERROR: wrong result 3");
    end

    repeat (1) @(posedge CLK);


    // reset
    prch <= 5'b11111;
    
    r <= 30'b00000000000000000000000000000;
    
    a <= 11'b00000000000;
    b <= 11'b00000000000;
    
    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");


    // Case 4:
    r <= 30'b100110011001100101100101101010;
    
    a <= 11'b01010101010;
    b <= 11'b10101010101;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b11110;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b11100;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b11000;
        
    repeat (1) @(posedge CLK);
    
    prch <= 5'b10000;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b00000;
    
    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || z[5] == z[6] || z[7] == z[8] || z[9] == z[10])
            $display("ERROR: not DR 4");
        if ((z[0] ^ z[1] ^ z[3] ^ z[5] ^ z[7] ^ z[9]) != ((a[0] ^ a[1] ^ a[3] ^ a[5] ^ a[7] ^ a[9]) & (b[0] ^ b[1] ^ b[3] ^ b[5] ^ b[7] ^ b[9])))
            $display("ERROR: wrong result 4");
    end

    repeat (1) @(posedge CLK);


    // reset
    prch <= 5'b11111;

    r <= 30'b00000000000000000000000000000;
    
    a <= 11'b00000000000;
    b <= 11'b00000000000;

    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // Case 5:
    r <= 30'b010110100101010101010101101010;
    
    a <= 11'b01100110010;
    b <= 11'b01011001101;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b11110;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b11100;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b11000;
        
    repeat (1) @(posedge CLK);
    
    prch <= 5'b10000;
    
    repeat (1) @(posedge CLK);
    
    prch <= 5'b00000;
    
    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || z[5] == z[6] || z[7] == z[8] || z[9] == z[10])
            $display("ERROR: not DR 5");
        if ((z[0] ^ z[1] ^ z[3] ^ z[5] ^ z[7] ^ z[9]) != ((a[0] ^ a[1] ^ a[3] ^ a[5] ^ a[7] ^ a[9]) & (b[0] ^ b[1] ^ b[3] ^ b[5] ^ b[7] ^ b[9])))
            $display("ERROR: wrong result 5");
    end

    repeat (1) @(posedge CLK);

    $finish;

end
endmodule


