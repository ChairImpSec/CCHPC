`timescale 1ps/1ps
module nonlinear_tb_order3;

  reg CLK;
  
  reg  [2:0]  prch;
  reg  [11:0] r; // (..., r1t, r0f, r0t)
  reg  [6:0]  a; // (... , a1f, a1t, a0)
  reg  [6:0]  b;
  wire [6:0]  z;
  

  nonlinear_CCHPC_wNAND #(.security_order(3), .insert_registers(3), .CONF(2'b00), .layer0(1), .consecutive_layers(1)) DUT (

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
    prch <= 3'b111;
    
    r <= 12'b000000000000;
    
    a <= 7'b0000000;
    b <= 7'b0000000;

    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");
   
    
    // Case 0:
    r <= 12'b101010101010;
    
    a <= 7'b1010101;
    b <= 7'b1010101;
    
    repeat (1) @(posedge CLK);
    
    prch <= 3'b110;
    
    repeat (1) @(posedge CLK);
    
    prch <= 3'b100;
    
    repeat (1) @(posedge CLK);
    
    prch <= 3'b000;
        
    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || z[5] == z[6])
            $display("ERROR: not DR 0");
        if ((z[0] ^ z[1] ^ z[3] ^ z[5]) != ((a[0] ^ a[1] ^ a[3] ^ a[5]) & (b[0] ^ b[1] ^ b[3] ^ b[5])))
            $display("ERROR: wrong result 0");
    end
 
    repeat (1) @(posedge CLK);
    
    
    // reset
    prch <= 3'b111;
    
    r <= 12'b000000000000;
    
    a <= 7'b0000000;
    b <= 7'b0000000;

    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");

    // Case 1:
    r <= 12'b100101101001;
    
    a <= 7'b1010101;
    b <= 7'b1010010;

    repeat (1) @(posedge CLK);
    
    prch <= 3'b110;
    
    repeat (1) @(posedge CLK);
    
    prch <= 3'b100;
    
    repeat (1) @(posedge CLK);
    
    prch <= 3'b000;
    
    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || z[5] == z[6])
            $display("ERROR: not DR 1");
        if ((z[0] ^ z[1] ^ z[3] ^ z[5]) != ((a[0] ^ a[1] ^ a[3] ^ a[5]) & (b[0] ^ b[1] ^ b[3] ^ b[5])))
            $display("ERROR: wrong result 1");
    end
 
    repeat (1) @(posedge CLK);
    
    
    // reset
    prch <= 3'b111;
    
    r <= 12'b000000000000;
    
    a <= 7'b0000000;
    b <= 7'b0000000;

    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // Case 2:
    r <= 12'b100101010110;
    
    a <= 7'b0101010;
    b <= 7'b0110100;
    
    repeat (1) @(posedge CLK);
    
    prch <= 3'b110;
    
    repeat (1) @(posedge CLK);
    
    prch <= 3'b100;
    
    repeat (1) @(posedge CLK);
    
    prch <= 3'b000;
    
    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || z[5] == z[6])
            $display("ERROR: not DR 2");
        if ((z[0] ^ z[1] ^ z[3] ^ z[5]) != ((a[0] ^ a[1] ^ a[3] ^ a[5]) & (b[0] ^ b[1] ^ b[3] ^ b[5])))
            $display("ERROR: wrong result 2");
    end
 
    repeat (1) @(posedge CLK);


    // reset
    prch <= 3'b111;
    
    r <= 12'b000000000000;
    
    a <= 7'b0000000;
    b <= 7'b0000000;

    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");


    // Case 3:
    r <= 12'b101001100110;
    
    a <= 7'b1010011;
    b <= 7'b1010010;
    
    repeat (1) @(posedge CLK);
    
    prch <= 3'b110;
    
    repeat (1) @(posedge CLK);
    
    prch <= 3'b100;
    
    repeat (1) @(posedge CLK);
    
    prch <= 3'b000;
    
    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || z[5] == z[6])
            $display("ERROR: not DR 3");
        if ((z[0] ^ z[1] ^ z[3] ^ z[5]) != ((a[0] ^ a[1] ^ a[3] ^ a[5]) & (b[0] ^ b[1] ^ b[3] ^ b[5])))
            $display("ERROR: wrong result 3");
    end
 
    repeat (1) @(posedge CLK);


    // reset
    prch <= 3'b111;
    
    r <= 12'b000000000000;
    
    a <= 7'b0000000;
    b <= 7'b0000000;

    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");


    // Case 4:
    r <= 12'b010110101010;
    
    a <= 7'b0101010;
    b <= 7'b0101010;

    repeat (1) @(posedge CLK);
    
    prch <= 3'b110;
    
    repeat (1) @(posedge CLK);
    
    prch <= 3'b100;
    
    repeat (1) @(posedge CLK);
    
    prch <= 3'b000;
    
    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || z[5] == z[6])
            $display("ERROR: not DR 4");
        if ((z[0] ^ z[1] ^ z[3] ^ z[5]) != ((a[0] ^ a[1] ^ a[3] ^ a[5]) & (b[0] ^ b[1] ^ b[3] ^ b[5])))
            $display("ERROR: wrong result 4");
    end
 
    repeat (1) @(posedge CLK);


    // reset
    prch <= 3'b111;

    r <= 12'b000000000000;
    
    a <= 7'b0000000;
    b <= 7'b0000000;

    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // Case 5:
    r <= 12'b010101101010;
    
    a <= 7'b0101101;
    b <= 7'b0101010;
    
    repeat (1) @(posedge CLK);
    
    prch <= 3'b110;
    
    repeat (1) @(posedge CLK);
    
    prch <= 3'b100;
    
    repeat (1) @(posedge CLK);
    
    prch <= 3'b000;
    
    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || z[5] == z[6])
            $display("ERROR: not DR 5");
        if ((z[0] ^ z[1] ^ z[3] ^ z[5]) != ((a[0] ^ a[1] ^ a[3] ^ a[5]) & (b[0] ^ b[1] ^ b[3] ^ b[5])))
            $display("ERROR: wrong result 5");
    end
 
    repeat (1) @(posedge CLK);

    $finish;

end
endmodule


