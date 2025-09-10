module REG_r_pipeline #(  parameter depth = 2
)(
    clk, prch, a, z
);

    input  clk;
    input  [depth-1:0] prch;
    input  a;
    output z;

    //-- intermediates ------------------------
    wire [depth:0] w;



    //-----------------------------------------
    //-- registers ----------------------------
    //-----------------------------------------

    assign w[0] = a; 

    genvar i;
    generate
        for (i = 0; i < depth; i=i+1) begin : loop_gen_regs_
            REG_r reg_inst (.clk(clk), .rst(prch[i]), .d(w[i]), .q(w[i+1]));
        end
    endgenerate  

    assign z = w[depth];


endmodule