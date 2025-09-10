`timescale 1ps/1ps
module AES_CCHPC_pipeline_d1_tb;

  reg clk;
  reg rst;

  wire [1359:0] r;          // (..., r1t, r0f, r0t)
  reg  [ 383:0] plaintext;  // CCHPC representation
  reg  [ 383:0] key;        // 
  wire [ 383:0] ciphertext; // 
  wire [   1:0] done;       // for both layers

  reg [679:0] r_gen; // generated fresh randomness

  reg  [127:0] plaintext_const;  // plaintext (unshared)
  reg  [127:0] key_const;        // key (unshared)
  reg  [127:0] ciphertext_const; // ciphertext (unshared)
  
  reg  [127:0] plaintext_rand; // input sharing randomness
  reg  [127:0] key_rand;       //
  
  wire [ 383:0] plaintext_in; // share construction in CCHPC representation
  wire [ 383:0] key_in;       // 

  wire [127:0] ciphertext_layer0;     // preserve ciphertext share 0
  reg  [127:0] ciphertext_layer0_reg; // 
  
  wire [127:0] ciphertext_out; // computed unshared output

  // io index mapping
  genvar i;
  generate
    for (i=0; i < 128; i=i+1) begin : loog_gen_store_layer0_
        
        // input
        assign plaintext_in[3*i  ] =  plaintext_rand[i];
        assign plaintext_in[3*i+1] =  plaintext_const[i] ^ plaintext_rand[i];
        assign plaintext_in[3*i+2] = ~plaintext_in[3*i+1];
        
        assign key_in[3*i  ]       =  key_rand[i];
        assign key_in[3*i+1]       =  key_const[i] ^ key_rand[i];
        assign key_in[3*i+2]       = ~key_in[3*i+1];
        
        // output
        assign ciphertext_layer0[i] = ciphertext[3*i];
        
        // unshared output
        assign ciphertext_out[i] = ciphertext_layer0_reg[i] ^ ciphertext[3*i+1];
    
    end
  endgenerate

  // save layer l=0 output as layer l=1 output is available with one clock cycle offset
  always @(posedge clk)
  begin
  
    ciphertext_layer0_reg <= ciphertext_layer0;
    
  end

  // permanent PRNG
  always @(posedge clk)
  begin
  
    r_gen <= { $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random(), $random() & 8'hff };
    
  end
  
  // generate dual-rail representation of fresh randomness  
  generate
    for (i = 0; i < 680; i = i+1) begin
        assign r[2*i]   =  r_gen[i];
        assign r[2*i+1] = ~r_gen[i];
    end
  endgenerate
  
  
  // DUT
  AES_CCHPC_Pipeline #(.security_order(1)) DUT (

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
    plaintext_const <= 'h6a9cc93a35dc6dea69309bfd04340aa8;
    plaintext_rand  <= { $random($time), $random(), $random(), $random() };
    key_const       <= 'hea73d8c3f2d3eecf763f0a7a3a4131a8;
    key_rand        <= { $random(), $random(), $random(), $random() };
    
    // expected output
    ciphertext_const <= 'h5e8dd52066095b94954bbcfcfc4200d5;


    // reset
    rst       <= 1'b1;
    
    plaintext <= 'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    key       <= 'h000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;

    repeat (3) @(posedge clk);
    
    if (ciphertext != 0)
        $display("ERROR: not properly pre-charged");
    
    
    // set inputs
    plaintext <= plaintext_in;
    key       <= key_in;

    // start
    rst <= 1'b0;

    @(posedge done[1]) begin
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