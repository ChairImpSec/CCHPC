/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Sun Sep 20 11:08:01 2026
/////////////////////////////////////////////////////////////


module nonlinear_CCHPC1_1_generic_DRtDR ( clk, prch, a, b, r_SR, r_DR, z );
  input [1:0] prch;
  input [4:0] a;
  input [4:0] b;
  input [1:0] r_SR;
  input [1:0] r_DR;
  output [4:0] z;
  input clk;
  wire   z_internal_0_, fwdConsec_0_, nonlinear_layer0_a0nandb0,
         nonlinear_precomp_b_delayed_0__1_, nonlinear_precomp_a_delayed_0__1_,
         nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__tmp_mux_0_,
         gen_output_alignment__reg_z_layer0_inst_z_1_;
  wire   [3:0] t;
  wire   [3:0] t_fwd_SR;
  wire   [23:8] t_DR;
  wire   [15:0] gen_layer__2__gen_default__gen_default_prch__t_DR_in;
  wire   [3:0] gen_layer__1__gen_forward__reg_t_inst_w;
  wire   [15:0] gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w;
  wire  
         [3:0] nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat
;
  wire  
         [3:0] nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [1:0] nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w
;
  wire  
         [1:0] nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w
;

  XOR2_X1 nonlinear_layer0_U1 ( .A(r_SR[0]), .B(r_SR[1]), .Z(z_internal_0_) );
  NAND2_X1 nonlinear_layer0_nand2_inst_U1 ( .A1(b[0]), .A2(a[0]), .ZN(
        nonlinear_layer0_a0nandb0) );
  XNOR2_X1 nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        nonlinear_layer0_a0nandb0), .B(r_SR[0]), .ZN(t[0]) );
  XOR2_X1 gen_randPrecomp_used_layer__2__gen_randPrecomp_used_rand__1__gen_forward__gen_consecutive__xor_fwd_inst_U1 ( 
        .A(r_DR[0]), .B(fwdConsec_0_), .Z(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[12]) );
  DFF_X1 nonlinear_precomp_loop_delay__0__reg_pipeline_a_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(a[0]), .CK(clk), .Q(nonlinear_precomp_a_delayed_0__1_), .QN() );
  DFF_X1 nonlinear_precomp_loop_delay__0__reg_pipeline_b_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(b[0]), .CK(clk), .Q(nonlinear_precomp_b_delayed_0__1_), .QN() );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(a[0]), .B(t[0]), .Z(t[1]) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(b[0]), .B(t[0]), .Z(t[2]) );
  XNOR2_X1 nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(b[0]), .B(t[1]), .ZN(t[3]) );
  DFF_X1 nonlinear_precomp_gen_precomp_layer__2__gen_precomp_mtg__0__reg_pipeline_r_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(r_SR[1]), .CK(clk), .Q(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[4]), .QN() );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__2__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(nonlinear_precomp_a_delayed_0__1_), .B(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[4]), .Z(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[5]) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__2__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(nonlinear_precomp_b_delayed_0__1_), .B(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[4]), .Z(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[6]) );
  XNOR2_X1 nonlinear_precomp_gen_precomp_layer__2__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(nonlinear_precomp_b_delayed_0__1_), .B(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[5]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[7]) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__2__gen_precomp_mtg__1__mtg_inst_xor2_inst1_U1 ( 
        .A(a[1]), .B(gen_layer__2__gen_default__gen_default_prch__t_DR_in[12]), 
        .Z(gen_layer__2__gen_default__gen_default_prch__t_DR_in[13]) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__2__gen_precomp_mtg__1__mtg_inst_xor2_inst2_U1 ( 
        .A(b[1]), .B(gen_layer__2__gen_default__gen_default_prch__t_DR_in[12]), 
        .Z(gen_layer__2__gen_default__gen_default_prch__t_DR_in[14]) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__2__gen_precomp_mtg__1__mtg_inst_first_mtg_instance__xor2_inst3_U1 ( 
        .A(b[1]), .B(gen_layer__2__gen_default__gen_default_prch__t_DR_in[13]), 
        .Z(gen_layer__2__gen_default__gen_default_prch__t_DR_in[15]) );
  NOR2_X1 gen_layer__1__gen_forward__reg_t_inst_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(prch[0]), .A2(t[0]), .ZN(
        gen_layer__1__gen_forward__reg_t_inst_w[0]) );
  NOR2_X1 gen_layer__1__gen_forward__reg_t_inst_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(prch[0]), .A2(t[1]), .ZN(
        gen_layer__1__gen_forward__reg_t_inst_w[1]) );
  NOR2_X1 gen_layer__1__gen_forward__reg_t_inst_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(prch[0]), .A2(t[2]), .ZN(
        gen_layer__1__gen_forward__reg_t_inst_w[2]) );
  NOR2_X1 gen_layer__1__gen_forward__reg_t_inst_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(prch[0]), .A2(t[3]), .ZN(
        gen_layer__1__gen_forward__reg_t_inst_w[3]) );
  DFF_X1 gen_layer__1__gen_forward__reg_t_inst_reg_inst_q_reg_0_ ( .D(
        gen_layer__1__gen_forward__reg_t_inst_w[0]), .CK(clk), .Q(t_fwd_SR[0]), 
        .QN() );
  DFF_X1 gen_layer__1__gen_forward__reg_t_inst_reg_inst_q_reg_1_ ( .D(
        gen_layer__1__gen_forward__reg_t_inst_w[1]), .CK(clk), .Q(t_fwd_SR[1]), 
        .QN() );
  DFF_X1 gen_layer__1__gen_forward__reg_t_inst_reg_inst_q_reg_2_ ( .D(
        gen_layer__1__gen_forward__reg_t_inst_w[2]), .CK(clk), .Q(t_fwd_SR[2]), 
        .QN() );
  DFF_X1 gen_layer__1__gen_forward__reg_t_inst_reg_inst_q_reg_3_ ( .D(
        gen_layer__1__gen_forward__reg_t_inst_w[3]), .CK(clk), .Q(t_fwd_SR[3]), 
        .QN() );
  INV_X1 gen_layer__2__gen_default__gen_default_prch__t_SRtDR_inst_U6 ( .A(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[6]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[2]) );
  INV_X1 gen_layer__2__gen_default__gen_default_prch__t_SRtDR_inst_U7 ( .A(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[5]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[1]) );
  INV_X1 gen_layer__2__gen_default__gen_default_prch__t_SRtDR_inst_U5 ( .A(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[7]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[3]) );
  INV_X1 gen_layer__2__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( .A(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[12]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[8]) );
  INV_X1 gen_layer__2__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( .A(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[14]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[10]) );
  INV_X1 gen_layer__2__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( .A(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[13]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[9]) );
  INV_X1 gen_layer__2__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( .A(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[15]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[11]) );
  INV_X1 gen_layer__2__gen_default__gen_default_prch__t_SRtDR_inst_U8 ( .A(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[4]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[0]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[0]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[0]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[1]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[1]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[2]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[2]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[3]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[3]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[4]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[4]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[5]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[5]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[6]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[6]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[7]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[7]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__8__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[8]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[8]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__9__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[9]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[9]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__10__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[10]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[10]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__11__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[11]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[11]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__12__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[12]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[12]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__13__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[13]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[13]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__14__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[14]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[14]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__15__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in[15]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[15]) );
  DFF_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_0_ ( 
        .D(gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[0]), .CK(
        clk), .Q(t_DR[8]), .QN() );
  DFF_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_1_ ( 
        .D(gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[1]), .CK(
        clk), .Q(t_DR[9]), .QN() );
  DFF_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_2_ ( 
        .D(gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[2]), .CK(
        clk), .Q(t_DR[10]), .QN() );
  DFF_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_3_ ( 
        .D(gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[3]), .CK(
        clk), .Q(t_DR[11]), .QN() );
  DFF_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_4_ ( 
        .D(gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[4]), .CK(
        clk), .Q(t_DR[12]), .QN() );
  DFF_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_5_ ( 
        .D(gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[5]), .CK(
        clk), .Q(t_DR[13]), .QN() );
  DFF_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_6_ ( 
        .D(gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[6]), .CK(
        clk), .Q(t_DR[14]), .QN() );
  DFF_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_7_ ( 
        .D(gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[7]), .CK(
        clk), .Q(t_DR[15]), .QN() );
  DFF_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_8_ ( 
        .D(gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[8]), .CK(
        clk), .Q(t_DR[16]), .QN() );
  DFF_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_9_ ( 
        .D(gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[9]), .CK(
        clk), .Q(t_DR[17]), .QN() );
  DFF_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_10_ ( 
        .D(gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[10]), 
        .CK(clk), .Q(t_DR[18]), .QN() );
  DFF_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_11_ ( 
        .D(gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[11]), 
        .CK(clk), .Q(t_DR[19]), .QN() );
  DFF_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_12_ ( 
        .D(gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[12]), 
        .CK(clk), .Q(t_DR[20]), .QN() );
  DFF_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_13_ ( 
        .D(gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[13]), 
        .CK(clk), .Q(t_DR[21]), .QN() );
  DFF_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_14_ ( 
        .D(gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[14]), 
        .CK(clk), .Q(t_DR[22]), .QN() );
  DFF_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_15_ ( 
        .D(gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[15]), 
        .CK(clk), .Q(t_DR[23]), .QN() );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(b[1]), .A2(a[1]), .A3(t_fwd_SR[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(b[2]), .A2(a[1]), .A3(t_fwd_SR[2]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(b[1]), .A2(a[2]), .A3(t_fwd_SR[1]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(b[2]), .A2(a[2]), .A3(t_fwd_SR[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__tmp_mux_0_) );
  INV_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__fwd_comp_inst_U1 ( 
        .A(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_forward__tmp_mux_0_), .ZN(fwdConsec_0_) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(b[3]), .A2(a[3]), .A3(t_DR[11]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(b[4]), .A2(a[3]), .A3(t_DR[10]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(b[3]), .A2(a[4]), .A3(t_DR[9]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(b[4]), .A2(a[4]), .A3(t_DR[8]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[0]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(b[3]), .A2(a[3]), .A3(t_DR[15]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(b[4]), .A2(a[3]), .A3(t_DR[14]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(b[3]), .A2(a[4]), .A3(t_DR[13]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(b[4]), .A2(a[4]), .A3(t_DR[12]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[1]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(b[3]), .A2(a[3]), .A3(t_DR[19]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(b[4]), .A2(a[3]), .A3(t_DR[18]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(b[3]), .A2(a[4]), .A3(t_DR[17]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(b[4]), .A2(a[4]), .A3(t_DR[16]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[2]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(b[3]), .A2(a[3]), .A3(t_DR[23]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(b[4]), .A2(a[3]), .A3(t_DR[22]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(b[3]), .A2(a[4]), .A3(t_DR[21]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(b[4]), .A2(a[4]), .A3(t_DR[20]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[3]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U1_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[3]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[0]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U2_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[2]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U3_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[0]), .ZN(z[3]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U1_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[2]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[0]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U2_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U3_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[0]), .ZN(z[4]) );
  DFF_X1 gen_output_alignment__reg_z_layer0_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(z_internal_0_), .CK(clk), .Q(
        gen_output_alignment__reg_z_layer0_inst_z_1_), .QN() );
  DFF_X1 gen_output_alignment__reg_z_layer0_inst_loop_gen_regs__1__reg_inst_q_reg_0_ ( 
        .D(gen_output_alignment__reg_z_layer0_inst_z_1_), .CK(clk), .Q(z[0]), 
        .QN() );
  DFF_X1 gen_output_alignment__gen_layer__1__gen_rail__0__reg_z_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(r_DR[0]), .CK(clk), .Q(z[1]), .QN() );
  DFF_X1 gen_output_alignment__gen_layer__1__gen_rail__1__reg_z_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(r_DR[1]), .CK(clk), .Q(z[2]), .QN() );
endmodule

