module Controller #( parameter security_order = 1) (clk, rst, prch0, prch1, sel, MCsel, Rcon, done_layer0);

    input                       clk;
    input                       rst;
    output [security_order-1:0] prch0;
    output [security_order-1:0] prch1;
    output [security_order:0]   sel;
    output [security_order:0]   MCsel;
    output [7:0]                Rcon;
    output                      done_layer0;


    // all signals are allowed to glitch: immediate reset with DFFRs also possible
    wire       rst_delayed;
    wire [3:0] shifted_reg_msb_delayed;
    wire [7:0] shifted;
    wire [7:0] shiftedXORed;
    reg  [7:0] shifted_reg;

    // delayed signals
    assign shifted_reg_msb_delayed[0] = shifted_reg[7];

    REG #(.WIDTH(1)) reg_rst_inst (.clk(clk), .d(rst), .q(rst_delayed));
    REG #(.WIDTH(3)) reg_shifted_msb_inst (.clk(clk), .d(shifted_reg_msb_delayed[2:0]), .q(shifted_reg_msb_delayed[3:1]));

    // Select Signals
    assign MCsel[0] = shifted_reg_msb_delayed[3];
    assign MCsel[1] = MCsel[0];

    assign sel[0] = rst_delayed;
    assign sel[1] = sel[0];

    generate
        if (security_order > 1) begin : sel_ctrl

            REG #(.WIDTH(security_order-1)) reg_MCsel_inst (.clk(clk), .d(MCsel[security_order-1:1]), .q(MCsel[security_order:2]));
            REG #(.WIDTH(security_order-1)) reg_sel_inst   (.clk(clk), .d(sel[security_order-1:1]),   .q(sel[security_order:2])  );

        end
    endgenerate

    // Pre-charge Signals
    assign prch0[0] = rst | ~prch1[0];
    REG #(.WIDTH(1)) reg_prch_d2_inst (.clk(clk), .d(prch0[0]), .q(prch1[0]));

    generate
        if (security_order > 1) begin : prch_ctrl

            REG #(.WIDTH(security_order-1)) reg_prch_inst (.clk(clk), .d(prch1[security_order-2:0]), .q(prch1[security_order-1:1]));
            assign prch0[security_order-1:1] = prch1[security_order-2:0];

        end
    endgenerate

    // Rcon
    always @(posedge clk)
    begin
        if (rst) begin : reset_counter
            shifted_reg <= 8'h01;
        end else begin : increase_counter
            shifted_reg <= shifted_reg[7] ? shiftedXORed : shifted;
        end
    end

    assign shifted      = {shifted_reg[6:0], 1'b0};
	assign shiftedXORed = shifted ^ 8'h1B;
    assign Rcon         = shifted_reg;


    // done
    assign done_layer0 = MCsel[0];

endmodule