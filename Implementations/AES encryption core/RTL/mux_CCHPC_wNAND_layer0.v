module mux_CCHPC_wNAND_layer0 #(  parameter security_order = 2
)(
    a, b, s, z
);

    parameter integer d = security_order+1;

    input  s; // unshared (should not depend on secret)
    input  a; // single-rail
    input  b; //
    output z; //



    //-- intermediates ------------------------
    wire [2+4*(d-1)-1:0] w;
    

    //-----------------------------------------
    //-- layer0 (single-rail) -----------------
    //-----------------------------------------

    XOR2 layer0_xor0 (.a(a   ), .b(b   ), .z(w[0]));
    AND2 layer0_and  (.a(s   ), .b(w[0]), .z(w[1]));
    XOR2 layer0_xor1 (.a(w[1]), .b(b)   , .z(z   ));

endmodule