module linear_CCHPC_wNAND_pipeline_layer0 #(  parameter security_order = 2
)(
    a, b, z
);

    parameter integer d = security_order+1;

    input  a;       // single-rail
    input  b;       //
    output z;       //
    
    //-----------------------------------------
    //-- layer0 (single-rail) -----------------
    //-----------------------------------------

    XOR2 layer0_xor (.a(a), .b(b), .z(z));
  

endmodule