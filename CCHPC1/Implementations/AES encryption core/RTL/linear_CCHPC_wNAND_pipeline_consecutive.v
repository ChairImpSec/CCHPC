module linear_CCHPC_wNAND_pipeline_consecutive #(  parameter security_order = 2,
                                                             CONF = 1'b0
                                                                 // 1'b0: xor
                                                                 // 1'b1: xnor
)(
    a, b, z
);

    parameter integer d = security_order+1;

    input  [2*(d-1):0] a;       // share format: {..., a[2], a[1], a[0]} = {..., a^1_f, a^1_t, a^0}, ^ indicates share index, _ indicates rail
    input  [2*(d-1):0] b;       //
    output [2*(d-1):1] z;       //
    
    //-- config -------------------------------
    wire [2*(d-1):1] out_z;



    //-----------------------------------------
    //-- CONFIG -------------------------------
    //-----------------------------------------

    generate
        if (CONF == 1'b0) begin : gen_out_

            assign z[2*(d-1):1] = out_z[2*(d-1):1];

        end else begin: gen_out_inv_

            assign z[2*d-2] = out_z[2*d-3];
            assign z[2*d-3] = out_z[2*d-2];
            
            if (d > 2) begin : gen_wiring_higher_order_

                assign z[2*d-4:1] = out_z[2*d-4:1];

            end

        end
    endgenerate
    
     

    //-----------------------------------------
    //-- consecutive layers (dual-rail) -------
    //-----------------------------------------

    genvar i;
    generate       
        for (i = 0; i < (d-1); i=i+1) begin : loop_gen_layer_

            DRP_XOR_wNAND xor_inst (.a_t(a[2*i+1]), .a_f(a[2*i+2]), .b_t(b[2*i+1]), .b_f(b[2*i+2]), .z_t(out_z[2*i+1]), .z_f(out_z[2*i+2]));

        end
    endgenerate
  

endmodule