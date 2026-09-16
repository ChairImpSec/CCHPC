module linear_CCHPC1_1_generic_DRtDR #( parameter security_order = 1, CONF = 1'b0, wAOI22 = 1'b1, INV = 1'b0
																																			// 1'b0: xor
																																			// 1'b1: xnor
)(
    a, b, z
);
    parameter integer d = security_order+1;

    input  [2*(d-1):0] a;       // share format: {..., a[2], a[1], a[0]} = {..., a^1_f, a^1_t, a^0}, ^ indicates share index, _ indicates rail
    input  [2*(d-1):0] b;       //
    output [2*(d-1):0] z;       //
    

    //-----------------------------------------
    //-- layer0 (single-rail) -----------------
    //-----------------------------------------

		XOR2 layer0_xor (
			.a(a[0]),
			.b(b[0]),
			.z(z[0])
		);


    //-----------------------------------------
    //-- consecutive layers (dual-rail) -------
    //-----------------------------------------

    linear_CCHPC1_1_generic_DRtDR_consecutive #(
      .security_order(security_order),
      .CONF(CONF),
      .wAOI22(wAOI22),
      .INV(INV)
		) XOR_consecutive (
      .a(a[2*(d-1):1]),
      .b(b[2*(d-1):1]),
      .z(z[2*(d-1):1])
    );

endmodule

