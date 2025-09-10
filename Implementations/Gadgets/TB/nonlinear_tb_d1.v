`timescale 1ps/1ps
module nonlinear_tb_order1;

  reg CLK;

  
  reg prch;
  reg  [1:0] r; // (r0f, r0t)
  reg  [2:0] a; // (a1f, a1t, a0)
  reg  [2:0] b;
  wire [2:0] z;


  nonlinear_CCHPC_wNAND #(.security_order(1), .insert_registers(1), .CONF(2'b00)) DUT (

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
    prch <= 1'b1;
    
    r <= 2'b00;
    
    a <= 3'b000;
    b <= 3'b000;
    
    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // Case 0:
    r <= 2'b01;

    a <= 3'b101;
    b <= 3'b101;
    
    repeat (1) @(posedge CLK);
    
    prch <= 1'b0;
    
    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if (z[1] == z[2])
            $display("ERROR: not DR 0");
        if ((z[0] ^ z[1]) != ((a[0] ^ a[1]) & (b[0] ^ b[1])))
            $display("ERROR: wrong result 0");
    end

    repeat (1) @(posedge CLK);
    
    
    // reset
    prch <= 1'b1;
    
    r <= 2'b00;
    
    a <= 3'b000;
    b <= 3'b000;
    
    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");


    // Case 1:
    r <= 2'b10;

    a <= 3'b101;
    b <= 3'b101;
    
    repeat (1) @(posedge CLK);
    
    prch <= 1'b0;
    
    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if (z[1] == z[2])
            $display("ERROR: not DR 1");
        if ((z[0] ^ z[1]) != ((a[0] ^ a[1]) & (b[0] ^ b[1])))
            $display("ERROR: wrong result 1");
    end

    repeat (1) @(posedge CLK);
    
    
    // reset
    prch <= 1'b1;
    
    r <= 2'b00;
    
    a <= 3'b000;
    b <= 3'b000;
    
    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");


    // Case 2:
    r <= 2'b10;

    a <= 3'b011;
    b <= 3'b101;
    
    repeat (1) @(posedge CLK);
    
    prch <= 1'b0;

    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if (z[1] == z[2])
            $display("ERROR: not DR 2");
        if ((z[0] ^ z[1]) != ((a[0] ^ a[1]) & (b[0] ^ b[1])))
            $display("ERROR: wrong result 2");
    end

    repeat (1) @(posedge CLK);


    // reset
    prch <= 1'b1;
    
    r <= 2'b00;
    
    a <= 3'b000;
    b <= 3'b000;
    
    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");


    // Case 3:
    r <= 2'b10;

    a <= 3'b011;
    b <= 3'b011;
    
    repeat (1) @(posedge CLK);
    
    prch <= 1'b0;

    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if (z[1] == z[2])
            $display("ERROR: not DR 3");
        if ((z[0] ^ z[1]) != ((a[0] ^ a[1]) & (b[0] ^ b[1])))
            $display("ERROR: wrong result 3");
    end

    repeat (1) @(posedge CLK);


    // reset
    prch <= 1'b1;
    
    r <= 2'b00;
    
    a <= 3'b000;
    b <= 3'b000;
    
    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");

    
    // Case 4:
    r <= 2'b10;

    a <= 3'b010;
    b <= 3'b010;
    
    repeat (1) @(posedge CLK);
    
    prch <= 1'b0;

    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if (z[1] == z[2])
            $display("ERROR: not DR 4");
        if ((z[0] ^ z[1]) != ((a[0] ^ a[1]) & (b[0] ^ b[1])))
            $display("ERROR: wrong result 4");
    end

    repeat (1) @(posedge CLK);


    // reset
    prch <= 1'b1;
    
    r <= 2'b00;
    
    a <= 3'b000;
    b <= 3'b000;
    
    repeat (1) @(posedge CLK); 
    
    if (z != 0)
        $display("ERROR: not properly pre-charged");


    // Case 5:
    r <= 2'b01;

    a <= 3'b010;
    b <= 3'b010;
    
    repeat (1) @(posedge CLK);
    
    prch <= 1'b0;

    repeat (1) @(posedge CLK);

    @(negedge CLK) begin
        if (z[1] == z[2])
            $display("ERROR: not DR 5");
        if ((z[0] ^ z[1]) != ((a[0] ^ a[1]) & (b[0] ^ b[1])))
            $display("ERROR: wrong result 5");
    end

    repeat (1) @(posedge CLK);

    $finish;

end
endmodule


