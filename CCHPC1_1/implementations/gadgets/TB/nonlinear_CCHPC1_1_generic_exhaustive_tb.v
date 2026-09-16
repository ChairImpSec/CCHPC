`timescale 1ps/1ps

/*
* Exhaustive functional testbench for the generic nonlinear CCHPC1.1 gadget.
*
* For the selected security order, all combinations of the two masked input
* variables and fresh randomness are tested. The selected DUT is exercised
* layer by layer using the CCHPC execution sequence.
*
* The testbench checks:
*   - initial pre-charge of dual-rail outputs,
*   - complementary encoding of evaluated dual-rail output pairs, and
*   - functional correctness after recombining all output shares.
*
* Both regular and duality variants, DRtDR and DRtSR outputs, internally or
* externally pre-charged randomness, and the available implementation options
* can be selected through the parameters below. For duality, only one instance
* is evaluated while the other remains pre-charged.
*
* For functional testing, externally provided dual-rail randomness is generated
* combinationally as complementary rails. In a secure DRP implementation these
* random inputs must be properly pre-charged and aligned with the evaluation
* phases of the duality instances. This testbench verifies functionality, not
* probing security or physical leakage behavior.
*/

module nonlinear_CCHPC1_1_generic_exhaustive_tb;

  // --------------------------------------------------------------------------
  // Configuration
  // --------------------------------------------------------------------------
  parameter security_order = 1;
  parameter CONF           = 2'b00;   // Gadget and testbench function configuration:
                                      //    2'b00: AND
                                      //    2'b01: NAND
                                      //    2'b10: NOR
                                      //    2'b11: OR
  parameter DUALITY        = 0;				// 0: regular DUT, 1: duality DUT

  // other options
  parameter OUT_DR          = 1;  // produce dual-rail outputs in layer l > 0, i.e., DRtDR or DRtSR
  parameter FORWARD_R       = 0;  // 0: paper construction, 1: forward each non-final layer result into the next layer's last MTG random input
  parameter wAOI22          = 0;  // enables the use of more efficient AOI22 cells in DRP logic (only for nonlinear gadgets: could cause leakage when mapped on LUTs)
  parameter wRandCONV       = 0;  // 1 uses internal randomness conversion, 0 uses externally provided dual-rail randomness (only relevant for DRtDR variants)
  parameter RAND_REG        = 0;  // used by *_wRandCONV and *_DRtSR variants, ensures all fresh randomness crosses a register, which might be required by the PRNG source (e.g., Trivium)
  parameter OPT_PRCH        = 0;  // potential area improvements by adding pre-charge of true rail data with negated pre-charge control signals
  parameter PRCHN_PROVIDED  = 0;  // externally provide negated pre-charge signals
  
  // --------------------------------------------------------------------------
  localparam d              				= security_order+1;           // number of shares
  localparam RAND_COUNT             = (d*(d-1))/2;                // random bits required by gadget definition
  localparam RAND_COUNT_CONSEC      = ((d-1)*(d-2))/2;           	// random bits required by DRP layers
  localparam RAND_COUNT_CONSEC_SAFE = (RAND_COUNT_CONSEC > 0) ?		// dummy port width in first-order as no dual-rail randomness required
																			 RAND_COUNT_CONSEC : 1;			
  localparam NUM_TESTS      				= (1 << (RAND_COUNT+2*d));    // number of exhaustive test cases is determined by randomness and share input count for both variables
  localparam RAIL_FACTOR    				= (OUT_DR == 1) ? 2 : 1;      
  localparam SHARING_WIDTH  				= 2*d-1;                      // CCHPC representation: share 0 in single-rail, other shares dual-rail
  localparam OUTPUT_WIDTH   				= RAIL_FACTOR*(d-1)+1;        // output representation depends on OUT_DR


  reg clk;
  reg [security_order-1:0]  prch;   // each DRP layer requires one pre-charge control signal
  wire [security_order-1:0] prch_n;
  
  assign prch_n = ~prch;

  reg  [SHARING_WIDTH-1:0] a;
  reg  [SHARING_WIDTH-1:0] b;
  wire [OUTPUT_WIDTH-1:0]  z;

  // Case-index layout, from LSB to MSB:
  //   test_idx[d-1:0]                = b shares
  //   test_idx[2*d-1:d]              = a shares
  //   test_idx[2*d+RAND_COUNT-1:2*d] = RAND_COUNT r

  integer test_idx;
  integer share_idx;
  integer layer_idx;

  integer errors_precharge;
  integer errors_evaluation;
  integer errors_correctness;


  // --------------------------------------------------------------------------
  // Fresh randomness mapping
  // --------------------------------------------------------------------------

  reg  [RAND_COUNT-1:0]    						r;
  wire [d-2:0]             						r_SR;
  wire [2*RAND_COUNT_CONSEC_SAFE-1:0] r_DR;
  wire [2*RAND_COUNT_CONSEC_SAFE-1:0] r_duality0;
  wire [2*RAND_COUNT_CONSEC_SAFE-1:0] r_duality1;

  genvar rs, rl, rm;
  generate

    // single rail random bits
    for (rs = 0; rs < (d-1); rs=rs+1) begin : gen_r_SR_
      assign r_SR[rs] = r[(rs*(rs+1))/2];
    end

		// dual-rail random bits
    if (RAND_COUNT_CONSEC > 0) begin : gen_r_DR_
      
      for (rl = 1; rl < (d-1); rl=rl+1) begin : gen_layer_
        for (rm = 0; rm < (d-1-rl); rm=rm+1) begin : gen_rand_

          localparam integer SRC = ((rl+rm)*(rl+rm+1))/2 + rl;
          localparam integer DST = ((rl-1)*(2*d-rl-2))/2 + rm;

          assign r_DR[2*DST]   = prch[rl-1] ? 1'b0 :  r[SRC];
          assign r_DR[2*DST+1] = prch[rl-1] ? 1'b0 : ~r[SRC];

        end
      end

    end else begin : gen_first_order_

      // No dual-rail randomness for first-order necessary, r_DR is dummy
      assign r_DR = 2'b00;

    end

  endgenerate

  assign r_duality0 = r_DR;
  assign r_duality1 = {2*RAND_COUNT_CONSEC_SAFE{1'b0}};

  // Generated randomness is explicitly consumed independent of configuration
  wire unused_randomness;
  assign unused_randomness = ^{r_SR, r_DR, r_duality0, r_duality1};


  // --------------------------------------------------------------------------
  // Unmasked input/output
  // --------------------------------------------------------------------------
  reg  a_provided;
  reg  b_provided;
  reg  z_computed;
  wire z_expected;

  always @(*) begin
    a_provided = a[0];
    b_provided = b[0];
    z_computed = z[0];
    for (share_idx = 1; share_idx < d; share_idx = share_idx + 1) begin
      a_provided = a_provided ^ a[2*share_idx-1];
      b_provided = b_provided ^ b[2*share_idx-1];

      // Output depends on OUT_DR
      if (OUT_DR == 1)
        z_computed = z_computed ^ z[2*share_idx-1];
      else
        z_computed = z_computed ^ z[share_idx];
    end
  end

  assign z_expected = ((a_provided ^ CONF[1]) & (b_provided ^ CONF[1])) ^ CONF[0];  // De-Morgan to alternate functionality


  // --------------------------------------------------------------------------
  // DUT
  // --------------------------------------------------------------------------
  generate

    if ((DUALITY == 0) && (OUT_DR == 1) && (wRandCONV == 1)) begin : gen_regular_DRtDR_wRandCONV_

      nonlinear_CCHPC1_1_generic_DRtDR_wRandCONV #(
          .security_order(security_order),
          .CONF(CONF),
          .FORWARD_R(FORWARD_R),
          .wAOI22(wAOI22),
          .OPT_PRCH(OPT_PRCH),
          .RAND_REG(RAND_REG),
          .ALIGN_OUT(0)
      ) DUT (
          .clk(clk),
          .prch(prch),
          .a(a),
          .b(b),
          .r_SR(r),
          .z(z)
      );

    end else if ((DUALITY == 0) && (OUT_DR == 1)) begin : gen_regular_DRtDR_

      nonlinear_CCHPC1_1_generic_DRtDR #(
          .security_order(security_order),
          .CONF(CONF),
          .FORWARD_R(FORWARD_R),
          .wAOI22(wAOI22),
          .OPT_PRCH(OPT_PRCH),
          .ALIGN_OUT(0)
      ) DUT (
          .clk(clk),
          .prch(prch),
          .a(a),
          .b(b),
          .r_SR(r_SR),
          .r_DR(r_DR),
          .z(z)
      );

    end else if (DUALITY == 0) begin : gen_regular_DRtSR_

      nonlinear_CCHPC1_1_generic_DRtSR #(
          .security_order(security_order),
          .CONF(CONF),
          .FORWARD_R(FORWARD_R),
          .wAOI22(wAOI22),
          .RAND_REG(RAND_REG),
          .ALIGN_OUT(0)
      ) DUT (
          .clk(clk),
          .prch(prch),
          .a(a),
          .b(b),
          .r_SR(r),
          .z_SR(z)
      );

    end else if ((OUT_DR == 1) && (OPT_PRCH == 1) && (PRCHN_PROVIDED == 1) && (wRandCONV == 1)) begin : gen_duality_DRtDR_wRandCONV_wPRCHn_

      // This testbench only uses duality instance 0.
      // Instance 1 stays permanently precharged.
      nonlinear_CCHPC1_1_generic_DRtDR_duality_wRandCONV_wPRCHn #(
          .security_order(security_order),
          .CONF(CONF),
          .FORWARD_R(FORWARD_R),
          .wAOI22(wAOI22),
          .OPT_PRCH(OPT_PRCH),
          .RAND_REG(RAND_REG),
          .ALIGN_OUT(0)
      ) DUT (
          .clk(clk),
          .prch0(prch),
          .prch1({security_order{1'b1}}),
          .prch0_n(prch_n),
          .prch1_n({security_order{1'b0}}),
          .a_layer0(a[0]),
          .a_duality0(a[SHARING_WIDTH-1:1]),
          .a_duality1({2*(d-1){1'b0}}),
          .b_layer0(b[0]),
          .b_duality0(b[SHARING_WIDTH-1:1]),
          .b_duality1({2*(d-1){1'b0}}),
          .r_SR(r),
          .z_layer0(z[0]),
          .z_duality0(z[OUTPUT_WIDTH-1:1]),
          .z_duality1()
      );

    end else if ((OUT_DR == 1) && (OPT_PRCH == 1) && (PRCHN_PROVIDED == 1)) begin : gen_duality_DRtDR_wPRCHn_

      // This testbench only uses duality instance 0.
      // Instance 1 stays permanently precharged.
      nonlinear_CCHPC1_1_generic_DRtDR_duality_wPRCHn #(
          .security_order(security_order),
          .CONF(CONF),
          .FORWARD_R(FORWARD_R),
          .wAOI22(wAOI22),
          .OPT_PRCH(OPT_PRCH),
          .ALIGN_OUT(0)
      ) DUT (
          .clk(clk),
          .prch0(prch),
          .prch1({security_order{1'b1}}),
          .prch0_n(prch_n),
          .prch1_n({security_order{1'b0}}),
          .a_layer0(a[0]),
          .a_duality0(a[SHARING_WIDTH-1:1]),
          .a_duality1({2*(d-1){1'b0}}),
          .b_layer0(b[0]),
          .b_duality0(b[SHARING_WIDTH-1:1]),
          .b_duality1({2*(d-1){1'b0}}),
          .r_SR(r_SR),
          .r_duality0(r_duality0),
          .r_duality1(r_duality1),
          .z_layer0(z[0]),
          .z_duality0(z[OUTPUT_WIDTH-1:1]),
          .z_duality1()
      );

    end else if ((OUT_DR == 1) && (wRandCONV == 1)) begin : gen_duality_DRtDR_wRandCONV_

      // This testbench only uses duality instance 0.
      // Instance 1 stays permanently precharged.
      nonlinear_CCHPC1_1_generic_DRtDR_duality_wRandCONV #(
          .security_order(security_order),
          .CONF(CONF),
          .FORWARD_R(FORWARD_R),
          .wAOI22(wAOI22),
          .OPT_PRCH(OPT_PRCH),
          .RAND_REG(RAND_REG),
          .ALIGN_OUT(0)
      ) DUT (
          .clk(clk),
          .prch0(prch),
          .prch1({security_order{1'b1}}),
          .a_layer0(a[0]),
          .a_duality0(a[SHARING_WIDTH-1:1]),
          .a_duality1({2*(d-1){1'b0}}),
          .b_layer0(b[0]),
          .b_duality0(b[SHARING_WIDTH-1:1]),
          .b_duality1({2*(d-1){1'b0}}),
          .r_SR(r),
          .z_layer0(z[0]),
          .z_duality0(z[OUTPUT_WIDTH-1:1]),
          .z_duality1()
      );

    end else if (OUT_DR == 1) begin : gen_duality_DRtDR_

      // This testbench only uses duality instance 0.
      // Instance 1 stays permanently precharged.
      nonlinear_CCHPC1_1_generic_DRtDR_duality #(
          .security_order(security_order),
          .CONF(CONF),
          .FORWARD_R(FORWARD_R),
          .wAOI22(wAOI22),
          .OPT_PRCH(OPT_PRCH),
          .ALIGN_OUT(0)
      ) DUT (
          .clk(clk),
          .prch0(prch),
          .prch1({security_order{1'b1}}),
          .a_layer0(a[0]),
          .a_duality0(a[SHARING_WIDTH-1:1]),
          .a_duality1({2*(d-1){1'b0}}),
          .b_layer0(b[0]),
          .b_duality0(b[SHARING_WIDTH-1:1]),
          .b_duality1({2*(d-1){1'b0}}),
          .r_SR(r_SR),
          .r_duality0(r_duality0),
          .r_duality1(r_duality1),
          .z_layer0(z[0]),
          .z_duality0(z[OUTPUT_WIDTH-1:1]),
          .z_duality1()
      );

    end else begin : gen_duality_DRtSR_

      // This testbench only uses duality instance 0.
      // Instance 1 stays permanently precharged.
      nonlinear_CCHPC1_1_generic_DRtSR_duality #(
          .security_order(security_order),
          .CONF(CONF),
          .FORWARD_R(FORWARD_R),
          .wAOI22(wAOI22),
          .RAND_REG(RAND_REG),
          .ALIGN_OUT(0)
      ) DUT (
          .clk(clk),
          .prch0(prch),
          .prch1({security_order{1'b1}}),
          .a_layer0(a[0]),
          .a_duality0(a[SHARING_WIDTH-1:1]),
          .a_duality1({2*(d-1){1'b0}}),
          .b_layer0(b[0]),
          .b_duality0(b[SHARING_WIDTH-1:1]),
          .b_duality1({2*(d-1){1'b0}}),
          .r_SR(r),
          .z_SR(z)
      );

    end

  endgenerate

  always #5000 clk = (clk === 1'b0);

  // --------------------------------------------------------------------------
  // Exhaustive test
  // --------------------------------------------------------------------------

  initial begin

    errors_precharge   = 0;
    errors_evaluation  = 0;
    errors_correctness = 0;

    $display("CONFIGURATION:");
    $display("  security_order = %0d", security_order);
    case (CONF)
      2'b00: $display("  CONF           = %02b (AND)",  CONF);
      2'b01: $display("  CONF           = %02b (NAND)", CONF);
      2'b10: $display("  CONF           = %02b (NOR)",  CONF);
      2'b11: $display("  CONF           = %02b (OR)",   CONF);
    endcase
    $display("  NUM_SHARES     = %0d", d);
    $display("  RAND_COUNT     = %0d", RAND_COUNT);
    $display("  NUM_TESTS      = %0d", NUM_TESTS);
    $display("");
    $display("  DUALITY        = %s", (DUALITY == 1)        ? "yes"             : "no ");
    $display("  OUT_DR         = %s", (OUT_DR == 1)         ? "DRtDR"           : "DRtSR");
    $display("  wAOI22         = %s", (wAOI22 == 1)         ? "yes"             : "no ");
    $display("  FORWARD_R      = %s", (FORWARD_R == 1)      ? "yes"             : "no (default)");
    $display("  wRandCONV      = %s", (OUT_DR == 1) ? ((wRandCONV == 1) ? "yes" : "no ") : "n/a");
    $display("  RAND_REG       = %s", ((OUT_DR == 0) || (wRandCONV == 1)) ? ((RAND_REG == 1) ? "yes" : "no ") : "n/a");
    $display("  OPT_PRCH       = %s", (OUT_DR == 0) ? "n/a" : ((OPT_PRCH == 1) ? "yes" : "no (default)"));
    $display("  PRCHN_PROVIDED = %s", ((DUALITY == 1) && (OUT_DR == 1) && (OPT_PRCH == 1)) ? ((PRCHN_PROVIDED == 1) ? "yes" : "no (default)") :  "n/a");
    $display("");
    $display("START: exhaustive tests");

    for (test_idx = 0; test_idx < NUM_TESTS; test_idx = test_idx + 1) begin

      // ----------------------------------------------------------------------
      // Initial reset
      // ----------------------------------------------------------------------

      prch <= {security_order{1'b1}};
      a    <= {SHARING_WIDTH{1'b0}};
      b    <= {SHARING_WIDTH{1'b0}};

      // Raw randomness may be present immediately. DRtDR variants without
      // wRandCONV receive the split SR/DR representations generated above.
      r <= test_idx >> (2*d);

      @(posedge clk);

      if (OUT_DR == 1) begin
        // All dual-rail outputs must be precharged to zero.
        if (z[OUTPUT_WIDTH-1:1] !== {(OUTPUT_WIDTH-1){1'b0}}) begin
          $display("ERROR: not properly pre-charged, case %0d", test_idx);
          errors_precharge = errors_precharge + 1;
        end
      end

      // ----------------------------------------------------------------------
      // Execution sequence
      //
      // One input share is applied per clock cycle.
      // prch[layer_idx] is released before the next layer executes, until all
      // precharge signals have been released.
      // ----------------------------------------------------------------------

      for (layer_idx = 0; layer_idx < d; layer_idx = layer_idx + 1) begin

        if (layer_idx < security_order)
          prch[layer_idx] <= 1'b0;

        // For layer 0, a[0]/b[0] are single-rail.
        // For layer l > 0:
        //   a[2*l-1] = chosen share, a[2*l] = complement
        //   b[2*l-1] = chosen share, b[2*l] = complement

        if (layer_idx == 0) begin
          a[0] <= test_idx[d];
          b[0] <= test_idx[0];
        end
        else begin
          a[2*layer_idx-1] <=  test_idx[d+layer_idx];
          a[2*layer_idx]   <= ~test_idx[d+layer_idx];

          b[2*layer_idx-1] <=  test_idx[layer_idx];
          b[2*layer_idx]   <= ~test_idx[layer_idx];
        end

        @(posedge clk);

      end

      // ----------------------------------------------------------------------
      // Correctness check
      // ----------------------------------------------------------------------

      @(negedge clk);

      // Every dual-rail pair must contain complementary values
      if (OUT_DR == 1) begin
        for (layer_idx = 1; layer_idx < d; layer_idx = layer_idx+1) begin
          if ((z[2*layer_idx] ^ z[2*layer_idx-1]) !== 1'b1) begin
            $display("ERROR: not DR, case %0d, layer %0d", test_idx, layer_idx);
            errors_evaluation = errors_evaluation + 1;
          end
        end
      end

      if (z_computed !== z_expected) begin
        $display("ERROR: wrong result, case %0d", test_idx);
        errors_correctness = errors_correctness + 1;
      end

      @(posedge clk);

    end

    // ----------------------------------------------------------------------
    // Print results
    // ----------------------------------------------------------------------
		
    if (errors_precharge != 0)
      $display("FAIL: %0d pre-charge errors", errors_precharge);

    if (errors_evaluation != 0)
      $display("FAIL: %0d evaluation errors", errors_evaluation);

    if (errors_correctness != 0)
      $display("FAIL: %0d correctness errors", errors_correctness);

    if ((errors_precharge == 0) && (errors_evaluation == 0) && (errors_correctness == 0))
      $display("PASS: all tests passed");

    $finish;

  end

endmodule

