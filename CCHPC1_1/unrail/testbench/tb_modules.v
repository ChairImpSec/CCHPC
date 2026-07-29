`timescale 1ns / 1ps

module linear_CCHPC1_1_DRtDR (a, b, z);
  parameter CONF = 1'b0; // CONFIG INV: 00/11 = xor 01/10 = xnor
  parameter INV = 1'b0;
  parameter security_order = 1;
  parameter d = security_order + 1;
  input wire [2*(d-1):0] a;
  input wire [2*(d-1):0] b;
  output wire [2*(d-1):0] z;

  generate
    if (CONF == 1'b0) begin
      if (INV == 1'b0) begin
        assign z[0] = a[0] ^ b[0];
      end else begin
        assign z[0] = a[0] ~^ b[0];
      end
    end else begin
      if (INV == 1'b0) begin
        assign z[0] = a[0] ~^ b[0];
      end else begin
        assign z[0] = a[0] ^ b[0];
      end
    end
  endgenerate
endmodule

module linear_CCHPC1_1_SRtSR (a, b, z);
  parameter CONF = 1'b0; // CONFIG INV: 00/11 = xor 01/10 = xnor
  parameter INV = 1'b0;
  parameter security_order = 1;
  parameter d = security_order + 1;
  input wire [d-1:0] a;
  input wire [d-1:0] b;
  output wire [d-1:0] z;

  generate
    if (CONF == 1'b0) begin
      if (INV == 1'b0) begin
        assign z[0] = a[0] ^ b[0];
      end else begin
        assign z[0] = a[0] ~^ b[0];
      end
    end else begin
      if (INV == 1'b0) begin
        assign z[0] = a[0] ~^ b[0];
      end else begin
        assign z[0] = a[0] ^ b[0];
      end
    end
  endgenerate
endmodule

module NOT_CCHPC1_1_SRtSR (a, z);
  parameter security_order = 1;
  parameter d = security_order + 1;
  input wire [d-1:0] a;
  output wire [d-1:0] z;

  assign z[0] = ~a[0];
endmodule

module NOT_CCHPC1_1_DRtDR (a, z);
  parameter security_order = 1;
  parameter d = security_order + 1;
  input wire [2*(d-1):0] a;
  output wire [2*(d-1):0] z;

  assign z[0] = ~a[0];
endmodule

module nonlinear_CCHPC1_1_DRtDR (a, b, r, clk, prch, z);
  parameter CONF = 2'b00; // 00 AND, 01 NAND
  parameter aINV = 1'b0;
  parameter bINV = 1'b0;
  parameter zINV = 1'b0;
  parameter security_order = 1;
  parameter d = security_order + 1;
  input wire [2*(d-1):0] a;
  input wire [2*(d-1):0] b;
  input wire [2*(d*(d-1))/2-1:0] r;
  input wire clk;
  input wire [d-2:0] prch;
  output wire [2*(d-1):0] z;
  
  wire [2*(d-1):0] internal_a;
  wire [2*(d-1):0] internal_b;
  wire [2*(d-1):0] internal_z;
  
  generate
    if (aINV == 1'b0) begin
        assign internal_a[0] = a[0];
    end else begin
        assign internal_a[0] = ~a[0];
    end
  
    if (bINV == 1'b0) begin
        assign internal_b[0] = b[0];
    end else begin
        assign internal_b[0] = ~b[0];
    end
  
    if (zINV == 1'b0) begin
        assign z[0] = internal_z[0];
    end else begin
        assign z[0] = ~internal_z[0];
    end
  endgenerate

  generate
    if (CONF == 2'h0) begin
        assign internal_z[0] = internal_a[0] & internal_b[0];  // sim-only
    end if (CONF == 2'h1) begin
        assign internal_z[0] = ~(internal_a[0] & internal_b[0]);
    end if (CONF == 2'h2) begin
        assign internal_z[0] = ~(internal_a[0] | internal_b[0]);
    end if (CONF == 2'h3) begin
        assign internal_z[0] = internal_a[0] | internal_b[0];
    end
  endgenerate
endmodule

module nonlinear_CCHPC1_1_DRtSR (a, b, r, clk, prch, z);
  parameter CONF = 2'b00; // 00 AND, 01 NAND
  parameter aINV = 1'b0;
  parameter bINV = 1'b0;
  parameter zINV = 1'b0;
  parameter security_order = 1;
  parameter d = security_order + 1;
  input wire [2*(d-1):0] a;
  input wire [2*(d-1):0] b;
  input wire [2*(d*(d-1))/2-1:0] r;
  input wire clk;
  input wire [d-2:0] prch;
  output wire [d-1:0] z;
  
  wire [2*(d-1):0] internal_a;
  wire [2*(d-1):0] internal_b;
  wire [d-1:0] internal_z;
  
  generate
    if (aINV == 1'b0) begin
        assign internal_a[0] = a[0];
    end else begin
        assign internal_a[0] = ~a[0];
    end
  
    if (bINV == 1'b0) begin
        assign internal_b[0] = b[0];
    end else begin
        assign internal_b[0] = ~b[0];
    end
  
    if (zINV == 1'b0) begin
        assign z[0] = internal_z[0];
    end else begin
        assign z[0] = ~internal_z[0];
    end
  endgenerate

  generate
    if (CONF == 2'h0) begin
        assign internal_z[0] = internal_a[0] & internal_b[0];  // sim-only
    end if (CONF == 2'h1) begin
        assign internal_z[0] = ~(internal_a[0] & internal_b[0]);
    end if (CONF == 2'h2) begin
        assign internal_z[0] = ~(internal_a[0] | internal_b[0]);
    end if (CONF == 2'h3) begin
        assign internal_z[0] = internal_a[0] | internal_b[0];
    end
  endgenerate
endmodule

module REG_SRtDR (a, clk, prch, z);
  parameter INV = 1'b0;
  parameter security_order = 1;
  parameter d = security_order + 1;
  input wire [d-1:0] a;
  input wire clk;
  input wire [d-2:0] prch;
  output wire [2*(d-1):0] z;
    
  generate
    if (INV == 1'b0) begin
      assign z[0] = a[0];
    end else begin
      assign z[0] = ~a[0];
    end
  endgenerate
endmodule

module REG_SRtSR (a, clk, prch, z);
  parameter INV = 1'b0;
  parameter security_order = 1;
  parameter d = security_order + 1;
  input wire [d-1:0] a;
  input wire clk;
  input wire [d-2:0] prch;
  output wire [d-1:0] z;

  generate
    if (INV == 1'b0) begin
      assign z[0] = a[0];
    end else begin
      assign z[0] = ~a[0];
    end
  endgenerate
endmodule