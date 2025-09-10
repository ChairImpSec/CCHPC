`timescale 1ps/1ps
module nonlinear_tb_order2;

  reg CLK;
  
  reg  [2:0] prch;
  reg  [5:0] r; // (..., r1t, r0f, r0t)
  reg  [4:0] a; // (... , a1f, a1t, a0)
  reg  [4:0] b;
  wire [4:0] z;
  

  nonlinear_CCHPC_wNAND #(.security_order(2), .insert_registers(1), .CONF(2'b00), .layer0(1), .consecutive_layers(1)) DUT (

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
    prch <= 2'b11;
    
    r <= 6'b000000;
    
    a <= 5'b00000;
    b <= 5'b00000;

    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // Case 0:
    r <= 6'b100110;
    
    a <= 5'b10101;
    b <= 5'b10011;
    
    repeat (1) @(posedge CLK);
    
    prch <= 2'b10;
    
    repeat (1) @(posedge CLK);
    
    prch <= 2'b00;
    
    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]))
            $display("ERROR: not DR 0");
        if ((z[0] ^ z[1] ^ z[3]) != ((a[0] ^ a[1] ^ a[3]) & (b[0] ^ b[1] ^ b[3])))
            $display("ERROR: wrong result 0");
    end

    repeat (1) @(posedge CLK);
    
    
    // reset
    prch <= 2'b11;
    
    r <= 6'b000000;
    
    a <= 5'b00000;
    b <= 5'b00000;

    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");


    // Case 1:
    r <= 6'b011010;
    
    a <= 5'b01010;
    b <= 5'b01010;

    repeat (1) @(posedge CLK);
    
    prch <= 2'b10;
    
    repeat (1) @(posedge CLK);
    
    prch <= 2'b00;
    
    repeat (1) @(posedge CLK);
    
    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]))
            $display("ERROR: not DR 1");
        if ((z[0] ^ z[1] ^ z[3]) != ((a[0] ^ a[1] ^ a[3]) & (b[0] ^ b[1] ^ b[3])))
            $display("ERROR: wrong result 1");
    end
    
    repeat (1) @(posedge CLK);
    
       
    // reset
    prch <= 2'b11;
    
    r <= 6'b000000;
    
    a <= 5'b00000;
    b <= 5'b00000;

    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // Case 2:
    r <= 6'b101001;
    
    a <= 5'b10010;
    b <= 5'b01100;
    
    repeat (1) @(posedge CLK);
    
    prch <= 2'b10;
    
    repeat (1) @(posedge CLK);
    
    prch <= 2'b00;
    
    repeat (1) @(posedge CLK);
    
    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]))
            $display("ERROR: not DR 2");
        if ((z[0] ^ z[1] ^ z[3]) != ((a[0] ^ a[1] ^ a[3]) & (b[0] ^ b[1] ^ b[3])))
            $display("ERROR: wrong result 2");
    end
    
    repeat (1) @(posedge CLK);


    // reset
    prch <= 2'b11;
    
    r <= 6'b000000;
    
    a <= 5'b00000;
    b <= 5'b00000;
    
    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");
        

    // Case 3:
    r <= 6'b101010;
    
    a <= 5'b01100;
    b <= 5'b01100;
    
    repeat (1) @(posedge CLK);
    
    prch <= 2'b10;
    
    repeat (1) @(posedge CLK);
    
    prch <= 2'b00;
    
    repeat (1) @(posedge CLK);
    
    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]))
            $display("ERROR: not DR 3");
        if ((z[0] ^ z[1] ^ z[3]) != ((a[0] ^ a[1] ^ a[3]) & (b[0] ^ b[1] ^ b[3])))
            $display("ERROR: wrong result 3");
    end
    
    repeat (1) @(posedge CLK);


    // reset
    prch <= 2'b11;
    
    r <= 6'b000000;
    
    a <= 5'b00000;
    b <= 5'b00000;

    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");


    // Case 4:
    r <= 6'b010110;
    
    a <= 5'b10010;
    b <= 5'b10010;
    
    repeat (1) @(posedge CLK);
    
    prch <= 2'b10;
    
    repeat (1) @(posedge CLK);
    
    prch <= 2'b00;
    
    repeat (1) @(posedge CLK);
    
    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]))
            $display("ERROR: not DR 4");
        if ((z[0] ^ z[1] ^ z[3]) != ((a[0] ^ a[1] ^ a[3]) & (b[0] ^ b[1] ^ b[3])))
            $display("ERROR: wrong result 4");
    end
    
    repeat (1) @(posedge CLK);


    // reset
    prch <= 2'b11;

    r <= 6'b000000;
    
    a <= 5'b00000;
    b <= 5'b00000;
    
    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // Case 5:
    r <= 6'b010110;
    
    a <= 5'b01011;
    b <= 5'b01011;
    
    repeat (1) @(posedge CLK);
    
    prch <= 2'b10;
    
    repeat (1) @(posedge CLK);
    
    prch <= 2'b00;
    
    repeat (1) @(posedge CLK);
    
    @(negedge CLK) begin
        if ((z[1] == z[2]) || (z[3] == z[4]))
            $display("ERROR: not DR 5");
        if ((z[0] ^ z[1] ^ z[3]) != ((a[0] ^ a[1] ^ a[3]) & (b[0] ^ b[1] ^ b[3])))
            $display("ERROR: wrong result 5");
    end
    
    repeat (1) @(posedge CLK);

    $finish;

end
endmodule


