`timescale 1ps/1ps
module CCHPC1_1_tb_order2;

  reg clk;
  reg [1:0] prch;

  reg  [5:0] r;
  reg  [4:0] a;
  reg  [4:0] b;
  wire [4:0] z;
  
  reg       z_layer0_step0;
  reg       z_layer0_step1;
  reg [1:0] z_layer1_step0;

  always @(posedge clk)
  begin
    z_layer0_step0 <= z[0];
    z_layer0_step1 <= z_layer0_step0;
    
    z_layer1_step0 <= z[2:1];
  end
  
  wire a_provided;
  wire b_provided;
  wire z_expected;
  wire z_computed;

  assign a_provided = a[0] ^ a[1] ^ a[3];
  assign b_provided = b[0] ^ b[1] ^ b[3];
  assign z_expected = a_provided & b_provided;
  
  assign z_computed = z_layer0_step1 ^ z_layer1_step0[0] ^ z[3];

  nonlinear_CCHPC1_1_DRtDR_order2 #(.CONF(2'b00)) DUT (

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
    prch <= 2'b11;    
    
    r <= 6'b000000;
    
    a <= 5'b00000;
    b <= 5'b00000;

    repeat (1) @(posedge clk); 
    
    if (z[4:1] != 0)
        $display("ERROR: not properly pre-charged");
    
    
    
    // Case 0:
    prch <= 2'b10;

    r <= 6'b000110;
    
    a <= 5'b00001;
    b <= 5'b00001;
    
    repeat (1) @(posedge clk);

    prch <= 2'b00;

    r <= 6'b010110;

    a <= 5'b00101;
    b <= 5'b00011;
    
    repeat (1) @(posedge clk);
    
    a <= 5'b10101;
    b <= 5'b10011;
    
    repeat (1) @(posedge clk);

    @(negedge clk) begin
        if ((z[1] == z[2]) || (z[3] == z[4]))
            $display("ERROR: not DR 0");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 0");
    end

    repeat (3) @(posedge clk);
    
    
    // reset  
    prch <= 2'b11;    

    r <= 6'b000000;
    
    a <= 5'b00000;
    b <= 5'b00000;

    repeat (1) @(posedge clk); 
    
    if (z[4:1] != 0)
        $display("ERROR: not properly pre-charged");


    // Case 1:
    prch <= 2'b10;

    r <= 6'b000110;
    
    a <= 5'b00000;
    b <= 5'b00000;

    repeat (1) @(posedge clk);
    
    prch <= 2'b00;

    r <= 6'b100110;

    a <= 5'b00010;
    b <= 5'b00010;
    
    repeat (1) @(posedge clk);
    
    a <= 5'b01010;
    b <= 5'b01010;
    
    repeat (1) @(posedge clk);
    
    @(negedge clk) begin
        if ((z[1] == z[2]) || (z[3] == z[4]))
            $display("ERROR: not DR 1");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 1");
    end
    
    repeat (3) @(posedge clk);
    
       
    // reset  
    prch <= 2'b11;    

    r <= 6'b000000;
    
    a <= 5'b00000;
    b <= 5'b00000;

    repeat (1) @(posedge clk); 
    
    if (z[4:1] != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // Case 2:
    prch <= 2'b10;

    r <= 6'b001010;
    
    a <= 5'b00000;
    b <= 5'b00000;
    
    repeat (1) @(posedge clk);  

    prch <= 2'b00;

    r <= 6'b101010;

    a <= 5'b00010;
    b <= 5'b00100;
    
    repeat (1) @(posedge clk);
    
    a <= 5'b10010;
    b <= 5'b01100;
    
    repeat (1) @(posedge clk);
    
    @(negedge clk) begin
        if ((z[1] == z[2]) || (z[3] == z[4]))
            $display("ERROR: not DR 2");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 2");
    end
    
    repeat (3) @(posedge clk);


    // reset  
    prch <= 2'b11;    

    r <= 6'b000000;
    
    a <= 5'b00000;
    b <= 5'b00000;
    
    repeat (1) @(posedge clk); 
    
    if (z[4:1] != 0)
        $display("ERROR: not properly pre-charged");
        

    // Case 3:
    prch <= 2'b10;

    r <= 6'b000110;
    
    a <= 5'b00000;
    b <= 5'b00000;
    
    repeat (1) @(posedge clk);
        
    prch <= 2'b00;
    
    r <= 6'b010110;
    
    a <= 5'b00100;
    b <= 5'b00100;
    
    repeat (1) @(posedge clk);
    
    a <= 5'b01100;
    b <= 5'b01100;
    
    repeat (1) @(posedge clk);
    
    @(negedge clk) begin
        if ((z[1] == z[2]) || (z[3] == z[4]))
            $display("ERROR: not DR 3");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 3");
    end
    
    repeat (3) @(posedge clk);


    // reset  
    prch <= 2'b11;    

    r <= 6'b000000;
    
    a <= 5'b00000;
    b <= 5'b00000;

    repeat (1) @(posedge clk); 
    
    if (z[4:1] != 0)
        $display("ERROR: not properly pre-charged");


    // Case 4:
    prch <= 2'b10;

    r <= 6'b000110;
    
    a <= 5'b00000;
    b <= 5'b00000;
    
    repeat (1) @(posedge clk);
        
    prch <= 2'b00;

    r <= 6'b100110;
    
    a <= 5'b00010;
    b <= 5'b00010;
    
    repeat (1) @(posedge clk);
    
    a <= 5'b10010;
    b <= 5'b10010;
    
    repeat (1) @(posedge clk);
    
    @(negedge clk) begin
        if ((z[1] == z[2]) || (z[3] == z[4]))
            $display("ERROR: not DR 4");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 4");
    end
    
    repeat (3) @(posedge clk);


    // reset  
    prch <= 2'b11;    

    r <= 6'b000000;
    
    a <= 5'b00000;
    b <= 5'b00000;
    
    repeat (1) @(posedge clk); 
    
    if (z[4:1] != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // Case 5:
    prch <= 2'b10;

    r <= 6'b001001;
    
    a <= 5'b00001;
    b <= 5'b00001;
    
    repeat (1) @(posedge clk);
        
    prch <= 2'b00;

    r <= 6'b101001;
    
    a <= 5'b00011;
    b <= 5'b00011;
    
    repeat (1) @(posedge clk);
    
    a <= 5'b01011;
    b <= 5'b01011;
    
    repeat (1) @(posedge clk);
    
    @(negedge clk) begin
        if ((z[1] == z[2]) || (z[3] == z[4]))
            $display("ERROR: not DR 5");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 5");
    end
    
    repeat (3) @(posedge clk);

    // reset  
    prch <= 2'b11;    

    r <= 6'b000000;
    
    a <= 5'b00000;
    b <= 5'b00000;

    repeat (3) @(posedge clk); 
    
    if (z[4:1] != 0)
        $display("ERROR: not properly pre-charged");
    
    
    
     // Case 6:
    prch <= 2'b10;

    r <= 6'b000110;
    
    a <= 5'b00001;
    b <= 5'b00001;
    
    repeat (1) @(posedge clk);
        
    prch <= 2'b00;

    r <= 6'b010110;
    
    a <= 5'b00101;
    b <= 5'b00101;
    
    repeat (1) @(posedge clk);
    
    a <= 5'b10101;
    b <= 5'b10101;
    
    repeat (1) @(posedge clk);

    @(negedge clk) begin
        if ((z[1] == z[2]) || (z[3] == z[4]))
            $display("ERROR: not DR 6");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 6");
    end

    repeat (3) @(posedge clk);

    $finish;

end
endmodule


