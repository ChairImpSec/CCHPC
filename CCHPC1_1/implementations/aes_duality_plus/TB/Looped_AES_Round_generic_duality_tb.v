`timescale 1ps/1ps

// -----------------------------------------------------------------------------
// Randomized functional testbench for Looped_AES_Round_generic_duality
//
// - arbitrary security order
// - random plaintext and key sharing
// - fresh randomness every clock cycle
// -----------------------------------------------------------------------------

module Looped_AES_Round_generic_duality_tb;

    // -------------------------------------------------------------------------
    // Parameters and local parameters
    // -------------------------------------------------------------------------

    parameter security_order   = 1;
    parameter FORWARD_R        = 0;
    parameter wAOI22_linear    = 1;
    parameter wAOI22_nonlinear = 0;
    parameter TEST_COUNT       = 10;

    localparam integer d											= security_order+1;
    localparam integer SBOX_COUNT							= 20;
    localparam integer nonlinear_count_DRtDR	= 15;
    localparam integer nonlinear_count_DRtSR	= 18;
    localparam integer RAND_COUNT							= (d*(d-1))/2;
    localparam integer RAND_COUNT_CONSEC			= ((d-1)*(d-2))/2;
    localparam integer RAND_COUNT_CONSEC_SAFE	= (RAND_COUNT_CONSEC > 0) ? RAND_COUNT_CONSEC : 1;
    localparam integer RAND_WIDTH_SR_SBOX			= nonlinear_count_DRtDR*(d-1) + nonlinear_count_DRtSR*RAND_COUNT;
    localparam integer RAND_WIDTH_DR_SBOX			= (RAND_COUNT_CONSEC > 0) ? nonlinear_count_DRtDR*2*RAND_COUNT_CONSEC : 2;
    localparam integer RAND_WIDTH_SR					= SBOX_COUNT*RAND_WIDTH_SR_SBOX;
    localparam integer RAND_WIDTH_DR					= SBOX_COUNT*RAND_WIDTH_DR_SBOX;
    localparam integer STARTUP_CYCLES					= security_order+3;

    // -------------------------------------------------------------------------
    // AES-128 reference functions
    // -------------------------------------------------------------------------

    localparam [2047:0] AES_SBOX = 2048'h637c777bf26b6fc53001672bfed7ab76ca82c97dfa5947f0add4a2af9ca472c0b7fd9326363ff7cc34a5e5f171d8311504c723c31896059a071280e2eb27b27509832c1a1b6e5aa0523bd6b329e32f8453d100ed20fcb15b6acbbe394a4c58cfd0efaafb434d338545f9027f503c9fa851a3408f929d38f5bcb6da2110fff3d2cd0c13ec5f974417c4a77e3d645d197360814fdc222a908846eeb814de5e0bdbe0323a0a4906245cc2d3ac629195e479e7c8376d8dd54ea96c56f4ea657aae08ba78252e1ca6b4c6e8dd741f4bbd8b8a703eb5664803f60e613557b986c11d9ee1f8981169d98e949b1e87e9ce5528df8ca1890dbfe6426841992d0fb054bb16;

    function [7:0] aes_sbox;
        input [7:0] x;

				begin
					aes_sbox = AES_SBOX[2047-8*x -: 8];
				end
    endfunction

    function [7:0] xtime;
        input [7:0] x;

				begin
					xtime = {x[6:0],1'b0} ^ (x[7] ? 8'h1b : 8'h00);
				end
    endfunction

    function [127:0] subbytes;
        input [127:0] x;
        integer i;

        begin
					for (i = 0; i < 16; i = i+1) begin
						subbytes[127-8*i -: 8] = aes_sbox(x[127-8*i -: 8]);
					end 
        end
    endfunction

    function [127:0] shiftrows;
        input [127:0] x;

        begin
						shiftrows[127:120] = x[127:120];
						shiftrows[119:112] = x[87:80];
						shiftrows[111:104] = x[47:40];
						shiftrows[103:96]  = x[7:0];
						shiftrows[95:88]   = x[95:88];
						shiftrows[87:80]   = x[55:48];
						shiftrows[79:72]   = x[15:8];
						shiftrows[71:64]   = x[103:96];
						shiftrows[63:56]   = x[63:56];
						shiftrows[55:48]   = x[23:16];
						shiftrows[47:40]   = x[111:104];
						shiftrows[39:32]   = x[71:64];
						shiftrows[31:24]   = x[31:24];
						shiftrows[23:16]   = x[119:112];
						shiftrows[15:8]    = x[79:72];
						shiftrows[7:0]     = x[39:32];
        end
    endfunction

    function [31:0] mixcolumn;
        input [31:0] x;
        reg [7:0] a0, a1, a2, a3;

        begin
					a0=x[31:24];
					a1=x[23:16];
					a2=x[15:8];
					a3=x[7:0];

					mixcolumn[31:24] = xtime(a0) ^ (xtime(a1) ^ a1) ^ a2 ^ a3;
					mixcolumn[23:16] = a0 ^ xtime(a1) ^ (xtime(a2) ^ a2) ^ a3;
					mixcolumn[15:8]  = a0 ^ a1 ^ xtime(a2) ^ (xtime(a3) ^ a3);
					mixcolumn[7:0]   = (xtime(a0) ^ a0) ^ a1 ^ a2 ^ xtime(a3);
        end
    endfunction

    function [127:0] mixcolumns;
        input [127:0] x;
        integer i;

        begin
					for (i = 0; i < 4; i = i+1) begin
						mixcolumns[127-32*i -: 32] = mixcolumn(x[127-32*i -: 32]);
					end
        end
    endfunction

    function [127:0] next_key;
        input [127:0] k;
        input [7:0] rcon;
        reg [31:0] w0, w1, w2, w3, t, n0, n1, n2, n3;

        begin
					w0 = k[127:96];
					w1 = k[95:64];
					w2 = k[63:32];
					w3 = k[31:0];

					t = {aes_sbox(w3[23:16]), aes_sbox(w3[15:8]), aes_sbox(w3[7:0]), aes_sbox(w3[31:24])};
					t[31:24] = t[31:24] ^ rcon;

					n0 = w0 ^ t;
					n1 = w1 ^ n0;
					n2 = w2 ^ n1;
					n3 = w3 ^ n2;

					next_key = {n0, n1, n2, n3};
        end
    endfunction

    function [127:0] aes128;
        input [127:0] p;
        input [127:0] k;
        reg [127:0] s, rk;
        reg [7:0] rcon;
        integer r;

        begin
					rk 		= k;
					s 		= p^rk;
					rcon 	= 8'h01;

					for (r = 1; r < 10; r = r+1) begin
						rk 		= next_key(rk,rcon);
						s 		= mixcolumns(shiftrows(subbytes(s))) ^ rk;
						rcon = xtime(rcon);
					end

					rk = next_key(rk, rcon);
					aes128 = shiftrows(subbytes(s)) ^ rk;
        end
    endfunction

    // -------------------------------------------------------------------------
    // Intermediates
    // -------------------------------------------------------------------------

    reg CLK, rst;
    reg [128*d-1:0] plaintext, key;
    wire [128*d-1:0] ciphertext;
    wire [127:0] out;

    reg [RAND_WIDTH_SR-1:0] r_SR;
    reg [RAND_WIDTH_DR-1:0] r_duality_eval, r_duality0, r_duality1;
    wire [RAND_WIDTH_DR-1:0] r_duality_phase0, r_duality_phase1;
    wire [d-2:0] prch0, prch1;
    wire done_layer0;

    reg [127:0] plaintext_value, key_value, expected_value;
    integer test_idx, error_count, seed, random_idx;

    // -------------------------------------------------------------------------
    // DUT
    // -------------------------------------------------------------------------

    Looped_AES_Round_generic_duality #(
			.security_order(security_order),
			.FORWARD_R(FORWARD_R),
			.wAOI22_linear(wAOI22_linear),
			.wAOI22_nonlinear(wAOI22_nonlinear),
			.ALIGN_OUT(1'b1)
			) DUT (
        .clk(CLK),
				.rst(rst),
				.r_SR(r_SR),
				.r_duality0(r_duality0),
				.r_duality1(r_duality1),
        .plaintext(plaintext),
				.key(key),
				.ciphertext(ciphertext),
				.done_layer0(done_layer0),
        .prch0_o(prch0),
				.prch1_o(prch1)
    );

    // Recombination of aligned Boolean output/ciphertext shares
    genvar i;
    generate
			for (i=0; i<128; i=i+1) begin : gen_out_
				assign out[i] = ^ciphertext[i*d +: d];
			end
    endgenerate

    // -------------------------------------------------------------------------
    // Random input sharing
    // -------------------------------------------------------------------------

    task random_share;
        input [127:0] value;
        output [128*d-1:0] shared;
        integer bit_idx, share_idx;
        reg share_xor;

        begin
            shared = {128*d{1'b0}};
            for (bit_idx = 0; bit_idx < 128; bit_idx = bit_idx+1) begin
                share_xor = 1'b0;
                for (share_idx = 0; share_idx < d-1; share_idx = share_idx+1) begin
                    shared[bit_idx*d+share_idx] = $random(seed);
                    share_xor = share_xor^shared[bit_idx*d+share_idx];
                end
                shared[bit_idx*d+d-1] = value[bit_idx] ^ share_xor;
            end
        end
    endtask

    // -------------------------------------------------------------------------
    // Randomness generation and DR phase alignment
    // -------------------------------------------------------------------------

    // Pre-charge mapping
    function random_prch;
        input integer rand_pos;
        input [d-2:0] prch;
        integer layer, offset;

        begin
            random_prch = 1'b0;
            for (layer = 1; layer < d-1; layer = layer+1) begin
                offset = ((layer-1)*(2*d-layer-2))/2;
                if ((rand_pos >= offset) && (rand_pos < offset+d-1-layer))
                    random_prch = prch[layer-1];
            end
        end
    endfunction

    genvar rand_pair;
    generate
        if (RAND_COUNT_CONSEC > 0) begin : gen_rand_phase_
            for (rand_pair = 0; rand_pair < RAND_WIDTH_DR/2; rand_pair = rand_pair+1) begin : gen_rand_pair_
                localparam integer RAND_POS = rand_pair % RAND_COUNT_CONSEC_SAFE;
                assign r_duality_phase0[2*rand_pair +: 2] = random_prch(RAND_POS, prch0) ? 2'b00 : r_duality_eval[2*rand_pair +: 2];
                assign r_duality_phase1[2*rand_pair +: 2] = random_prch(RAND_POS, prch1) ? 2'b00 : r_duality_eval[2*rand_pair +: 2];
            end
        end else begin : gen_no_rand_phase_
            assign r_duality_phase0 = r_duality_eval;
            assign r_duality_phase1 = r_duality_eval;
        end
    endgenerate

    // Register the phase-aligned DR randomness
    always @(posedge CLK) begin
        r_duality0 <= r_duality_phase0;
        r_duality1 <= r_duality_phase1;

        // Sample fresh randomness for the following clock cycle
        for (random_idx = 0; random_idx < RAND_WIDTH_SR; random_idx = random_idx+1)
            r_SR[random_idx] <= $random(seed);

        if (RAND_COUNT_CONSEC > 0) begin
            for (random_idx = 0; random_idx < RAND_WIDTH_DR/2; random_idx = random_idx+1)
                r_duality_eval[2*random_idx +: 2] <= ($random(seed)&1) ? 2'b01 : 2'b10;
        end else begin
            r_duality_eval <= {RAND_WIDTH_DR{1'b0}};
        end
    end

    
    // -------------------------------------------------------------------------
    // Randomized AES-128 tests
    // -------------------------------------------------------------------------

		always #5000 CLK=~CLK;

    initial begin
        CLK							= 1'b0;
				rst							= 1'b1;
        plaintext				= {128*d{1'b0}}; key={128*d{1'b0}};
        r_SR						= {RAND_WIDTH_SR{1'b0}};
        r_duality_eval	= {RAND_WIDTH_DR{1'b0}};
        r_duality0			= {RAND_WIDTH_DR{1'b0}};
        r_duality1			= {RAND_WIDTH_DR{1'b0}};
        plaintext_value	= 128'b0;
				key_value				= 128'b0;
				expected_value	= 128'b0;
        error_count			= 0;
				seed						= 32'h12345678;

        $display("CONFIGURATION:");
        $display("  DESIGN         = Looped_AES_Round_generic_duality");
        $display("  security_order = %0d", security_order);
        $display("  NUM_SHARES     = %0d", d);
        $display("  NUM_TESTS      = %0d", TEST_COUNT);
        $display("");
        $display("START: randomized AES-128 functional tests");
        $display("");

        // Initialize the phase-aligned DR randomness before the first test
        repeat (STARTUP_CYCLES) @(posedge CLK);

        for (test_idx=0; test_idx < TEST_COUNT; test_idx = test_idx+1) begin
            @(negedge CLK);
            plaintext_value	= {$random(seed), $random(seed), $random(seed), $random(seed)};
            key_value				= {$random(seed), $random(seed), $random(seed), $random(seed)};
            expected_value	= aes128(plaintext_value, key_value);
            random_share(plaintext_value, plaintext);
            random_share(key_value, key);
            rst=1'b0;

            // Wait for AES completion and output share alignment
            wait (done_layer0 === 1'b1);
            repeat (d-2) @(posedge CLK);
            @(negedge CLK);

            if (out !== expected_value) begin
                error_count = error_count+1;
                $display("ERROR test=%0d order=%0d pt=%032h key=%032h exp=%032h got=%032h",
                         test_idx, security_order, plaintext_value, key_value, expected_value, out);
            end

            rst = 1'b1;
            repeat (STARTUP_CYCLES) @(posedge CLK);
        end

        if (error_count == 0)
            $display("PASS: %0d/%0d randomized AES-128 tests correct at security order %0d", TEST_COUNT, TEST_COUNT, security_order);
        else
            $display("FAIL: %0d errors in %0d randomized AES-128 tests at security order %0d", error_count, TEST_COUNT, security_order);

        $finish;
    end

endmodule

