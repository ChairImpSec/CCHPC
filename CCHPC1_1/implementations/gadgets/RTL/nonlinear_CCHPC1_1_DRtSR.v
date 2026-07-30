
module nonlinear_CCHPC1_1_DRtSR #( parameter security_order = 1, CONF = 2'b00, aINV = 1'b0, bINV = 1'b0, zINV = 1'b0
                                       // 2'b00: and
                                       // 2'b01: nand
                                       // 2'b10: nor
                                       // 2'b11: or
)(
    clk, prch, a, b, r, z
);
    parameter integer d = security_order+1;

    input         clk;
    input [d-2:0] prch;

    input  [2*(d-1):0] a;       // share format: {..., a[2], a[1], a[0]} = {..., a^1_f, a^1_t, a^0}, ^ indicates share index, _ indicates rail
    input  [2*(d-1):0] b;       //

    input  [((d*(d-1)))-1:0] r; // dual-rail random bits

    output [  (d-1):0] z;       //



    generate

        if (d == 2) begin : first_order

            nonlinear_CCHPC1_1_DRtSR_order1 #(.CONF(CONF), .aINV(aINV), .bINV(bINV), .zINV(zINV)) nonlinear_inst (
                .clk (clk),
                .prch(prch),
                .a   (a),
                .b   (b),
                .r   (r),
                .z   (z)
            );

        end else if (d == 3) begin : second_order

            nonlinear_CCHPC1_1_DRtSR_order2 #(.CONF(CONF), .aINV(aINV), .bINV(bINV), .zINV(zINV)) nonlinear_inst (
                .clk (clk),
                .prch(prch),
                .a   (a),
                .b   (b),
                .r   (r),
                .z   (z)
            );

        end else if (d == 4) begin : third_order

            nonlinear_CCHPC1_1_DRtSR_order3 #(.CONF(CONF), .aINV(aINV), .bINV(bINV), .zINV(zINV)) nonlinear_inst (
                .clk (clk),
                .prch(prch),
                .a   (a),
                .b   (b),
                .r   (r),
                .z   (z)
            );

        end else begin : gen_unsupported_order
            initial begin
                $error("nonlinear_CCHPC1_1_select: unsupported security_order=%0d (supported: 1,2,3)", security_order);
            end
        end

    endgenerate

endmodule