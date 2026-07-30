module linear_CCHPC1_1_layer0 (
    a, b, z
);

    input  a;       // single-rail
    input  b;       //
    output z;       //
    
    //-----------------------------------------
    //-- layer0 (single-rail) -----------------
    //-----------------------------------------

    XOR2 layer0_xor (.a(a), .b(b), .z(z));
  

endmodule