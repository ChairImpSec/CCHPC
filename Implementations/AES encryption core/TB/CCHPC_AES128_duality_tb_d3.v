`timescale 1ps/1ps
module AES_CCHPC_pipeline_d3_tb;

  reg clk;
  reg rst;

  wire [8159:0] r;          // (..., r1t, r0f, r0t)
  reg  [ 895:0] plaintext;  // CCHPC representation
  reg  [ 895:0] key;        //
  wire [ 895:0] ciphertext; //
  wire [   3:0] done;       // for each layer
  
  reg [4079:0] r_gen; // generated fresh randomness
  
  reg  [127:0] plaintext_const;  // plaintext (unshared)
  reg  [127:0] key_const;        // key (unshared)
  reg  [127:0] ciphertext_const; // ciphertext (unshared)
  
  reg  [383:0] plaintext_rand; // input sharing randomness
  reg  [383:0] key_rand;       //
  
  wire [ 895:0] plaintext_in; // share construction in CCHPC representation
  wire [ 895:0] key_in;       //

  wire [127:0] ciphertext_layer0;       // preserve ciphertext shares
  wire [127:0] ciphertext_layer1;       //
  wire [127:0] ciphertext_layer2;       //
  wire [127:0] ciphertext_layer3;       //
  reg  [127:0] ciphertext_layer0_reg0;  //
  reg  [127:0] ciphertext_layer1_reg0;  //
  reg  [127:0] ciphertext_layer2_reg0;  //
  reg  [127:0] ciphertext_layer0_reg1;  //
  reg  [127:0] ciphertext_layer1_reg1;  //
  reg  [127:0] ciphertext_layer0_reg2;  //
  
  wire [127:0] ciphertext_out; // computed unshared output

  // io index mapping
  genvar i;
  generate
    for (i=0; i < 128; i=i+1) begin : loog_gen_store_layer_
        
        // input
        assign plaintext_in[7*i  ] =  plaintext_rand[i];
        assign plaintext_in[7*i+1] =  plaintext_rand[i+128];
        assign plaintext_in[7*i+2] = ~plaintext_in[7*i+1];
        assign plaintext_in[7*i+3] =  plaintext_rand[i+256];
        assign plaintext_in[7*i+4] = ~plaintext_in[7*i+3];
        assign plaintext_in[7*i+5] =  plaintext_const[i] ^ plaintext_rand[i] ^ plaintext_rand[i+128] ^ plaintext_rand[i+256];
        assign plaintext_in[7*i+6] = ~plaintext_in[7*i+5];

        assign key_in[7*i  ]       =  key_rand[i];
        assign key_in[7*i+1]       =  key_rand[i+128];
        assign key_in[7*i+2]       = ~key_in[7*i+1];
        assign key_in[7*i+3]       =  key_rand[i+256];
        assign key_in[7*i+4]       = ~key_in[7*i+3];
        assign key_in[7*i+5]       =  key_const[i] ^ key_rand[i] ^ key_rand[i+128] ^ key_rand[i+256];
        assign key_in[7*i+6]       = ~key_in[7*i+5];

        // output
        assign ciphertext_layer0[i] = ciphertext[7*i  ];
        assign ciphertext_layer1[i] = ciphertext[7*i+1];
        assign ciphertext_layer2[i] = ciphertext[7*i+3];
        assign ciphertext_layer3[i] = ciphertext[7*i+5];

        // unshared output
        assign ciphertext_out[i] = ciphertext_layer0_reg2[i] ^ ciphertext_layer1_reg1[i] ^ ciphertext_layer2_reg0[i] ^ ciphertext_layer3[i];
    
    end
    
  endgenerate

  // save layer outputs in sequential clock cycles 
  always @(posedge clk)
  begin
  
    ciphertext_layer0_reg0 <= ciphertext_layer0;
    ciphertext_layer1_reg0 <= ciphertext_layer1;
    ciphertext_layer2_reg0 <= ciphertext_layer2;
    
    ciphertext_layer0_reg1 <= ciphertext_layer0_reg0;
    ciphertext_layer1_reg1 <= ciphertext_layer1_reg0;

    ciphertext_layer0_reg2 <= ciphertext_layer0_reg1;
    
  end
  
  // permanent PRNG
  always @(posedge clk)
  begin
  
    r_gen <= { $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random() & 16'hffff };
    
  end
  
  // generate dual-rail representation of fresh randomness  
  generate
    for (i = 0; i < 4080; i = i+1) begin
        assign r[2*i]   =  r_gen[i];
        assign r[2*i+1] = ~r_gen[i];
    end
  endgenerate
  
  
  AES_CCHPC_Pipeline #(.security_order(3)) DUT (

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
     plaintext_rand  <= { $random($time), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random() };
     key_const        <= 'h2b7e151628aed2a6abf7158809cf4f3c;
     key_rand        <= { $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random() };

     // expected output
     ciphertext_const <= 'h3925841d02dc09fbdc118597196a0b32;

    // reset
    rst       <= 1'b1;
    
    plaintext <= 'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    key       <= 'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

    repeat (3) @(posedge clk);
    
    if (ciphertext != 0)
        $display("ERROR: not properly pre-charged");
        
    
    // set inputs
    plaintext <= plaintext_in;
    key       <= key_in;
    
    // start
    rst       <= 1'b0;

    @(posedge done[3]) begin
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