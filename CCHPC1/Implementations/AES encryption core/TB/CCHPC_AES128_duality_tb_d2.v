`timescale 1ps/1ps
module AES_CCHPC_pipeline_d2_tb;

  reg clk;
  reg rst;

  wire [4079:0] r;          // (..., r1t, r0f, r0t)
  reg  [ 639:0] plaintext;  // CCHPC representation
  reg  [ 639:0] key;        //
  wire [ 639:0] ciphertext; //
  wire [   2:0] done;       // for each layer

  reg [2399:0] r_gen; // generated fresh randomness

  reg  [127:0] plaintext_const;  // plaintext (unshared)
  reg  [127:0] key_const;        // key (unshared)
  reg  [127:0] ciphertext_const; // ciphertext (unshared)
  
  reg  [255:0] plaintext_rand; // input sharing randomness
  reg  [255:0] key_rand;       //
  
  wire [ 639:0] plaintext_in; // share construction in CCHPC representation
  wire [ 639:0] key_in;       //

  wire [127:0] ciphertext_layer0;       // preserve ciphertext shares
  wire [127:0] ciphertext_layer1;       //
  wire [127:0] ciphertext_layer2;       //
  reg  [127:0] ciphertext_layer0_reg0;  //
  reg  [127:0] ciphertext_layer1_reg0;  //
  reg  [127:0] ciphertext_layer0_reg1;  //
  
  wire [127:0] ciphertext_out; // computed unshared output

  // io index mapping
  genvar i;
  generate
    for (i=0; i < 128; i=i+1) begin : loog_gen_store_layer_
        
        // input
        assign plaintext_in[5*i  ] =  plaintext_rand[i];
        assign plaintext_in[5*i+1] =  plaintext_rand[i+128];
        assign plaintext_in[5*i+2] = ~plaintext_in[5*i+1];
        assign plaintext_in[5*i+3] =  plaintext_const[i] ^ plaintext_rand[i] ^ plaintext_rand[i+128];
        assign plaintext_in[5*i+4] = ~plaintext_in[5*i+3];

        assign key_in[5*i  ]       =  key_rand[i];
        assign key_in[5*i+1]       =  key_rand[i+128];
        assign key_in[5*i+2]       = ~key_in[5*i+1];
        assign key_in[5*i+3]       =  key_const[i] ^ key_rand[i] ^ key_rand[i+128];
        assign key_in[5*i+4]       = ~key_in[5*i+3];
        
        // output
        assign ciphertext_layer0[i] = ciphertext[5*i  ];
        assign ciphertext_layer1[i] = ciphertext[5*i+1];
        assign ciphertext_layer2[i] = ciphertext[5*i+3];
        
        // unshared output
        assign ciphertext_out[i] = ciphertext_layer0_reg1[i] ^ ciphertext_layer1_reg0[i] ^ ciphertext_layer2[i];
    
    end
    
  endgenerate

  // save layer outputs in sequential clock cycles 
  always @(posedge clk)
  begin
  
    ciphertext_layer0_reg0 <= ciphertext_layer0;
    ciphertext_layer1_reg0 <= ciphertext_layer1;
    
    ciphertext_layer0_reg1 <= ciphertext_layer0_reg0;
    
  end
  
  // permanent PRNG
  always @(posedge clk)
  begin
  
    r_gen <= { $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random() & 24'hffffff };
    
  end
  
  // generate dual-rail representation of fresh randomness  
  generate
    for (i = 0; i < 2040; i = i+1) begin
        assign r[2*i]   =  r_gen[i];
        assign r[2*i+1] = ~r_gen[i];
    end
  endgenerate
  
  
  AES_CCHPC_Pipeline #(.security_order(2)) DUT (

      .clk(clk),
      .rst(rst),
      .r(r),
      .plaintext(plaintext),
      .key(key),
      .ciphertext(ciphertext),
      .done(done)

  );

always #5000 clk = (clk === 1'b0);

initial begin

    // provided inputs
    plaintext_const  <= 'h3243f6a8885a308d313198a2e0370734;
    plaintext_rand  <= { $random($time), $random(), $random(), $random(), $random(), $random(), $random(), $random() };
    key_const        <= 'h2b7e151628aed2a6abf7158809cf4f3c;
    key_rand        <= { $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random() };

    // expected output
    ciphertext_const <= 'h3925841d02dc09fbdc118597196a0b32;

    // reset
    rst       <= 1'b1;
    
    plaintext <= 'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    key       <= 'h0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

    repeat (3) @(posedge clk);
    
    if (ciphertext != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // set inputs
    plaintext <= plaintext_in;
    key       <= key_in;
    
    // start
    rst       <= 1'b0;

    @(posedge done[2]) begin
        @(negedge clk) begin
    
            if (ciphertext_out == ciphertext_const) begin
                $write("------------------PASS---------------\n");
            end
            else begin
                $write("\------------------FAIL---------------\n");
            end
            
        end
    end
    
    repeat (1) @(posedge clk);

    $finish;

end
endmodule