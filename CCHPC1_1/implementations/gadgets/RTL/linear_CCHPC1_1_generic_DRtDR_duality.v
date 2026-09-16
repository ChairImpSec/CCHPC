module linear_CCHPC1_1_generic_DRtDR_duality #( parameter security_order = 1, CONF = 1'b0, wAOI22 = 1, INV = 0
																																						 // 1'b0: xor
																																						 // 1'b1: xnor
)(
    a_layer0,
    b_layer0,
    a_duality0,
    a_duality1,
    b_duality0,
    b_duality1,
    z_layer0,
    z_duality0,
    z_duality1
);
    parameter integer d = security_order+1;

    input              a_layer0;
    input              b_layer0;
    input  [2*(d-1):1] a_duality0;      // interleaved rail format: {..., a[2], a[1]} = {..., a^1_f, a^1_t}, ^ indicates share index, _ indicates rail
    input  [2*(d-1):1] a_duality1;      //
    input  [2*(d-1):1] b_duality0;      //
    input  [2*(d-1):1] b_duality1;      //

    output             z_layer0;
    output [2*(d-1):1] z_duality0;      //
    output [2*(d-1):1] z_duality1;      //


    //-----------------------------------------
    //-- layer0 (single-rail) -----------------
    //-----------------------------------------

		XOR2 layer0_xor (
			.a(a_layer0),
			.b(b_layer0),
			.z(z_layer0)
		);


    //-----------------------------------------
    //-- consecutive layers (dual-rail) -------
    //-----------------------------------------

    linear_CCHPC1_1_generic_DRtDR_consecutive #(
      .security_order(security_order),
      .CONF(CONF),
      .wAOI22(wAOI22),
      .INV(INV)
    ) XOR_duality0 (
      .a(a_duality0),
      .b(b_duality0),
      .z(z_duality0)
    );

    linear_CCHPC1_1_generic_DRtDR_consecutive #(
      .security_order(security_order),
      .CONF(CONF),
      .wAOI22(wAOI22),
      .INV(INV)
    ) XOR_duality1 (
      .a(a_duality1),
      .b(b_duality1),
      .z(z_duality1)
    );

endmodule

