/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Sun Sep 20 10:21:56 2026
/////////////////////////////////////////////////////////////


module nonlinear_CCHPC1_1_generic_DRtDR ( clk, prch, a, b, r_SR, r_DR, z );
  input [0:0] prch;
  input [2:0] a;
  input [2:0] b;
  input [0:0] r_SR;
  input [1:0] r_DR;
  output [2:0] z;
  input clk;
  wire   z_internal_0_,
         gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_,
         gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_,
         gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_,
         gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_,
         gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_,
         gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_,
         gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_,
         nonlinear_layer0_a0nandb0;
  wire   [7:0] t_DR;
  wire   [7:0] gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w;
  wire  
         [3:0] nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;

  NAND2_X1 nonlinear_layer0_nand2_inst_U1 ( .A1(b[0]), .A2(a[0]), .ZN(
        nonlinear_layer0_a0nandb0) );
  XNOR2_X1 nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        nonlinear_layer0_a0nandb0), .B(r_SR[0]), .ZN(z_internal_0_) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(a[0]), .B(r_SR[0]), .Z(
        gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(b[0]), .B(r_SR[0]), .Z(
        gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(b[0]), .B(gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), 
        .ZN(gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_) );
  INV_X1 gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( .A(
        gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_) );
  INV_X1 gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( .A(
        gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_) );
  INV_X1 gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( .A(
        gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( .A(
        r_SR[0]), .ZN(gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_)
         );
  NOR2_X1 gen_layer__1__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(prch[0]), .A2(
        gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w[0]) );
  NOR2_X1 gen_layer__1__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(prch[0]), .A2(
        gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w[1]) );
  NOR2_X1 gen_layer__1__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(prch[0]), .A2(
        gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w[2]) );
  NOR2_X1 gen_layer__1__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(prch[0]), .A2(
        gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w[3]) );
  NOR2_X1 gen_layer__1__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(prch[0]), .A2(r_SR[0]), .ZN(
        gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w[4]) );
  NOR2_X1 gen_layer__1__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(prch[0]), .A2(
        gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w[5]) );
  NOR2_X1 gen_layer__1__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(prch[0]), .A2(
        gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w[6]) );
  NOR2_X1 gen_layer__1__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(prch[0]), .A2(
        gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w[7]) );
  DFF_X1 gen_layer__1__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_0_ ( 
        .D(gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w[0]), .CK(
        clk), .Q(t_DR[0]), .QN() );
  DFF_X1 gen_layer__1__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_1_ ( 
        .D(gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w[1]), .CK(
        clk), .Q(t_DR[1]), .QN() );
  DFF_X1 gen_layer__1__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_2_ ( 
        .D(gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w[2]), .CK(
        clk), .Q(t_DR[2]), .QN() );
  DFF_X1 gen_layer__1__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_3_ ( 
        .D(gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w[3]), .CK(
        clk), .Q(t_DR[3]), .QN() );
  DFF_X1 gen_layer__1__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_4_ ( 
        .D(gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w[4]), .CK(
        clk), .Q(t_DR[4]), .QN() );
  DFF_X1 gen_layer__1__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_5_ ( 
        .D(gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w[5]), .CK(
        clk), .Q(t_DR[5]), .QN() );
  DFF_X1 gen_layer__1__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_6_ ( 
        .D(gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w[6]), .CK(
        clk), .Q(t_DR[6]), .QN() );
  DFF_X1 gen_layer__1__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_7_ ( 
        .D(gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w[7]), .CK(
        clk), .Q(t_DR[7]), .QN() );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(b[1]), .A2(a[1]), .A3(t_DR[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(b[2]), .A2(a[1]), .A3(t_DR[2]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(b[1]), .A2(a[2]), .A3(t_DR[1]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(b[2]), .A2(a[2]), .A3(t_DR[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(z[1]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(b[1]), .A2(a[1]), .A3(t_DR[7]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(b[2]), .A2(a[1]), .A3(t_DR[6]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(b[1]), .A2(a[2]), .A3(t_DR[5]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(b[2]), .A2(a[2]), .A3(t_DR[4]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(z[2]) );
  DFF_X1 gen_output_alignment__reg_z_layer0_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(z_internal_0_), .CK(clk), .Q(z[0]), .QN() );
endmodule

