`timescale 1ps/1ps
module CCHPC1_1_tb_order3;

  reg clk;
  reg [2:0] prch;

  reg  [11:0] r;
  reg  [6:0] a;
  reg  [6:0] b;
  wire [6:0] z;
  
  reg       z_layer0_step0;
  reg       z_layer0_step1;
  reg       z_layer0_step2;
  reg [1:0] z_layer1_step0;
  reg [1:0] z_layer1_step1;
  reg [1:0] z_layer2_step0;

  always @(posedge clk)
  begin
    z_layer0_step0 <= z[0];
    z_layer0_step1 <= z_layer0_step0;
    z_layer0_step2 <= z_layer0_step1;
    
    z_layer1_step0 <= z[2:1];
    z_layer1_step1 <= z_layer1_step0;

    z_layer2_step0 <= z[4:3];
  end
  
  wire a_provided;
  wire b_provided;
  wire z_expected;
  wire z_computed;

  assign a_provided = a[0] ^ a[1] ^ a[3] ^ a[5];
  assign b_provided = b[0] ^ b[1] ^ b[3] ^ b[5];
  assign z_expected = a_provided & b_provided;
  
  assign z_computed = z_layer0_step2 ^ z_layer1_step1[0] ^ z_layer2_step0[0] ^ z[5];

  nonlinear_CCHPC1_1_DRtDR_order3 #(.CONF(2'b00)) DUT (

      .clk(clk),
      .prch(prch),
      .a(a),
      .b(b),
      .r(r),
      .z(z)

  );

always #5000 clk = (clk === 1'b0);

initial begin
    
    // reset
    prch <= 3'b111;    

    r <= 12'b000000000000;
    
    a <= 7'b0000000;
    b <= 7'b0000000;

    repeat (5) @(posedge clk); 
    
    if (z[6:1] != 0)
        $display("ERROR: not properly pre-charged");
    
    
    
    // Case 0:
    prch <= 3'b110;    

    r <= 12'b000010000110;
    
    a <= 7'b0000001;
    b <= 7'b0000001;
    
    repeat (1) @(posedge clk);
    
    prch <= 3'b100;    

    r <= 12'b001010010110;

    a <= 7'b0000101;
    b <= 7'b0000011;
    
    repeat (1) @(posedge clk);
    
    prch <= 3'b000;    

    r <= 12'b011010010110;

    a <= 7'b0010101;
    b <= 7'b0010011;
    
    repeat (1) @(posedge clk);

    a <= 7'b1010101;
    b <= 7'b1010011;
    
    repeat (1) @(posedge clk);

    @(negedge clk) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || (z[5] == z[6]))
            $display("ERROR: not DR 0");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 0");
    end

    repeat (5) @(posedge clk);
    
    
    // reset
    prch <= 3'b111;    

    r <= 12'b000000000000;
    
    a <= 7'b0000000;
    b <= 7'b0000000;

    repeat (5) @(posedge clk);
    
    if (z[6:1] != 0)
        $display("ERROR: not properly pre-charged");


    // Case 1:
    prch <= 3'b110;    

    r <= 12'b000001000110;
    
    a <= 7'b0000000;
    b <= 7'b0000000;

    repeat (1) @(posedge clk);
    
    prch <= 3'b100;

    r <= 12'b000101100110;  

    a <= 7'b0000010;
    b <= 7'b0000010;
    
    repeat (1) @(posedge clk);
    
    prch <= 3'b000;

    r <= 12'b100101100110; 

    a <= 7'b0001010;
    b <= 7'b0001010;
    
    repeat (1) @(posedge clk);
    
    a <= 7'b0101010;
    b <= 7'b0101010;
    
    repeat (1) @(posedge clk);

    @(negedge clk) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || (z[5] == z[6]))
            $display("ERROR: not DR 1");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 1");
    end
    
    repeat (5) @(posedge clk);
    
       
    // reset
    prch <= 3'b111;        

    r <= 12'b000000000000;
    
    a <= 7'b0000000;
    b <= 7'b0000000;

    repeat (5) @(posedge clk);
    
    if (z[6:1] != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // Case 2:
    prch <= 3'b110;    

    r <= 12'b000001001001;  
    
    a <= 7'b0000000;
    b <= 7'b0000000;
    
    repeat (1) @(posedge clk);
    
    prch <= 3'b100;

    r <= 12'b001001101001;  

    a <= 7'b0000010;
    b <= 7'b0000100;
    
    repeat (1) @(posedge clk);
    
    prch <= 3'b000;

    r <= 12'b011001101001;

    a <= 7'b0010010;
    b <= 7'b0001100;
    
    repeat (1) @(posedge clk);
    
    a <= 7'b0110010;
    b <= 7'b1001100;
    
    repeat (1) @(posedge clk);

    @(negedge clk) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || (z[5] == z[6]))
            $display("ERROR: not DR 2");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 2");
    end
    
    repeat (5) @(posedge clk);


    // reset
    prch <= 3'b111;    

    r <= 12'b000000000000;
    
    a <= 7'b0000000;
    b <= 7'b0000000;

    repeat (5) @(posedge clk); 
    
    if (z[6:1] != 0)
        $display("ERROR: not properly pre-charged");
        

    // Case 3:
    prch <= 3'b110;    

    r <= 12'b000010000110;
    
    a <= 7'b0000000;
    b <= 7'b0000000;
    
    repeat (1) @(posedge clk);
    
    prch <= 3'b100;

    r <= 12'b001010010110; 

    a <= 7'b0000100;
    b <= 7'b0000100;
    
    repeat (1) @(posedge clk);
    
    prch <= 3'b000;

    r <= 12'b011010010110;

    a <= 7'b0001100;
    b <= 7'b0001100;
    
    repeat (1) @(posedge clk);
    
    a <= 7'b1001100;
    b <= 7'b1001100;
    
    repeat (1) @(posedge clk);

    @(negedge clk) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || (z[5] == z[6]))
            $display("ERROR: not DR 3");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 3");
    end
    
    repeat (5) @(posedge clk);


    // reset
    prch <= 3'b111;    

    r <= 12'b000000000000;
    
    a <= 7'b0000000;
    b <= 7'b0000000;

    repeat (5) @(posedge clk);
    
    if (z[6:1] != 0)
        $display("ERROR: not properly pre-charged");


    // Case 4:
    prch <= 3'b110;    

    r <= 12'b000001000110; 
    
    a <= 7'b0000000;
    b <= 7'b0000000;
    
    repeat (1) @(posedge clk);
    
    prch <= 3'b100;

    r <= 12'b000101100110;

    a <= 7'b0000010;
    b <= 7'b0000010;
    
    repeat (1) @(posedge clk);
    
    prch <= 3'b000;

    r <= 12'b100101100110;

    a <= 7'b0010010;
    b <= 7'b0010010;
    
    repeat (1) @(posedge clk);
    
    a <= 7'b0110010;
    b <= 7'b0110010;
    
    repeat (1) @(posedge clk);

    @(negedge clk) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || (z[5] == z[6]))
            $display("ERROR: not DR 4");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 4");
    end
    
    repeat (5) @(posedge clk);


    // reset
    prch <= 3'b111;    

    r <= 12'b000000000000;
    
    a <= 7'b0000000;
    b <= 7'b0000000;

    repeat (5) @(posedge clk);
    
    if (z[6:1] != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // Case 5:
    prch <= 3'b110;    

    r <= 12'b000001000110;
    
    a <= 7'b0000001;
    b <= 7'b0000001;
    
    repeat (1) @(posedge clk);
    
    prch <= 3'b100;

    r <= 12'b000101100110;

    a <= 7'b0000011;
    b <= 7'b0000011;
    
    repeat (1) @(posedge clk);
    
    prch <= 3'b000;

    r <= 12'b100101100110;

    a <= 7'b0001011;
    b <= 7'b0001011;
    
    repeat (1) @(posedge clk);
    
    a <= 7'b1001011;
    b <= 7'b1001011;
    
    repeat (1) @(posedge clk);
     
    @(negedge clk) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || (z[5] == z[6]))
            $display("ERROR: not DR 5");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 5");
    end
    
    repeat (5) @(posedge clk);


    // reset
    prch <= 3'b111;    

    r <= 12'b000000000000;
    
    a <= 7'b0000000;
    b <= 7'b0000000;

    repeat (5) @(posedge clk); 
    
    if (z[6:1] != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // Case 6:
    prch <= 3'b110;    

    r <= 12'b000001000110;
    
    a <= 7'b0000001;
    b <= 7'b0000001;
    
    repeat (1) @(posedge clk);
    
    prch <= 3'b100;

    r <= 12'b001001100110;   

    a <= 7'b0000101;
    b <= 7'b0000101;
    
    repeat (1) @(posedge clk);
    
    prch <= 3'b000;

    r <= 12'b011001100110;

    a <= 7'b0010101;
    b <= 7'b0010101;
    
    repeat (1) @(posedge clk);

    a <= 7'b1010101;
    b <= 7'b1010101;

    repeat (1) @(posedge clk);

    @(negedge clk) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || (z[5] == z[6]))
            $display("ERROR: not DR 6");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 6");
    end

    repeat (5) @(posedge clk);


    // reset
    prch <= 3'b111;    

    r <= 12'b000000000000;
    
    a <= 7'b0000000;
    b <= 7'b0000000;

    repeat (5) @(posedge clk); 
    
    if (z[6:1] != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // Case 7:
    prch <= 3'b110;    

    r <= 12'b000001000110;
    
    a <= 7'b0000001;
    b <= 7'b0000001;
    
    repeat (1) @(posedge clk);
    
    prch <= 3'b100;

    r <= 12'b001001100110; 

    a <= 7'b0000011;
    b <= 7'b0000011;
    
    repeat (1) @(posedge clk);
    
    prch <= 3'b000;

    r <= 12'b011001100110;

    a <= 7'b0001011;
    b <= 7'b0001011;
    
    repeat (1) @(posedge clk);

    a <= 7'b0101011;
    b <= 7'b0101011;

    repeat (1) @(posedge clk);

    @(negedge clk) begin
        if ((z[1] == z[2]) || (z[3] == z[4]) || (z[5] == z[6]))
            $display("ERROR: not DR 7");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 7");
    end

    repeat (5) @(posedge clk);
    

    $finish;

end
endmodule


