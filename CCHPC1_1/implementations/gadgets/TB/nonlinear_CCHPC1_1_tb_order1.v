`timescale 1ps/1ps
module CCHPC1_1_tb_order1;

  reg clk;
  reg [0:0] prch;

  reg  [0:0] r;
  reg  [2:0] a;
  reg  [2:0] b;
  wire [2:0] z;
  
  reg       z_layer0_step0;

  always @(posedge clk)
  begin
    z_layer0_step0 <= z[0];
  end
  
  wire a_provided;
  wire b_provided;
  wire z_expected;
  wire z_computed;

  assign a_provided = a[0] ^ a[1];
  assign b_provided = b[0] ^ b[1];
  assign z_expected = a_provided & b_provided;
  
  assign z_computed = z_layer0_step0 ^ z[1];

  nonlinear_CCHPC1_1_DRtDR_order1 #(.CONF(2'b00)) DUT (

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
    prch <= 1'b1;

    r <= 1'b0;
    
    a <= 3'b000;
    b <= 3'b000;

    repeat (3) @(posedge clk); 
    
    if (z[2:1] != 0)
        $display("ERROR: not properly pre-charged");
    
    
    
    // Case 0:
    prch <= 1'b0;

    r <= 1'b0;
    
    a <= 3'b001;
    b <= 3'b001;
    
    repeat (1) @(posedge clk);
    
    a <= 3'b101;
    b <= 3'b011;
    
    repeat (1) @(posedge clk);

    @(negedge clk) begin
        if (z[1] == z[2])
            $display("ERROR: not DR 0");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 0");
    end

    repeat (3) @(posedge clk);
    
    
    // reset  
    prch <= 1'b1;    

    r <= 1'b0;

    a <= 3'b000;
    b <= 3'b000;

    repeat (3) @(posedge clk); 
    
    if (z[2:1] != 0)
        $display("ERROR: not properly pre-charged");


    // Case 1:
    prch <= 1'b0;

    r <= 6'b1;

    a <= 3'b000;
    b <= 3'b000;

    repeat (1) @(posedge clk);
    
    a <= 5'b010;
    b <= 5'b010;
    
    repeat (1) @(posedge clk);
    
    @(negedge clk) begin
        if (z[1] == z[2])
            $display("ERROR: not DR 1");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 1");
    end
    
    repeat (3) @(posedge clk);
    
       
    // reset  
    prch <= 1'b1;    

    r <= 1'b0;

    a <= 3'b000;
    b <= 3'b000;

    repeat (3) @(posedge clk); 
    
    if (z[2:1] != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // Case 2:
    prch <= 1'b0;

    r <= 1'b0;
    
    a <= 3'b000;
    b <= 3'b000;
    
    repeat (1) @(posedge clk);
    
    a <= 3'b010;
    b <= 3'b100;
    
    repeat (1) @(posedge clk);
    
    @(negedge clk) begin
        if (z[1] == z[2])
            $display("ERROR: not DR 2");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 2");
    end
    
    repeat (3) @(posedge clk);


    // reset  
    prch <= 1'b1;    
    
    r <= 1'b0;

    a <= 3'b000;
    b <= 3'b000;

    repeat (3) @(posedge clk); 
    
    if (z[2:1] != 0)
        $display("ERROR: not properly pre-charged");
        

    // Case 3:
    prch <= 1'b0;

    r <= 1'b1;
    
    a <= 3'b000;
    b <= 3'b000;
    
    repeat (1) @(posedge clk);
    
    a <= 3'b100;
    b <= 3'b100;
    
    repeat (1) @(posedge clk);
    
    @(negedge clk) begin
        if (z[1] == z[2])
            $display("ERROR: not DR 3");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 3");
    end
    
    repeat (3) @(posedge clk);


    // reset  
    prch <= 1'b1;    
    
    r <= 1'b0;

    a <= 3'b000;
    b <= 3'b000;

    repeat (3) @(posedge clk); 
    
    if (z[2:1] != 0)
        $display("ERROR: not properly pre-charged");


    // Case 4:
    prch <= 1'b0;

    r <= 6'b0;
    
    a <= 3'b001;
    b <= 3'b001;
    
    repeat (1) @(posedge clk);
    
    a <= 3'b011;
    b <= 3'b011;
    
    repeat (1) @(posedge clk);
    
    @(negedge clk) begin
        if (z[1] == z[2])
            $display("ERROR: not DR 4");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 4");
    end
    
    repeat (3) @(posedge clk);


    // reset
    prch <= 1'b1;    

    r <= 1'b0;

    a <= 3'b000;
    b <= 3'b000;

    repeat (3) @(posedge clk); 
    
    if (z[2:1] != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // Case 5:
    prch <= 1'b0;

    r <= 1'b1;
    
    a <= 3'b001;
    b <= 3'b001;
    
    repeat (1) @(posedge clk);
    
    a <= 3'b011;
    b <= 3'b101;
    
    repeat (1) @(posedge clk);
    
    @(negedge clk) begin
        if (z[1] == z[2])
            $display("ERROR: not DR 5");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 5");
    end
    
    repeat (3) @(posedge clk);



    // reset  
    prch <= 1'b1;    
    
    r <= 1'b0;

    a <= 3'b000;
    b <= 3'b000;

    repeat (3) @(posedge clk); 
    
    if (z[2:1] != 0)
        $display("ERROR: not properly pre-charged");
    
    
    
     // Case 6:
    prch <= 1'b0;

    r <= 1'b0;
    
    a <= 3'b001;
    b <= 3'b001;
    
    repeat (1) @(posedge clk);
    
    a <= 3'b101;
    b <= 3'b101;
    
    repeat (1) @(posedge clk);

    @(negedge clk) begin
        if (z[1] == z[2])
            $display("ERROR: not DR 6");
        if (z_computed != z_expected)
            $display("ERROR: wrong result 6");
    end

    repeat (3) @(posedge clk);

    $finish;

end
endmodule


