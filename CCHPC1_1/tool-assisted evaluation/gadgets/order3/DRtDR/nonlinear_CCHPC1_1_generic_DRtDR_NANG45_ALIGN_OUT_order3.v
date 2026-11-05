/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Sun Sep 20 10:51:34 2026
/////////////////////////////////////////////////////////////


module nonlinear_CCHPC1_1_generic_DRtDR ( clk, prch, a, b, r_SR, r_DR, z );
  input [2:0] prch;
  input [6:0] a;
  input [6:0] b;
  input [2:0] r_SR;
  input [5:0] r_DR;
  output [6:0] z;
  input clk;
  wire   z_internal_0_,
         gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_,
         gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_,
         gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_,
         gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_,
         gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_,
         gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_,
         gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_,
         gen_layer__2__gen_default__gen_default_prch__t_DR_in_15_,
         gen_layer__2__gen_default__gen_default_prch__t_DR_in_14_,
         gen_layer__2__gen_default__gen_default_prch__t_DR_in_13_,
         gen_layer__2__gen_default__gen_default_prch__t_DR_in_11_,
         gen_layer__2__gen_default__gen_default_prch__t_DR_in_10_,
         gen_layer__2__gen_default__gen_default_prch__t_DR_in_9_,
         gen_layer__2__gen_default__gen_default_prch__t_DR_in_8_,
         gen_layer__2__gen_default__gen_default_prch__t_DR_in_7_,
         gen_layer__2__gen_default__gen_default_prch__t_DR_in_6_,
         gen_layer__2__gen_default__gen_default_prch__t_DR_in_5_,
         gen_layer__2__gen_default__gen_default_prch__t_DR_in_4_,
         gen_layer__2__gen_default__gen_default_prch__t_DR_in_3_,
         gen_layer__2__gen_default__gen_default_prch__t_DR_in_2_,
         gen_layer__2__gen_default__gen_default_prch__t_DR_in_1_,
         gen_layer__2__gen_default__gen_default_prch__t_DR_in_0_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_23_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_22_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_21_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_19_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_18_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_17_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_16_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_15_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_14_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_13_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_12_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_11_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_10_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_9_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_8_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_7_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_6_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_5_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_4_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_3_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_2_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_1_,
         gen_layer__3__gen_default__gen_default_prch__t_DR_in_0_,
         nonlinear_layer0_n1, nonlinear_layer0_a0nandb0,
         nonlinear_layer0_randL0_comp, nonlinear_precomp_b_delayed_0__1_,
         nonlinear_precomp_b_delayed_0__2_, nonlinear_precomp_b_delayed_1__1_,
         nonlinear_precomp_a_delayed_0__1_, nonlinear_precomp_a_delayed_0__2_,
         nonlinear_precomp_a_delayed_1__1_,
         nonlinear_precomp_gen_precomp_layer__3__gen_precomp_mtg__0__reg_pipeline_r_inst_z_1_,
         gen_output_alignment__reg_z_layer0_inst_z_1_,
         gen_output_alignment__reg_z_layer0_inst_z_2_,
         gen_output_alignment__gen_layer__1__gen_rail__0__reg_z_inst_z_1_,
         gen_output_alignment__gen_layer__1__gen_rail__1__reg_z_inst_z_1_;
  wire   [47:0] t_DR;
  wire   [4:1] z_consecutive;
  wire   [7:0] gen_layer__1__gen_default__gen_default_prch__reg_t_inst_w;
  wire   [15:0] gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w;
  wire   [23:0] gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w;
  wire  
         [5:0] nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat
;
  wire  
         [5:2] nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat
;
  wire  
         [5:4] nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__tmp_flat
;
  wire  
         [3:0] nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [1:0] nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs
;
  wire  
         [1:0] nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w
;
  wire  
         [1:0] nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w
;
  wire  
         [1:0] nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w
;
  wire  
         [1:0] nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w
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
         [1:0] nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs
;
  wire  
         [1:0] nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w
;
  wire  
         [1:0] nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w
;
  wire  
         [1:0] nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w
;
  wire  
         [1:0] nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w
;
  wire  
         [3:0] nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [1:0] nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs
;
  wire  
         [1:0] nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w
;
  wire  
         [1:0] nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w
;
  wire  
         [1:0] nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w
;
  wire  
         [1:0] nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w
;

  XNOR2_X1 nonlinear_layer0_U2 ( .A(nonlinear_layer0_n1), .B(r_SR[2]), .ZN(
        nonlinear_layer0_randL0_comp) );
  XNOR2_X1 nonlinear_layer0_U1 ( .A(r_SR[0]), .B(r_SR[1]), .ZN(
        nonlinear_layer0_n1) );
  NAND2_X1 nonlinear_layer0_nand2_inst_U1 ( .A1(b[0]), .A2(a[0]), .ZN(
        nonlinear_layer0_a0nandb0) );
  XNOR2_X1 nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        nonlinear_layer0_a0nandb0), .B(nonlinear_layer0_randL0_comp), .ZN(
        z_internal_0_) );
  DFF_X1 nonlinear_precomp_loop_delay__0__reg_pipeline_a_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(a[0]), .CK(clk), .Q(nonlinear_precomp_a_delayed_0__1_), .QN() );
  DFF_X1 nonlinear_precomp_loop_delay__0__reg_pipeline_a_inst_loop_gen_regs__1__reg_inst_q_reg_0_ ( 
        .D(nonlinear_precomp_a_delayed_0__1_), .CK(clk), .Q(
        nonlinear_precomp_a_delayed_0__2_), .QN() );
  DFF_X1 nonlinear_precomp_loop_delay__0__reg_pipeline_b_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(b[0]), .CK(clk), .Q(nonlinear_precomp_b_delayed_0__1_), .QN() );
  DFF_X1 nonlinear_precomp_loop_delay__0__reg_pipeline_b_inst_loop_gen_regs__1__reg_inst_q_reg_0_ ( 
        .D(nonlinear_precomp_b_delayed_0__1_), .CK(clk), .Q(
        nonlinear_precomp_b_delayed_0__2_), .QN() );
  DFF_X1 nonlinear_precomp_loop_delay__1__reg_pipeline_a_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(a[1]), .CK(clk), .Q(nonlinear_precomp_a_delayed_1__1_), .QN() );
  DFF_X1 nonlinear_precomp_loop_delay__1__reg_pipeline_b_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(b[1]), .CK(clk), .Q(nonlinear_precomp_b_delayed_1__1_), .QN() );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(a[0]), .B(r_SR[0]), .Z(
        gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(b[0]), .B(r_SR[0]), .Z(
        gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(b[0]), .B(gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), 
        .ZN(gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_) );
  DFF_X1 nonlinear_precomp_gen_precomp_layer__2__gen_precomp_mtg__0__reg_pipeline_r_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(r_SR[1]), .CK(clk), .Q(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_4_), .QN() );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__2__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(nonlinear_precomp_a_delayed_0__1_), .B(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_4_), .Z(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__2__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(nonlinear_precomp_b_delayed_0__1_), .B(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_4_), .Z(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 nonlinear_precomp_gen_precomp_layer__2__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(nonlinear_precomp_b_delayed_0__1_), .B(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_7_) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__2__gen_precomp_mtg__1__mtg_inst_xor2_inst1_U1 ( 
        .A(a[1]), .B(r_DR[0]), .Z(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_13_) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__2__gen_precomp_mtg__1__mtg_inst_xor2_inst2_U1 ( 
        .A(b[1]), .B(r_DR[0]), .Z(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_14_) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__2__gen_precomp_mtg__1__mtg_inst_first_mtg_instance__xor2_inst3_U1 ( 
        .A(b[1]), .B(gen_layer__2__gen_default__gen_default_prch__t_DR_in_13_), 
        .Z(gen_layer__2__gen_default__gen_default_prch__t_DR_in_15_) );
  DFF_X1 nonlinear_precomp_gen_precomp_layer__3__gen_precomp_mtg__0__reg_pipeline_r_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(r_SR[2]), .CK(clk), .Q(
        nonlinear_precomp_gen_precomp_layer__3__gen_precomp_mtg__0__reg_pipeline_r_inst_z_1_), .QN() );
  DFF_X1 nonlinear_precomp_gen_precomp_layer__3__gen_precomp_mtg__0__reg_pipeline_r_inst_loop_gen_regs__1__reg_inst_q_reg_0_ ( 
        .D(
        nonlinear_precomp_gen_precomp_layer__3__gen_precomp_mtg__0__reg_pipeline_r_inst_z_1_), .CK(clk), .Q(gen_layer__3__gen_default__gen_default_prch__t_DR_in_4_), .QN()
         );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__3__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(nonlinear_precomp_a_delayed_0__2_), .B(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_4_), .Z(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__3__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(nonlinear_precomp_b_delayed_0__2_), .B(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_4_), .Z(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 nonlinear_precomp_gen_precomp_layer__3__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(nonlinear_precomp_b_delayed_0__2_), .B(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_7_) );
  DFF_X1 nonlinear_precomp_gen_precomp_layer__3__gen_precomp_mtg__1__reg_pipeline_r_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(r_DR[2]), .CK(clk), .Q(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_12_), .QN() );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__3__gen_precomp_mtg__1__mtg_inst_xor2_inst1_U1 ( 
        .A(nonlinear_precomp_a_delayed_1__1_), .B(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_12_), .Z(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_13_) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__3__gen_precomp_mtg__1__mtg_inst_xor2_inst2_U1 ( 
        .A(nonlinear_precomp_b_delayed_1__1_), .B(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_12_), .Z(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_14_) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__3__gen_precomp_mtg__1__mtg_inst_first_mtg_instance__xor2_inst3_U1 ( 
        .A(nonlinear_precomp_b_delayed_1__1_), .B(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_13_), .Z(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_15_) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__3__gen_precomp_mtg__2__mtg_inst_xor2_inst1_U1 ( 
        .A(a[3]), .B(r_DR[4]), .Z(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_21_) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__3__gen_precomp_mtg__2__mtg_inst_xor2_inst2_U1 ( 
        .A(b[3]), .B(r_DR[4]), .Z(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_22_) );
  XOR2_X1 nonlinear_precomp_gen_precomp_layer__3__gen_precomp_mtg__2__mtg_inst_first_mtg_instance__xor2_inst3_U1 ( 
        .A(b[3]), .B(gen_layer__3__gen_default__gen_default_prch__t_DR_in_21_), 
        .Z(gen_layer__3__gen_default__gen_default_prch__t_DR_in_23_) );
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
  INV_X1 gen_layer__2__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( .A(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_15_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_11_) );
  INV_X1 gen_layer__2__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( .A(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_14_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_10_) );
  INV_X1 gen_layer__2__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( .A(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_13_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_9_) );
  INV_X1 gen_layer__2__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( .A(
        r_DR[0]), .ZN(gen_layer__2__gen_default__gen_default_prch__t_DR_in_8_)
         );
  INV_X1 gen_layer__2__gen_default__gen_default_prch__t_SRtDR_inst_U6 ( .A(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_2_) );
  INV_X1 gen_layer__2__gen_default__gen_default_prch__t_SRtDR_inst_U7 ( .A(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 gen_layer__2__gen_default__gen_default_prch__t_SRtDR_inst_U5 ( .A(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_3_) );
  INV_X1 gen_layer__2__gen_default__gen_default_prch__t_SRtDR_inst_U8 ( .A(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_4_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_0_) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[0]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[1]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[2]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[3]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_4_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[4]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[5]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[6]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[7]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__8__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_8_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[8]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__9__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_9_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[9]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__10__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_10_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[10]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__11__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_11_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[11]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__12__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(r_DR[0]), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[12]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__13__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_13_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[13]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__14__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_14_), .ZN(
        gen_layer__2__gen_default__gen_default_prch__reg_t_inst_w[14]) );
  NOR2_X1 gen_layer__2__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__15__ctrl_prch_inst_U1 ( 
        .A1(prch[1]), .A2(
        gen_layer__2__gen_default__gen_default_prch__t_DR_in_15_), .ZN(
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
  INV_X1 gen_layer__3__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( .A(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_23_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_19_) );
  INV_X1 gen_layer__3__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( .A(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_22_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_18_) );
  INV_X1 gen_layer__3__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( .A(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_21_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_17_) );
  INV_X1 gen_layer__3__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( .A(
        r_DR[4]), .ZN(gen_layer__3__gen_default__gen_default_prch__t_DR_in_16_) );
  INV_X1 gen_layer__3__gen_default__gen_default_prch__t_SRtDR_inst_U10 ( .A(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_2_) );
  INV_X1 gen_layer__3__gen_default__gen_default_prch__t_SRtDR_inst_U6 ( .A(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_14_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_10_) );
  INV_X1 gen_layer__3__gen_default__gen_default_prch__t_SRtDR_inst_U7 ( .A(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_13_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_9_) );
  INV_X1 gen_layer__3__gen_default__gen_default_prch__t_SRtDR_inst_U11 ( .A(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 gen_layer__3__gen_default__gen_default_prch__t_SRtDR_inst_U9 ( .A(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_3_) );
  INV_X1 gen_layer__3__gen_default__gen_default_prch__t_SRtDR_inst_U5 ( .A(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_15_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_11_) );
  INV_X1 gen_layer__3__gen_default__gen_default_prch__t_SRtDR_inst_U12 ( .A(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_4_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_0_) );
  INV_X1 gen_layer__3__gen_default__gen_default_prch__t_SRtDR_inst_U8 ( .A(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_12_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_8_) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[0]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[1]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[2]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[3]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_4_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[4]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[5]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[6]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[7]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__8__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_8_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[8]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__9__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_9_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[9]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__10__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_10_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[10]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__11__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_11_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[11]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__12__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_12_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[12]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__13__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_13_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[13]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__14__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_14_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[14]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__15__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_15_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[15]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__16__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_16_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[16]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__17__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_17_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[17]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__18__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_18_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[18]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__19__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_19_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[19]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__20__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(r_DR[4]), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[20]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__21__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_21_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[21]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__22__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_22_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[22]) );
  NOR2_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_ctrl_inst_loop_gen_prch__23__ctrl_prch_inst_U1 ( 
        .A1(prch[2]), .A2(
        gen_layer__3__gen_default__gen_default_prch__t_DR_in_23_), .ZN(
        gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[23]) );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_0_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[0]), .CK(
        clk), .Q(t_DR[24]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_1_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[1]), .CK(
        clk), .Q(t_DR[25]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_2_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[2]), .CK(
        clk), .Q(t_DR[26]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_3_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[3]), .CK(
        clk), .Q(t_DR[27]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_4_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[4]), .CK(
        clk), .Q(t_DR[28]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_5_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[5]), .CK(
        clk), .Q(t_DR[29]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_6_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[6]), .CK(
        clk), .Q(t_DR[30]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_7_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[7]), .CK(
        clk), .Q(t_DR[31]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_8_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[8]), .CK(
        clk), .Q(t_DR[32]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_9_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[9]), .CK(
        clk), .Q(t_DR[33]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_10_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[10]), 
        .CK(clk), .Q(t_DR[34]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_11_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[11]), 
        .CK(clk), .Q(t_DR[35]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_12_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[12]), 
        .CK(clk), .Q(t_DR[36]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_13_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[13]), 
        .CK(clk), .Q(t_DR[37]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_14_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[14]), 
        .CK(clk), .Q(t_DR[38]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_15_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[15]), 
        .CK(clk), .Q(t_DR[39]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_16_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[16]), 
        .CK(clk), .Q(t_DR[40]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_17_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[17]), 
        .CK(clk), .Q(t_DR[41]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_18_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[18]), 
        .CK(clk), .Q(t_DR[42]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_19_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[19]), 
        .CK(clk), .Q(t_DR[43]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_20_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[20]), 
        .CK(clk), .Q(t_DR[44]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_21_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[21]), 
        .CK(clk), .Q(t_DR[45]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_22_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[22]), 
        .CK(clk), .Q(t_DR[46]), .QN() );
  DFF_X1 gen_layer__3__gen_default__gen_default_prch__reg_t_inst_reg_inst_q_reg_23_ ( 
        .D(gen_layer__3__gen_default__gen_default_prch__reg_t_inst_w[23]), 
        .CK(clk), .Q(t_DR[47]), .QN() );
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
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__tmp_flat[4]) );
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
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__tmp_flat[5]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U1_U1 ( 
        .A1(r_DR[3]), .A2(r_DR[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[0]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U2_U1 ( 
        .A1(r_DR[1]), .A2(r_DR[2]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U3_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[0]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U1_U1 ( 
        .A1(r_DR[2]), .A2(r_DR[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[0]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U2_U1 ( 
        .A1(r_DR[1]), .A2(r_DR[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U3_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U1_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__tmp_flat[5]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[0]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U2_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__tmp_flat[4]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U3_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[0]), .ZN(z_consecutive[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U1_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__tmp_flat[4]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[0]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U2_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__tmp_flat[5]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U3_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[0]), .ZN(z_consecutive[2]) );
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
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[2]) );
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
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[3]) );
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
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[4]) );
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
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[5]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U1_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[3]), .A2(r_DR[4]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[0]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U2_U1 ( 
        .A1(r_DR[5]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[2]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U3_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[0]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U1_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[2]), .A2(r_DR[4]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[0]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U2_U1 ( 
        .A1(r_DR[5]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U3_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U1_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[5]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[0]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U2_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[4]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U3_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[0]), .ZN(z_consecutive[3]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U1_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[4]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[0]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U2_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__tmp_flat[5]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U3_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__2__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[0]), .ZN(z_consecutive[4]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(b[5]), .A2(a[5]), .A3(t_DR[27]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(b[6]), .A2(a[5]), .A3(t_DR[26]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(b[5]), .A2(a[6]), .A3(t_DR[25]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(b[6]), .A2(a[6]), .A3(t_DR[24]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[0]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(b[5]), .A2(a[5]), .A3(t_DR[31]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(b[6]), .A2(a[5]), .A3(t_DR[30]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(b[5]), .A2(a[6]), .A3(t_DR[29]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(b[6]), .A2(a[6]), .A3(t_DR[28]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[1]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(b[5]), .A2(a[5]), .A3(t_DR[35]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(b[6]), .A2(a[5]), .A3(t_DR[34]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(b[5]), .A2(a[6]), .A3(t_DR[33]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(b[6]), .A2(a[6]), .A3(t_DR[32]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[2]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(b[5]), .A2(a[5]), .A3(t_DR[39]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(b[6]), .A2(a[5]), .A3(t_DR[38]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(b[5]), .A2(a[6]), .A3(t_DR[37]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(b[6]), .A2(a[6]), .A3(t_DR[36]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__1__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[3]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(b[5]), .A2(a[5]), .A3(t_DR[43]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(b[6]), .A2(a[5]), .A3(t_DR[42]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(b[5]), .A2(a[6]), .A3(t_DR[41]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(b[6]), .A2(a[6]), .A3(t_DR[40]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[4]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(b[5]), .A2(a[5]), .A3(t_DR[47]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(b[6]), .A2(a[5]), .A3(t_DR[46]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(b[5]), .A2(a[6]), .A3(t_DR[45]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(b[6]), .A2(a[6]), .A3(t_DR[44]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__mux_L_inst_loop_gen_parallel_muxes__2__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[5]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U1_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[3]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[0]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U2_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[2]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U3_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[0]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U1_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[2]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[0]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U2_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[3]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U3_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U1_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[5]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[0]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U2_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[4]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_U3_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U1_w[0]), .ZN(z[5]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U1_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[4]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[0]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[0]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U2_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_next_tree_stage_inputs[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__tmp_flat[5]), .ZN(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[1]) );
  NAND2_X1 nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_U3_U1 ( 
        .A1(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[1]), .A2(
        nonlinear_consecutive_inst_gen_consecutive_layer__3__gen_default__gen_DR__xor_tree_L_inst_gen_tree__xor_tree_inst_gen_tree__loop_gen_nodes__0__xor_inst_genblk1_xor_inst_U2_w[0]), .ZN(z[6]) );
  DFF_X1 gen_output_alignment__reg_z_layer0_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(z_internal_0_), .CK(clk), .Q(
        gen_output_alignment__reg_z_layer0_inst_z_1_), .QN() );
  DFF_X1 gen_output_alignment__reg_z_layer0_inst_loop_gen_regs__1__reg_inst_q_reg_0_ ( 
        .D(gen_output_alignment__reg_z_layer0_inst_z_1_), .CK(clk), .Q(
        gen_output_alignment__reg_z_layer0_inst_z_2_), .QN() );
  DFF_X1 gen_output_alignment__reg_z_layer0_inst_loop_gen_regs__2__reg_inst_q_reg_0_ ( 
        .D(gen_output_alignment__reg_z_layer0_inst_z_2_), .CK(clk), .Q(z[0]), 
        .QN() );
  DFF_X1 gen_output_alignment__gen_layer__1__gen_rail__0__reg_z_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(z_consecutive[1]), .CK(clk), .Q(
        gen_output_alignment__gen_layer__1__gen_rail__0__reg_z_inst_z_1_), 
        .QN() );
  DFF_X1 gen_output_alignment__gen_layer__1__gen_rail__0__reg_z_inst_loop_gen_regs__1__reg_inst_q_reg_0_ ( 
        .D(gen_output_alignment__gen_layer__1__gen_rail__0__reg_z_inst_z_1_), 
        .CK(clk), .Q(z[1]), .QN() );
  DFF_X1 gen_output_alignment__gen_layer__1__gen_rail__1__reg_z_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(z_consecutive[2]), .CK(clk), .Q(
        gen_output_alignment__gen_layer__1__gen_rail__1__reg_z_inst_z_1_), 
        .QN() );
  DFF_X1 gen_output_alignment__gen_layer__1__gen_rail__1__reg_z_inst_loop_gen_regs__1__reg_inst_q_reg_0_ ( 
        .D(gen_output_alignment__gen_layer__1__gen_rail__1__reg_z_inst_z_1_), 
        .CK(clk), .Q(z[2]), .QN() );
  DFF_X1 gen_output_alignment__gen_layer__2__gen_rail__0__reg_z_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(z_consecutive[3]), .CK(clk), .Q(z[3]), .QN() );
  DFF_X1 gen_output_alignment__gen_layer__2__gen_rail__1__reg_z_inst_loop_gen_regs__0__reg_inst_q_reg_0_ ( 
        .D(z_consecutive[4]), .CK(clk), .Q(z[4]), .QN() );
endmodule

