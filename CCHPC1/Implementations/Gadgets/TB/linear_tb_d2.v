`timescale 1ps/1ps
module linear_tb_order2;

  reg CLK;

  reg  [4:0] a;
  reg  [4:0] b;
  wire [4:0] z;


  linear_CCHPC_wNAND #(.security_order(2)) DUT (

      .a(a),
      .b(b),
      .z(z)

  );


always #5000 CLK = (CLK === 1'b0);

initial begin

    // reset
    a <= 5'b00000;
    b <= 5'b00000;
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");

    repeat (1) @(posedge CLK);

    // Case 0:
    // a = (a0, a1, a2) = (1,0,0) = 1
    // b = (b0, b1, b2) = (1,0,0) = 1

    a <= 5'b10101;
    b <= 5'b10101;
        
    if ((z[0] ^ z[1] ^ z[3]) !== ((a[0] ^ a[1] ^ a[3]) ^ (b[0] ^ b[1] ^ b[3])))
        $display("ERROR: wrong result 0");
            
    if ((z[1] == z[2]) || (z[3] == z[4]))
        $display("ERROR: not DR 0");

    repeat (1) @(posedge CLK);

    // reset
    a <= 5'b00000;
    b <= 5'b00000;
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");

    repeat (1) @(posedge CLK);
    
    // Case 1:
    // a = (a0, a1, a2) = (0,1,1) = 0
    // b = (b0, b1, b2) = (0,0,1) = 1

    a <= 5'b01010;
    b <= 5'b01100;
    
    if ((z[0] ^ z[1] ^ z[3]) !== ((a[0] ^ a[1] ^ a[3]) ^ (b[0] ^ b[1] ^ b[3])))
        $display("ERROR: wrong result 1");
            
    if ((z[1] == z[2]) || (z[3] == z[4]))
        $display("ERROR: not DR 1");
    
    repeat (1) @(posedge CLK);

    $finish;

end
endmodule


