module inv_CCHPC #(  parameter security_order = 2
)(
    a, b, z
);

    parameter integer d = security_order+1;

    input  [2*d-2:0] a;       // share format: {..., a[2], a[1], a[0]} = {..., a^1_f, a^1_t, a^0}, ^ indicates share index, _ indicates rail
    input  [2*d-2:0] b;       //
    output [2*d-2:0] z;       //



    //-----------------------------------------
    //-- all layers ---------------------------
    //-----------------------------------------

    assign z = {z[2*d-3], z[2*d-2], z[2*d-4:0]};
  

endmodule