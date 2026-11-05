/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : W-2024.09-SP2
// Date      : Sun Sep 20 13:30:19 2026
/////////////////////////////////////////////////////////////


module Looped_Sbox_BP_impr_generic_duality ( clk, rst, r_SR, r_duality0, 
        r_duality1, a, z, prch0_o, prch1_o );
  input [32:0] r_SR;
  input [1:0] r_duality0;
  input [1:0] r_duality1;
  input [15:0] a;
  output [15:0] z;
  output [0:0] prch0_o;
  output [0:0] prch1_o;
  input clk, rst;
  wire   sel_1_, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, Controller_inst_n14,
         Controller_inst_n13, Controller_inst_n12, Controller_inst_n11,
         Controller_inst_n10, Controller_inst_n9, Controller_inst_n8,
         Controller_inst_n7, Controller_inst_n2, Controller_inst_n1,
         Controller_inst_N18, Controller_inst_N17, Controller_inst_N16,
         Controller_inst_N15, Controller_inst_N14, Controller_inst_N13,
         Controller_inst_N12, Controller_inst_N11, Controller_inst_Rcon_0_,
         Controller_inst_Rcon_1_, Controller_inst_Rcon_2_,
         Controller_inst_Rcon_3_, Controller_inst_Rcon_4_,
         Controller_inst_Rcon_5_, Controller_inst_Rcon_6_,
         Controller_inst_Rcon_7_, Controller_inst_MCsel_1_, SBox_inst_n10,
         SBox_inst_n8, SBox_inst_m_post1_41__1_, SBox_inst_m_post1_41__2_,
         SBox_inst_m_post1_42__1_, SBox_inst_m_post1_42__2_,
         SBox_inst_m_post1_43__1_, SBox_inst_m_post1_43__2_,
         SBox_inst_m_post1_44__1_, SBox_inst_m_post1_44__2_,
         SBox_inst_m_post1_45__1_, SBox_inst_m_post1_45__2_,
         SBox_inst_m_post0_41__1_, SBox_inst_m_post0_41__2_,
         SBox_inst_m_post0_42__1_, SBox_inst_m_post0_42__2_,
         SBox_inst_m_post0_43__1_, SBox_inst_m_post0_43__2_,
         SBox_inst_m_post0_44__1_, SBox_inst_m_post0_44__2_,
         SBox_inst_m_post0_45__1_, SBox_inst_m_post0_45__2_,
         SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv,
         SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv,
         SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv,
         SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv,
         SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_gen_round_state_reg_intermediate_inputs_layer_0__t5_inv,
         SBox_inst_t5_SR2DR_1_,
         SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv,
         SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv,
         SBox_inst_sboxInput1_reg_0__1_, SBox_inst_sboxInput1_reg_0__2_,
         SBox_inst_sboxInput1_reg_1__1_, SBox_inst_sboxInput1_reg_1__2_,
         SBox_inst_sboxInput1_reg_2__1_, SBox_inst_sboxInput1_reg_2__2_,
         SBox_inst_sboxInput1_reg_4__1_, SBox_inst_sboxInput1_reg_4__2_,
         SBox_inst_sboxInput1_reg_5__1_, SBox_inst_sboxInput1_reg_5__2_,
         SBox_inst_sboxInput1_reg_6__1_, SBox_inst_sboxInput1_reg_6__2_,
         SBox_inst_sboxInput1_reg_7__1_, SBox_inst_sboxInput1_reg_7__2_,
         SBox_inst_sboxInput0_reg_0__1_, SBox_inst_sboxInput0_reg_0__2_,
         SBox_inst_sboxInput0_reg_1__1_, SBox_inst_sboxInput0_reg_1__2_,
         SBox_inst_sboxInput0_reg_2__1_, SBox_inst_sboxInput0_reg_2__2_,
         SBox_inst_sboxInput0_reg_4__1_, SBox_inst_sboxInput0_reg_4__2_,
         SBox_inst_sboxInput0_reg_5__1_, SBox_inst_sboxInput0_reg_5__2_,
         SBox_inst_sboxInput0_reg_6__1_, SBox_inst_sboxInput0_reg_6__2_,
         SBox_inst_sboxInput0_reg_7__1_, SBox_inst_sboxInput0_reg_7__2_,
         SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv,
         SBox_inst_sboxOutput_0__0_, SBox_inst_sboxOutput_1__0_,
         SBox_inst_sboxOutput_2__0_, SBox_inst_sboxOutput_3__0_,
         SBox_inst_sboxOutput_4__0_, SBox_inst_sboxOutput_5__0_,
         SBox_inst_sboxOutput_6__0_, SBox_inst_sboxOutput_7__0_,
         SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_,
         SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_,
         SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_,
         SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_,
         SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_,
         SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_,
         SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_,
         SBox_inst_AND_M1_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_,
         SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_,
         SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_,
         SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_,
         SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_,
         SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_,
         SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_,
         SBox_inst_AND_M2_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_,
         SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_,
         SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_,
         SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_,
         SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_,
         SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_,
         SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_,
         SBox_inst_AND_M4_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_,
         SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_,
         SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_,
         SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_,
         SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_,
         SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_,
         SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_,
         SBox_inst_AND_M6_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_,
         SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_,
         SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_,
         SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_,
         SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_,
         SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_,
         SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_,
         SBox_inst_AND_M7_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_,
         SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_,
         SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_,
         SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_,
         SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_,
         SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_,
         SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_,
         SBox_inst_AND_M9_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_,
         SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_,
         SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_,
         SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_,
         SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_,
         SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_,
         SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_,
         SBox_inst_AND_M11_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_,
         SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_,
         SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_,
         SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_,
         SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_,
         SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_,
         SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_,
         SBox_inst_AND_M12_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_,
         SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_,
         SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_,
         SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_,
         SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_,
         SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_,
         SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_,
         SBox_inst_AND_M14_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_,
         SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_,
         SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_,
         SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_,
         SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_,
         SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_,
         SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_,
         SBox_inst_AND_B0_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_B0_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_B0_nonlinear_precomp_a_delayed_0__0_,
         SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_,
         SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_,
         SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_,
         SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_,
         SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_,
         SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_,
         SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_,
         SBox_inst_AND_B1_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_,
         SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_,
         SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_,
         SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_,
         SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_,
         SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_,
         SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_,
         SBox_inst_AND_E0_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_E0_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_E0_nonlinear_precomp_a_delayed_0__0_,
         SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_,
         SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_,
         SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_,
         SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_,
         SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_,
         SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_,
         SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_,
         SBox_inst_AND_E1_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_E1_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_E1_nonlinear_precomp_a_delayed_0__0_,
         SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_,
         SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_,
         SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_,
         SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_,
         SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_,
         SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_,
         SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_,
         SBox_inst_AND_F0_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_F0_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_F0_nonlinear_precomp_a_delayed_0__0_,
         SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_,
         SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_,
         SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_,
         SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_,
         SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_,
         SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_,
         SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_,
         SBox_inst_AND_F1_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_F1_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_F1_nonlinear_precomp_a_delayed_0__0_,
         SBox_inst_AND_M46_t_1_, SBox_inst_AND_M46_t_2_,
         SBox_inst_AND_M46_t_3_, SBox_inst_AND_M46_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M46_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_,
         SBox_inst_AND_M47_t_1_, SBox_inst_AND_M47_t_2_,
         SBox_inst_AND_M47_t_3_, SBox_inst_AND_M47_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M47_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_,
         SBox_inst_AND_M48_t_1_, SBox_inst_AND_M48_t_2_,
         SBox_inst_AND_M48_t_3_, SBox_inst_AND_M48_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M48_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_,
         SBox_inst_AND_M49_t_1_, SBox_inst_AND_M49_t_2_,
         SBox_inst_AND_M49_t_3_, SBox_inst_AND_M49_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M49_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_,
         SBox_inst_AND_M50_t_1_, SBox_inst_AND_M50_t_2_,
         SBox_inst_AND_M50_t_3_, SBox_inst_AND_M50_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M50_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_,
         SBox_inst_AND_M51_t_1_, SBox_inst_AND_M51_t_2_,
         SBox_inst_AND_M51_t_3_, SBox_inst_AND_M51_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M51_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_,
         SBox_inst_AND_M52_t_1_, SBox_inst_AND_M52_t_2_,
         SBox_inst_AND_M52_t_3_, SBox_inst_AND_M52_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M52_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_,
         SBox_inst_AND_M53_t_1_, SBox_inst_AND_M53_t_2_,
         SBox_inst_AND_M53_t_3_, SBox_inst_AND_M53_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M53_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_,
         SBox_inst_AND_M54_t_1_, SBox_inst_AND_M54_t_2_,
         SBox_inst_AND_M54_t_3_, SBox_inst_AND_M54_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M54_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_,
         SBox_inst_AND_M55_t_1_, SBox_inst_AND_M55_t_2_,
         SBox_inst_AND_M55_t_3_, SBox_inst_AND_M55_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M55_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M55_nonlinear_precomp_a_delayed_0__0_,
         SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_,
         SBox_inst_AND_M56_t_1_, SBox_inst_AND_M56_t_2_,
         SBox_inst_AND_M56_t_3_, SBox_inst_AND_M56_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M56_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M56_nonlinear_precomp_a_delayed_0__0_,
         SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_,
         SBox_inst_AND_M57_t_1_, SBox_inst_AND_M57_t_2_,
         SBox_inst_AND_M57_t_3_, SBox_inst_AND_M57_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M57_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M57_nonlinear_precomp_a_delayed_0__0_,
         SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_,
         SBox_inst_AND_M58_t_1_, SBox_inst_AND_M58_t_2_,
         SBox_inst_AND_M58_t_3_, SBox_inst_AND_M58_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M58_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M58_nonlinear_precomp_a_delayed_0__0_,
         SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_,
         SBox_inst_AND_M59_t_1_, SBox_inst_AND_M59_t_2_,
         SBox_inst_AND_M59_t_3_, SBox_inst_AND_M59_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M59_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M59_nonlinear_precomp_a_delayed_0__0_,
         SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_,
         SBox_inst_AND_M60_t_1_, SBox_inst_AND_M60_t_2_,
         SBox_inst_AND_M60_t_3_, SBox_inst_AND_M60_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M60_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M60_nonlinear_precomp_a_delayed_0__0_,
         SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_,
         SBox_inst_AND_M61_t_1_, SBox_inst_AND_M61_t_2_,
         SBox_inst_AND_M61_t_3_, SBox_inst_AND_M61_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M61_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M61_nonlinear_precomp_a_delayed_0__0_,
         SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_,
         SBox_inst_AND_M62_t_1_, SBox_inst_AND_M62_t_2_,
         SBox_inst_AND_M62_t_3_, SBox_inst_AND_M62_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M62_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M62_nonlinear_precomp_a_delayed_0__0_,
         SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_,
         SBox_inst_AND_M63_t_1_, SBox_inst_AND_M63_t_2_,
         SBox_inst_AND_M63_t_3_, SBox_inst_AND_M63_nonlinear_layer0_a0nandb0,
         SBox_inst_AND_M63_nonlinear_precomp_b_delayed_0__0_,
         SBox_inst_AND_M63_nonlinear_precomp_a_delayed_0__0_,
         SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_,
         SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_
;
  wire   [2:1] Controller_inst_shifted_reg_msb_delayed;
  wire   [59:0] SBox_inst_l;
  wire   [35:0] SBox_inst_m_merged;
  wire   [7:0] SBox_inst_inv_l1;
  wire   [7:0] SBox_inst_inv_l0;
  wire   [3:0] SBox_inst_inv_f1;
  wire   [3:0] SBox_inst_inv_f0;
  wire   [1:0] SBox_inst_inv_f;
  wire   [3:0] SBox_inst_inv_e1;
  wire   [3:0] SBox_inst_inv_e0;
  wire   [1:0] SBox_inst_inv_e;
  wire   [3:0] SBox_inst_inv_d1;
  wire   [3:0] SBox_inst_inv_d0;
  wire   [3:0] SBox_inst_inv_c1;
  wire   [3:0] SBox_inst_inv_c0;
  wire   [3:0] SBox_inst_inv_b1;
  wire   [3:0] SBox_inst_inv_b0;
  wire   [1:0] SBox_inst_inv_b;
  wire   [3:0] SBox_inst_inv_a1;
  wire   [3:0] SBox_inst_inv_a0;
  wire   [45:0] SBox_inst_m1;
  wire   [45:0] SBox_inst_m0;
  wire   [19:1] SBox_inst_m;
  wire  
         [2:1] SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl
;
  wire  
         [2:1] SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl
;
  wire  
         [2:1] SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl
;
  wire  
         [2:1] SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl
;
  wire  
         [2:1] SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl
;
  wire  
         [2:1] SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl
;
  wire  
         [2:1] SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl
;
  wire  
         [2:1] SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl
;
  wire   [53:0] SBox_inst_t1;
  wire   [53:0] SBox_inst_t0;
  wire   [26:5] SBox_inst_t;
  wire  
         [2:1] SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_t5_1_ctrl
;
  wire  
         [2:1] SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_t5_0_ctrl
;
  wire  
         [2:1] SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl
;
  wire  
         [2:1] SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl
;
  wire  
         [2:1] SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl
;
  wire  
         [2:1] SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl
;
  wire  
         [2:1] SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl
;
  wire  
         [2:1] SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl
;
  wire  
         [1:0] SBox_inst_XOR_T01_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T01_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T02_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T02_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T03_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T03_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T04_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T04_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T06_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T06_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T07_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T07_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T08_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T08_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T09_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T09_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T11_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T11_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T12_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T12_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T14_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T14_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T24_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T24_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T25_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T25_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T26_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T26_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T27_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_T27_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire   [7:0] SBox_inst_AND_M1_t_DR1;
  wire   [7:0] SBox_inst_AND_M1_t_DR0;
  wire  
         [7:0] SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w
;
  wire  
         [7:0] SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w
;
  wire  
         [3:0] SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire   [7:0] SBox_inst_AND_M2_t_DR1;
  wire   [7:0] SBox_inst_AND_M2_t_DR0;
  wire  
         [7:0] SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w
;
  wire  
         [7:0] SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w
;
  wire  
         [3:0] SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire   [7:0] SBox_inst_AND_M4_t_DR1;
  wire   [7:0] SBox_inst_AND_M4_t_DR0;
  wire  
         [7:0] SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w
;
  wire  
         [7:0] SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w
;
  wire  
         [3:0] SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M5_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M5_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire   [7:0] SBox_inst_AND_M6_t_DR1;
  wire   [7:0] SBox_inst_AND_M6_t_DR0;
  wire  
         [7:0] SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w
;
  wire  
         [7:0] SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w
;
  wire  
         [3:0] SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire   [7:0] SBox_inst_AND_M7_t_DR1;
  wire   [7:0] SBox_inst_AND_M7_t_DR0;
  wire  
         [7:0] SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w
;
  wire  
         [7:0] SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w
;
  wire  
         [3:0] SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M8_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M8_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire   [7:0] SBox_inst_AND_M9_t_DR1;
  wire   [7:0] SBox_inst_AND_M9_t_DR0;
  wire  
         [7:0] SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w
;
  wire  
         [7:0] SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w
;
  wire  
         [3:0] SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire   [7:0] SBox_inst_AND_M11_t_DR1;
  wire   [7:0] SBox_inst_AND_M11_t_DR0;
  wire  
         [7:0] SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w
;
  wire  
         [7:0] SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w
;
  wire  
         [3:0] SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire   [7:0] SBox_inst_AND_M12_t_DR1;
  wire   [7:0] SBox_inst_AND_M12_t_DR0;
  wire  
         [7:0] SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w
;
  wire  
         [7:0] SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w
;
  wire  
         [3:0] SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire   [7:0] SBox_inst_AND_M14_t_DR1;
  wire   [7:0] SBox_inst_AND_M14_t_DR0;
  wire  
         [7:0] SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w
;
  wire  
         [7:0] SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w
;
  wire  
         [3:0] SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_A0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_A0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_A1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_A1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire   [7:0] SBox_inst_AND_B0_t_DR1;
  wire   [7:0] SBox_inst_AND_B0_t_DR0;
  wire  
         [7:0] SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w
;
  wire  
         [7:0] SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w
;
  wire  
         [3:0] SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire   [7:0] SBox_inst_AND_B1_t_DR1;
  wire   [7:0] SBox_inst_AND_B1_t_DR0;
  wire  
         [7:0] SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w
;
  wire  
         [7:0] SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w
;
  wire  
         [3:0] SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_C0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_C0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_C1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_C1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_D0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_D0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_D1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_D1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire   [7:0] SBox_inst_AND_E0_t_DR1;
  wire   [7:0] SBox_inst_AND_E0_t_DR0;
  wire  
         [7:0] SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w
;
  wire  
         [7:0] SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w
;
  wire  
         [3:0] SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire   [7:0] SBox_inst_AND_E1_t_DR1;
  wire   [7:0] SBox_inst_AND_E1_t_DR0;
  wire  
         [7:0] SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w
;
  wire  
         [7:0] SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w
;
  wire  
         [3:0] SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire   [7:0] SBox_inst_AND_F0_t_DR1;
  wire   [7:0] SBox_inst_AND_F0_t_DR0;
  wire  
         [7:0] SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w
;
  wire  
         [7:0] SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w
;
  wire  
         [3:0] SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire   [7:0] SBox_inst_AND_F1_t_DR1;
  wire   [7:0] SBox_inst_AND_F1_t_DR0;
  wire  
         [7:0] SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w
;
  wire  
         [7:0] SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w
;
  wire  
         [3:0] SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_L3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_L3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_L2_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_L2_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_L1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_L1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_L0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_L0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M41_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M41_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M42_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M42_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M43_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M43_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M44_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M44_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M45_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire  
         [1:0] SBox_inst_XOR_M45_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w
;
  wire   [3:0] SBox_inst_AND_M46_t_SR1;
  wire   [3:0] SBox_inst_AND_M46_t_SR0;
  wire   [3:0] SBox_inst_AND_M46_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M46_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire   [3:0] SBox_inst_AND_M47_t_SR1;
  wire   [3:0] SBox_inst_AND_M47_t_SR0;
  wire   [3:0] SBox_inst_AND_M47_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M47_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire   [3:0] SBox_inst_AND_M48_t_SR1;
  wire   [3:0] SBox_inst_AND_M48_t_SR0;
  wire   [3:0] SBox_inst_AND_M48_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M48_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire   [3:0] SBox_inst_AND_M49_t_SR1;
  wire   [3:0] SBox_inst_AND_M49_t_SR0;
  wire   [3:0] SBox_inst_AND_M49_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M49_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire   [3:0] SBox_inst_AND_M50_t_SR1;
  wire   [3:0] SBox_inst_AND_M50_t_SR0;
  wire   [3:0] SBox_inst_AND_M50_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M50_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire   [3:0] SBox_inst_AND_M51_t_SR1;
  wire   [3:0] SBox_inst_AND_M51_t_SR0;
  wire   [3:0] SBox_inst_AND_M51_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M51_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire   [3:0] SBox_inst_AND_M52_t_SR1;
  wire   [3:0] SBox_inst_AND_M52_t_SR0;
  wire   [3:0] SBox_inst_AND_M52_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M52_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire   [3:0] SBox_inst_AND_M53_t_SR1;
  wire   [3:0] SBox_inst_AND_M53_t_SR0;
  wire   [3:0] SBox_inst_AND_M53_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M53_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire   [3:0] SBox_inst_AND_M54_t_SR1;
  wire   [3:0] SBox_inst_AND_M54_t_SR0;
  wire   [3:0] SBox_inst_AND_M54_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M54_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire   [3:0] SBox_inst_AND_M55_t_SR1;
  wire   [3:0] SBox_inst_AND_M55_t_SR0;
  wire   [3:0] SBox_inst_AND_M55_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M55_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire   [3:0] SBox_inst_AND_M56_t_SR1;
  wire   [3:0] SBox_inst_AND_M56_t_SR0;
  wire   [3:0] SBox_inst_AND_M56_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M56_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire   [3:0] SBox_inst_AND_M57_t_SR1;
  wire   [3:0] SBox_inst_AND_M57_t_SR0;
  wire   [3:0] SBox_inst_AND_M57_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M57_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire   [3:0] SBox_inst_AND_M58_t_SR1;
  wire   [3:0] SBox_inst_AND_M58_t_SR0;
  wire   [3:0] SBox_inst_AND_M58_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M58_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire   [3:0] SBox_inst_AND_M59_t_SR1;
  wire   [3:0] SBox_inst_AND_M59_t_SR0;
  wire   [3:0] SBox_inst_AND_M59_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M59_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire   [3:0] SBox_inst_AND_M60_t_SR1;
  wire   [3:0] SBox_inst_AND_M60_t_SR0;
  wire   [3:0] SBox_inst_AND_M60_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M60_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire   [3:0] SBox_inst_AND_M61_t_SR1;
  wire   [3:0] SBox_inst_AND_M61_t_SR0;
  wire   [3:0] SBox_inst_AND_M61_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M61_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire   [3:0] SBox_inst_AND_M62_t_SR1;
  wire   [3:0] SBox_inst_AND_M62_t_SR0;
  wire   [3:0] SBox_inst_AND_M62_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M62_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire   [3:0] SBox_inst_AND_M63_t_SR1;
  wire   [3:0] SBox_inst_AND_M63_t_SR0;
  wire   [3:0] SBox_inst_AND_M63_gen_layer__1__reg_t_inst0_w;
  wire   [3:0] SBox_inst_AND_M63_gen_layer__1__reg_t_inst1_w;
  wire  
         [3:0] SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;
  wire  
         [3:0] SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w
;

  INV_X1 U68 ( .A(sel_1_), .ZN(n83) );
  AOI22_X1 U69 ( .A1(sel_1_), .A2(a[1]), .B1(z[1]), .B2(n83), .ZN(n68) );
  INV_X1 U70 ( .A(n68), .ZN(n61) );
  AOI22_X1 U71 ( .A1(sel_1_), .A2(a[11]), .B1(z[11]), .B2(n83), .ZN(n69) );
  INV_X1 U72 ( .A(n69), .ZN(n60) );
  AOI22_X1 U73 ( .A1(sel_1_), .A2(a[9]), .B1(z[9]), .B2(n83), .ZN(n70) );
  INV_X1 U74 ( .A(n70), .ZN(n62) );
  AOI22_X1 U75 ( .A1(sel_1_), .A2(a[15]), .B1(z[15]), .B2(n83), .ZN(n71) );
  INV_X1 U76 ( .A(n71), .ZN(n63) );
  AOI22_X1 U77 ( .A1(sel_1_), .A2(a[13]), .B1(z[13]), .B2(n83), .ZN(n72) );
  INV_X1 U78 ( .A(n72), .ZN(n64) );
  AOI22_X1 U79 ( .A1(sel_1_), .A2(a[5]), .B1(z[5]), .B2(n83), .ZN(n73) );
  INV_X1 U80 ( .A(n73), .ZN(n65) );
  AOI22_X1 U81 ( .A1(sel_1_), .A2(a[3]), .B1(z[3]), .B2(n83), .ZN(n74) );
  INV_X1 U82 ( .A(n74), .ZN(n66) );
  AOI22_X1 U83 ( .A1(sel_1_), .A2(a[7]), .B1(z[7]), .B2(n83), .ZN(n75) );
  INV_X1 U84 ( .A(n75), .ZN(n67) );
  AOI22_X1 U85 ( .A1(sel_1_), .A2(a[2]), .B1(z[2]), .B2(n83), .ZN(n76) );
  INV_X1 U86 ( .A(n76), .ZN(n56) );
  AOI22_X1 U87 ( .A1(sel_1_), .A2(a[6]), .B1(z[6]), .B2(n83), .ZN(n77) );
  INV_X1 U88 ( .A(n77), .ZN(n57) );
  AOI22_X1 U89 ( .A1(sel_1_), .A2(a[14]), .B1(z[14]), .B2(n83), .ZN(n78) );
  INV_X1 U90 ( .A(n78), .ZN(n59) );
  AOI22_X1 U91 ( .A1(sel_1_), .A2(a[10]), .B1(z[10]), .B2(n83), .ZN(n79) );
  INV_X1 U92 ( .A(n79), .ZN(n54) );
  AOI22_X1 U93 ( .A1(sel_1_), .A2(a[12]), .B1(z[12]), .B2(n83), .ZN(n80) );
  INV_X1 U94 ( .A(n80), .ZN(n55) );
  AOI22_X1 U95 ( .A1(sel_1_), .A2(a[0]), .B1(z[0]), .B2(n83), .ZN(n81) );
  INV_X1 U96 ( .A(n81), .ZN(
        SBox_inst_AND_M48_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 U97 ( .A1(sel_1_), .A2(a[4]), .B1(z[4]), .B2(n83), .ZN(n82) );
  INV_X1 U98 ( .A(n82), .ZN(n53) );
  AOI22_X1 U99 ( .A1(sel_1_), .A2(a[8]), .B1(z[8]), .B2(n83), .ZN(n84) );
  INV_X1 U100 ( .A(n84), .ZN(n58) );
  AOI22_X1 Controller_inst_U13 ( .A1(Controller_inst_n2), .A2(
        Controller_inst_n12), .B1(Controller_inst_N11), .B2(
        Controller_inst_Rcon_3_), .ZN(Controller_inst_N15) );
  AOI22_X1 Controller_inst_U12 ( .A1(Controller_inst_Rcon_0_), .A2(
        Controller_inst_N11), .B1(Controller_inst_n12), .B2(
        Controller_inst_n14), .ZN(Controller_inst_N12) );
  AOI22_X1 Controller_inst_U11 ( .A1(Controller_inst_Rcon_2_), .A2(
        Controller_inst_N11), .B1(Controller_inst_n12), .B2(
        Controller_inst_n13), .ZN(Controller_inst_N14) );
  OR2_X1 Controller_inst_U10 ( .A1(rst), .A2(Controller_inst_n1), .ZN(
        Controller_inst_n12) );
  NAND2_X1 Controller_inst_U9 ( .A1(Controller_inst_n1), .A2(
        Controller_inst_n11), .ZN(Controller_inst_N11) );
  NOR2_X1 Controller_inst_U8 ( .A1(rst), .A2(Controller_inst_n10), .ZN(
        Controller_inst_N13) );
  NOR2_X1 Controller_inst_U7 ( .A1(rst), .A2(Controller_inst_n9), .ZN(
        Controller_inst_N16) );
  NOR2_X1 Controller_inst_U6 ( .A1(rst), .A2(Controller_inst_n8), .ZN(
        Controller_inst_N17) );
  NOR2_X1 Controller_inst_U5 ( .A1(rst), .A2(Controller_inst_n7), .ZN(
        Controller_inst_N18) );
  INV_X1 Controller_inst_U4 ( .A(rst), .ZN(Controller_inst_n11) );
  NAND2_X2 Controller_inst_U3 ( .A1(prch1_o[0]), .A2(Controller_inst_n11), 
        .ZN(prch0_o[0]) );
  DFF_X1 Controller_inst_shifted_reg_reg_7_ ( .D(Controller_inst_N18), .CK(clk), .Q(Controller_inst_Rcon_7_), .QN(Controller_inst_n1) );
  DFF_X1 Controller_inst_shifted_reg_reg_6_ ( .D(Controller_inst_N17), .CK(clk), .Q(Controller_inst_Rcon_6_), .QN(Controller_inst_n7) );
  DFF_X1 Controller_inst_shifted_reg_reg_5_ ( .D(Controller_inst_N16), .CK(clk), .Q(Controller_inst_Rcon_5_), .QN(Controller_inst_n8) );
  DFF_X1 Controller_inst_shifted_reg_reg_4_ ( .D(Controller_inst_N15), .CK(clk), .Q(Controller_inst_Rcon_4_), .QN(Controller_inst_n9) );
  DFF_X1 Controller_inst_shifted_reg_reg_3_ ( .D(Controller_inst_N14), .CK(clk), .Q(Controller_inst_Rcon_3_), .QN(Controller_inst_n2) );
  DFF_X1 Controller_inst_shifted_reg_reg_2_ ( .D(Controller_inst_N13), .CK(clk), .Q(Controller_inst_Rcon_2_), .QN(Controller_inst_n13) );
  DFF_X1 Controller_inst_shifted_reg_reg_1_ ( .D(Controller_inst_N12), .CK(clk), .Q(Controller_inst_Rcon_1_), .QN(Controller_inst_n10) );
  DFF_X1 Controller_inst_shifted_reg_reg_0_ ( .D(Controller_inst_N11), .CK(clk), .Q(Controller_inst_Rcon_0_), .QN(Controller_inst_n14) );
  DFF_X1 Controller_inst_reg_rst_inst_q_reg_0_ ( .D(rst), .CK(clk), .Q(sel_1_), 
        .QN() );
  DFF_X1 Controller_inst_reg_shifted_msb_inst_q_reg_0_ ( .D(
        Controller_inst_Rcon_7_), .CK(clk), .Q(
        Controller_inst_shifted_reg_msb_delayed[1]), .QN() );
  DFF_X1 Controller_inst_reg_shifted_msb_inst_q_reg_1_ ( .D(
        Controller_inst_shifted_reg_msb_delayed[1]), .CK(clk), .Q(
        Controller_inst_shifted_reg_msb_delayed[2]), .QN() );
  DFF_X1 Controller_inst_reg_shifted_msb_inst_q_reg_2_ ( .D(
        Controller_inst_shifted_reg_msb_delayed[2]), .CK(clk), .Q(
        Controller_inst_MCsel_1_), .QN() );
  DFF_X2 Controller_inst_reg_prch_d2_inst_q_reg_0_ ( .D(prch0_o[0]), .CK(clk), 
        .Q(prch1_o[0]), .QN() );
  BUF_X16 SBox_inst_U3 ( .A(prch1_o[0]), .Z(SBox_inst_n8) );
  BUF_X16 SBox_inst_U2 ( .A(prch0_o[0]), .Z(SBox_inst_n10) );
  INV_X1 SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__not_inst_U1 ( 
        .A(n61), .ZN(
        SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv) );
  NOR2_X1 SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t0_t_inst0_U1 ( 
        .A1(prch0_o[0]), .A2(
        SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv), .ZN(
        SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[1]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t0_f_inst0_U1 ( 
        .A1(SBox_inst_n10), .A2(n61), .ZN(
        SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[2]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t1_t_inst0_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv), .ZN(
        SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[1]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t1_f_inst0_U1 ( 
        .A1(SBox_inst_n8), .A2(n61), .ZN(
        SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[2]) );
  DFF_X1 SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_0_inst_q_reg_0_ ( 
        .D(
        SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[1]), .CK(clk), .Q(SBox_inst_sboxInput0_reg_0__1_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_0_inst_q_reg_1_ ( 
        .D(
        SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[2]), .CK(clk), .Q(SBox_inst_sboxInput0_reg_0__2_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_1_inst_q_reg_0_ ( 
        .D(
        SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[1]), .CK(clk), .Q(SBox_inst_sboxInput1_reg_0__1_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_1_inst_q_reg_1_ ( 
        .D(
        SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[2]), .CK(clk), .Q(SBox_inst_sboxInput1_reg_0__2_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_0__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_layer0_inst_q_reg_0_ ( 
        .D(SBox_inst_sboxOutput_0__0_), .CK(clk), .Q(z[0]), .QN() );
  INV_X1 SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__not_inst_U1 ( 
        .A(n66), .ZN(
        SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv) );
  NOR2_X1 SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t0_t_inst0_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv), .ZN(
        SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[1]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t0_f_inst0_U1 ( 
        .A1(SBox_inst_n10), .A2(n66), .ZN(
        SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[2]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t1_t_inst0_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv), .ZN(
        SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[1]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t1_f_inst0_U1 ( 
        .A1(SBox_inst_n8), .A2(n66), .ZN(
        SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[2]) );
  DFF_X1 SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_0_inst_q_reg_0_ ( 
        .D(
        SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[1]), .CK(clk), .Q(SBox_inst_sboxInput0_reg_1__1_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_0_inst_q_reg_1_ ( 
        .D(
        SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[2]), .CK(clk), .Q(SBox_inst_sboxInput0_reg_1__2_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_1_inst_q_reg_0_ ( 
        .D(
        SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[1]), .CK(clk), .Q(SBox_inst_sboxInput1_reg_1__1_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_1_inst_q_reg_1_ ( 
        .D(
        SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[2]), .CK(clk), .Q(SBox_inst_sboxInput1_reg_1__2_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_1__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_layer0_inst_q_reg_0_ ( 
        .D(SBox_inst_sboxOutput_1__0_), .CK(clk), .Q(z[2]), .QN() );
  INV_X1 SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__not_inst_U1 ( 
        .A(n65), .ZN(
        SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv) );
  NOR2_X1 SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t0_t_inst0_U1 ( 
        .A1(prch0_o[0]), .A2(
        SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv), .ZN(
        SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[1]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t0_f_inst0_U1 ( 
        .A1(prch0_o[0]), .A2(n65), .ZN(
        SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[2]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t1_t_inst0_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv), .ZN(
        SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[1]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t1_f_inst0_U1 ( 
        .A1(SBox_inst_n8), .A2(n65), .ZN(
        SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[2]) );
  DFF_X1 SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_0_inst_q_reg_0_ ( 
        .D(
        SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[1]), .CK(clk), .Q(SBox_inst_sboxInput0_reg_2__1_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_0_inst_q_reg_1_ ( 
        .D(
        SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[2]), .CK(clk), .Q(SBox_inst_sboxInput0_reg_2__2_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_1_inst_q_reg_0_ ( 
        .D(
        SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[1]), .CK(clk), .Q(SBox_inst_sboxInput1_reg_2__1_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_1_inst_q_reg_1_ ( 
        .D(
        SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[2]), .CK(clk), .Q(SBox_inst_sboxInput1_reg_2__2_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_2__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_layer0_inst_q_reg_0_ ( 
        .D(SBox_inst_sboxOutput_2__0_), .CK(clk), .Q(z[4]), .QN() );
  INV_X1 SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_gen_round_state_reg_intermediate_inputs_layer_0__not_inst_U1 ( 
        .A(SBox_inst_t5_SR2DR_1_), .ZN(
        SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_gen_round_state_reg_intermediate_inputs_layer_0__t5_inv) );
  NOR2_X1 SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_gen_round_state_reg_intermediate_inputs_layer_0__ctrl_t0_t_inst0_U1 ( 
        .A1(prch0_o[0]), .A2(
        SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_gen_round_state_reg_intermediate_inputs_layer_0__t5_inv), .ZN(
        SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_t5_0_ctrl[1]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_gen_round_state_reg_intermediate_inputs_layer_0__ctrl_t0_f_inst0_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_t5_SR2DR_1_), .ZN(
        SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_t5_0_ctrl[2]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_gen_round_state_reg_intermediate_inputs_layer_0__ctrl_t1_t_inst0_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_gen_round_state_reg_intermediate_inputs_layer_0__t5_inv), .ZN(
        SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_t5_1_ctrl[1]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_gen_round_state_reg_intermediate_inputs_layer_0__ctrl_t1_f_inst0_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_t5_SR2DR_1_), .ZN(
        SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_t5_1_ctrl[2]) );
  DFF_X1 SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_reg_consecutive_0_inst_q_reg_0_ ( 
        .D(
        SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_t5_0_ctrl[1]), .CK(clk), .Q(SBox_inst_t0[8]), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_reg_consecutive_0_inst_q_reg_1_ ( 
        .D(
        SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_t5_0_ctrl[2]), .CK(clk), .Q(SBox_inst_t0[9]), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_reg_consecutive_1_inst_q_reg_0_ ( 
        .D(
        SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_t5_1_ctrl[1]), .CK(clk), .Q(SBox_inst_t1[8]), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_reg_consecutive_1_inst_q_reg_1_ ( 
        .D(
        SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_t5_1_ctrl[2]), .CK(clk), .Q(SBox_inst_t1[9]), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_3__gen_round_state_reg_sbox_inputs_gen_round_state_reg_intermediate_inputs_reg_layer0_inst_q_reg_0_ ( 
        .D(SBox_inst_sboxOutput_3__0_), .CK(clk), .Q(z[6]), .QN() );
  INV_X1 SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__not_inst_U1 ( 
        .A(n62), .ZN(
        SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv) );
  NOR2_X1 SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t0_t_inst0_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv), .ZN(
        SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[1]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t0_f_inst0_U1 ( 
        .A1(SBox_inst_n10), .A2(n62), .ZN(
        SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[2]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t1_t_inst0_U1 ( 
        .A1(prch1_o[0]), .A2(
        SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv), .ZN(
        SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[1]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t1_f_inst0_U1 ( 
        .A1(SBox_inst_n8), .A2(n62), .ZN(
        SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[2]) );
  DFF_X1 SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_0_inst_q_reg_0_ ( 
        .D(
        SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[1]), .CK(clk), .Q(SBox_inst_sboxInput0_reg_4__1_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_0_inst_q_reg_1_ ( 
        .D(
        SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[2]), .CK(clk), .Q(SBox_inst_sboxInput0_reg_4__2_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_1_inst_q_reg_0_ ( 
        .D(
        SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[1]), .CK(clk), .Q(SBox_inst_sboxInput1_reg_4__1_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_1_inst_q_reg_1_ ( 
        .D(
        SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[2]), .CK(clk), .Q(SBox_inst_sboxInput1_reg_4__2_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_4__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_layer0_inst_q_reg_0_ ( 
        .D(SBox_inst_sboxOutput_4__0_), .CK(clk), .Q(z[8]), .QN() );
  INV_X1 SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__not_inst_U1 ( 
        .A(n60), .ZN(
        SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv) );
  NOR2_X1 SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t0_t_inst0_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv), .ZN(
        SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[1]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t0_f_inst0_U1 ( 
        .A1(SBox_inst_n10), .A2(n60), .ZN(
        SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[2]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t1_t_inst0_U1 ( 
        .A1(prch1_o[0]), .A2(
        SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv), .ZN(
        SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[1]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t1_f_inst0_U1 ( 
        .A1(SBox_inst_n8), .A2(n60), .ZN(
        SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[2]) );
  DFF_X1 SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_0_inst_q_reg_0_ ( 
        .D(
        SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[1]), .CK(clk), .Q(SBox_inst_sboxInput0_reg_5__1_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_0_inst_q_reg_1_ ( 
        .D(
        SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[2]), .CK(clk), .Q(SBox_inst_sboxInput0_reg_5__2_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_1_inst_q_reg_0_ ( 
        .D(
        SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[1]), .CK(clk), .Q(SBox_inst_sboxInput1_reg_5__1_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_1_inst_q_reg_1_ ( 
        .D(
        SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[2]), .CK(clk), .Q(SBox_inst_sboxInput1_reg_5__2_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_5__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_layer0_inst_q_reg_0_ ( 
        .D(SBox_inst_sboxOutput_5__0_), .CK(clk), .Q(z[10]), .QN() );
  INV_X1 SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__not_inst_U1 ( 
        .A(n64), .ZN(
        SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv) );
  NOR2_X1 SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t0_t_inst0_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv), .ZN(
        SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[1]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t0_f_inst0_U1 ( 
        .A1(SBox_inst_n10), .A2(n64), .ZN(
        SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[2]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t1_t_inst0_U1 ( 
        .A1(prch1_o[0]), .A2(
        SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv), .ZN(
        SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[1]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t1_f_inst0_U1 ( 
        .A1(SBox_inst_n8), .A2(n64), .ZN(
        SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[2]) );
  DFF_X1 SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_0_inst_q_reg_0_ ( 
        .D(
        SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[1]), .CK(clk), .Q(SBox_inst_sboxInput0_reg_6__1_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_0_inst_q_reg_1_ ( 
        .D(
        SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[2]), .CK(clk), .Q(SBox_inst_sboxInput0_reg_6__2_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_1_inst_q_reg_0_ ( 
        .D(
        SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[1]), .CK(clk), .Q(SBox_inst_sboxInput1_reg_6__1_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_1_inst_q_reg_1_ ( 
        .D(
        SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[2]), .CK(clk), .Q(SBox_inst_sboxInput1_reg_6__2_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_6__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_layer0_inst_q_reg_0_ ( 
        .D(SBox_inst_sboxOutput_6__0_), .CK(clk), .Q(z[12]), .QN() );
  INV_X1 SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__not_inst_U1 ( 
        .A(n63), .ZN(
        SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv) );
  NOR2_X1 SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t0_t_inst0_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv), .ZN(
        SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[1]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t0_f_inst0_U1 ( 
        .A1(SBox_inst_n10), .A2(n63), .ZN(
        SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[2]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t1_t_inst0_U1 ( 
        .A1(prch1_o[0]), .A2(
        SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__input_inv), .ZN(
        SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[1]) );
  NOR2_X1 SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_gen_round_state_reg_sbox_inputs_opt_layer_0__ctrl_t1_f_inst0_U1 ( 
        .A1(SBox_inst_n8), .A2(n63), .ZN(
        SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[2]) );
  DFF_X1 SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_0_inst_q_reg_0_ ( 
        .D(
        SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[1]), .CK(clk), .Q(SBox_inst_sboxInput0_reg_7__1_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_0_inst_q_reg_1_ ( 
        .D(
        SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput0_ctrl[2]), .CK(clk), .Q(SBox_inst_sboxInput0_reg_7__2_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_1_inst_q_reg_0_ ( 
        .D(
        SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[1]), .CK(clk), .Q(SBox_inst_sboxInput1_reg_7__1_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_consecutive_1_inst_q_reg_1_ ( 
        .D(
        SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_sboxInput1_ctrl[2]), .CK(clk), .Q(SBox_inst_sboxInput1_reg_7__2_), .QN() );
  DFF_X1 SBox_inst_loop_round_state_reg_7__gen_round_state_reg_sbox_inputs_gen_round_state_reg_sbox_inputs_opt_reg_layer0_inst_q_reg_0_ ( 
        .D(SBox_inst_sboxOutput_7__0_), .CK(clk), .Q(z[14]), .QN() );
  XOR2_X2 SBox_inst_XOR_T01_layer0_xor_U1 ( .A(n59), .B(n58), .Z(
        SBox_inst_AND_M61_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_T01_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_7__1_), .A2(
        SBox_inst_sboxInput0_reg_4__2_), .B1(SBox_inst_sboxInput0_reg_7__2_), 
        .B2(SBox_inst_sboxInput0_reg_4__1_), .ZN(
        SBox_inst_XOR_T01_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T01_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_7__1_), .A2(
        SBox_inst_sboxInput0_reg_4__1_), .B1(SBox_inst_sboxInput0_reg_7__2_), 
        .B2(SBox_inst_sboxInput0_reg_4__2_), .ZN(
        SBox_inst_XOR_T01_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T01_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T01_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[0]) );
  INV_X1 SBox_inst_XOR_T01_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T01_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[1]) );
  AOI22_X1 SBox_inst_XOR_T01_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_7__1_), .A2(
        SBox_inst_sboxInput1_reg_4__2_), .B1(SBox_inst_sboxInput1_reg_7__2_), 
        .B2(SBox_inst_sboxInput1_reg_4__1_), .ZN(
        SBox_inst_XOR_T01_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T01_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_7__1_), .A2(
        SBox_inst_sboxInput1_reg_4__1_), .B1(SBox_inst_sboxInput1_reg_7__2_), 
        .B2(SBox_inst_sboxInput1_reg_4__2_), .ZN(
        SBox_inst_XOR_T01_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T01_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T01_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[0]) );
  INV_X1 SBox_inst_XOR_T01_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T01_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[1]) );
  XOR2_X1 SBox_inst_XOR_T02_layer0_xor_U1 ( .A(n59), .B(n53), .Z(
        SBox_inst_AND_M63_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_T02_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_7__1_), .A2(
        SBox_inst_sboxInput0_reg_2__2_), .B1(SBox_inst_sboxInput0_reg_7__2_), 
        .B2(SBox_inst_sboxInput0_reg_2__1_), .ZN(
        SBox_inst_XOR_T02_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T02_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_7__1_), .A2(
        SBox_inst_sboxInput0_reg_2__1_), .B1(SBox_inst_sboxInput0_reg_7__2_), 
        .B2(SBox_inst_sboxInput0_reg_2__2_), .ZN(
        SBox_inst_XOR_T02_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T02_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T02_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[2]) );
  INV_X1 SBox_inst_XOR_T02_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T02_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[3]) );
  AOI22_X1 SBox_inst_XOR_T02_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_7__1_), .A2(
        SBox_inst_sboxInput1_reg_2__2_), .B1(SBox_inst_sboxInput1_reg_7__2_), 
        .B2(SBox_inst_sboxInput1_reg_2__1_), .ZN(
        SBox_inst_XOR_T02_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T02_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_7__1_), .A2(
        SBox_inst_sboxInput1_reg_2__1_), .B1(SBox_inst_sboxInput1_reg_7__2_), 
        .B2(SBox_inst_sboxInput1_reg_2__2_), .ZN(
        SBox_inst_XOR_T02_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T02_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T02_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[2]) );
  INV_X1 SBox_inst_XOR_T02_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T02_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[3]) );
  XOR2_X1 SBox_inst_XOR_T03_layer0_xor_U1 ( .A(n59), .B(n56), .Z(
        SBox_inst_AND_M58_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_T03_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_7__1_), .A2(
        SBox_inst_sboxInput0_reg_1__2_), .B1(SBox_inst_sboxInput0_reg_7__2_), 
        .B2(SBox_inst_sboxInput0_reg_1__1_), .ZN(
        SBox_inst_XOR_T03_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T03_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_7__1_), .A2(
        SBox_inst_sboxInput0_reg_1__1_), .B1(SBox_inst_sboxInput0_reg_7__2_), 
        .B2(SBox_inst_sboxInput0_reg_1__2_), .ZN(
        SBox_inst_XOR_T03_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T03_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T03_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[4]) );
  INV_X1 SBox_inst_XOR_T03_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T03_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[5]) );
  AOI22_X1 SBox_inst_XOR_T03_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_7__1_), .A2(
        SBox_inst_sboxInput1_reg_1__2_), .B1(SBox_inst_sboxInput1_reg_7__2_), 
        .B2(SBox_inst_sboxInput1_reg_1__1_), .ZN(
        SBox_inst_XOR_T03_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T03_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_7__1_), .A2(
        SBox_inst_sboxInput1_reg_1__1_), .B1(SBox_inst_sboxInput1_reg_7__2_), 
        .B2(SBox_inst_sboxInput1_reg_1__2_), .ZN(
        SBox_inst_XOR_T03_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T03_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T03_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[4]) );
  INV_X1 SBox_inst_XOR_T03_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T03_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[5]) );
  XOR2_X1 SBox_inst_XOR_T04_layer0_xor_U1 ( .A(n58), .B(n53), .Z(
        SBox_inst_AND_M62_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_T04_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_4__1_), .A2(
        SBox_inst_sboxInput0_reg_2__2_), .B1(SBox_inst_sboxInput0_reg_4__2_), 
        .B2(SBox_inst_sboxInput0_reg_2__1_), .ZN(
        SBox_inst_XOR_T04_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T04_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_4__1_), .A2(
        SBox_inst_sboxInput0_reg_2__1_), .B1(SBox_inst_sboxInput0_reg_4__2_), 
        .B2(SBox_inst_sboxInput0_reg_2__2_), .ZN(
        SBox_inst_XOR_T04_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T04_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T04_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[6]) );
  INV_X1 SBox_inst_XOR_T04_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T04_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[7]) );
  AOI22_X1 SBox_inst_XOR_T04_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_4__1_), .A2(
        SBox_inst_sboxInput1_reg_2__2_), .B1(SBox_inst_sboxInput1_reg_4__2_), 
        .B2(SBox_inst_sboxInput1_reg_2__1_), .ZN(
        SBox_inst_XOR_T04_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T04_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_4__1_), .A2(
        SBox_inst_sboxInput1_reg_2__1_), .B1(SBox_inst_sboxInput1_reg_4__2_), 
        .B2(SBox_inst_sboxInput1_reg_2__2_), .ZN(
        SBox_inst_XOR_T04_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T04_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T04_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[6]) );
  INV_X1 SBox_inst_XOR_T04_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T04_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[7]) );
  XOR2_X1 SBox_inst_linear_gadgets_succeed_round_reg_XOR_T05_gen_out__layer0_xor_U1 ( 
        .A(n57), .B(n56), .Z(SBox_inst_t[5]) );
  XOR2_X1 SBox_inst_linear_gadgets_succeed_round_reg_XOR_T05_loop_gen_layer__1__xor_inst_U1 ( 
        .A(n67), .B(n66), .Z(SBox_inst_t5_SR2DR_1_) );
  XOR2_X2 SBox_inst_XOR_T06_layer0_xor_U1 ( .A(
        SBox_inst_AND_M61_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_t[5]), .Z(
        SBox_inst_AND_M46_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_T06_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t0[0]), .A2(SBox_inst_t0[9]), .B1(SBox_inst_t0[1]), .B2(
        SBox_inst_t0[8]), .ZN(
        SBox_inst_XOR_T06_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T06_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t0[0]), .A2(SBox_inst_t0[8]), .B1(SBox_inst_t0[1]), .B2(
        SBox_inst_t0[9]), .ZN(
        SBox_inst_XOR_T06_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T06_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T06_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[10]) );
  INV_X1 SBox_inst_XOR_T06_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T06_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[11]) );
  AOI22_X1 SBox_inst_XOR_T06_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t1[0]), .A2(SBox_inst_t1[9]), .B1(SBox_inst_t1[1]), .B2(
        SBox_inst_t1[8]), .ZN(
        SBox_inst_XOR_T06_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T06_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t1[0]), .A2(SBox_inst_t1[8]), .B1(SBox_inst_t1[1]), .B2(
        SBox_inst_t1[9]), .ZN(
        SBox_inst_XOR_T06_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T06_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T06_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[10]) );
  INV_X1 SBox_inst_XOR_T06_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T06_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[11]) );
  XOR2_X1 SBox_inst_XOR_T07_layer0_xor_U1 ( .A(n55), .B(n54), .Z(
        SBox_inst_t[7]) );
  AOI22_X1 SBox_inst_XOR_T07_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_6__1_), .A2(
        SBox_inst_sboxInput0_reg_5__2_), .B1(SBox_inst_sboxInput0_reg_6__2_), 
        .B2(SBox_inst_sboxInput0_reg_5__1_), .ZN(
        SBox_inst_XOR_T07_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T07_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_6__1_), .A2(
        SBox_inst_sboxInput0_reg_5__1_), .B1(SBox_inst_sboxInput0_reg_6__2_), 
        .B2(SBox_inst_sboxInput0_reg_5__2_), .ZN(
        SBox_inst_XOR_T07_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T07_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T07_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[12]) );
  INV_X1 SBox_inst_XOR_T07_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T07_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[13]) );
  AOI22_X1 SBox_inst_XOR_T07_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_6__1_), .A2(
        SBox_inst_sboxInput1_reg_5__2_), .B1(SBox_inst_sboxInput1_reg_6__2_), 
        .B2(SBox_inst_sboxInput1_reg_5__1_), .ZN(
        SBox_inst_XOR_T07_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T07_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_6__1_), .A2(
        SBox_inst_sboxInput1_reg_5__1_), .B1(SBox_inst_sboxInput1_reg_6__2_), 
        .B2(SBox_inst_sboxInput1_reg_5__2_), .ZN(
        SBox_inst_XOR_T07_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T07_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T07_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[12]) );
  INV_X1 SBox_inst_XOR_T07_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T07_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[13]) );
  XOR2_X1 SBox_inst_XOR_T08_layer0_xor_U1 ( .A(
        SBox_inst_AND_M48_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M46_nonlinear_precomp_b_delayed_0__0_), .Z(
        SBox_inst_AND_M47_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_T08_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_0__1_), .A2(SBox_inst_t0[11]), .B1(
        SBox_inst_sboxInput0_reg_0__2_), .B2(SBox_inst_t0[10]), .ZN(
        SBox_inst_XOR_T08_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T08_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_0__1_), .A2(SBox_inst_t0[10]), .B1(
        SBox_inst_sboxInput0_reg_0__2_), .B2(SBox_inst_t0[11]), .ZN(
        SBox_inst_XOR_T08_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T08_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T08_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[14]) );
  INV_X1 SBox_inst_XOR_T08_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T08_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[15]) );
  AOI22_X1 SBox_inst_XOR_T08_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_0__1_), .A2(SBox_inst_t1[11]), .B1(
        SBox_inst_sboxInput1_reg_0__2_), .B2(SBox_inst_t1[10]), .ZN(
        SBox_inst_XOR_T08_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T08_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_0__1_), .A2(SBox_inst_t1[10]), .B1(
        SBox_inst_sboxInput1_reg_0__2_), .B2(SBox_inst_t1[11]), .ZN(
        SBox_inst_XOR_T08_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T08_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T08_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[14]) );
  INV_X1 SBox_inst_XOR_T08_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T08_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[15]) );
  XOR2_X1 SBox_inst_XOR_T09_layer0_xor_U1 ( .A(
        SBox_inst_AND_M48_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_t[7]), .Z(
        SBox_inst_AND_M50_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_T09_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_0__1_), .A2(SBox_inst_t0[13]), .B1(
        SBox_inst_sboxInput0_reg_0__2_), .B2(SBox_inst_t0[12]), .ZN(
        SBox_inst_XOR_T09_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T09_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_0__1_), .A2(SBox_inst_t0[12]), .B1(
        SBox_inst_sboxInput0_reg_0__2_), .B2(SBox_inst_t0[13]), .ZN(
        SBox_inst_XOR_T09_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T09_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T09_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[16]) );
  INV_X1 SBox_inst_XOR_T09_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T09_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[17]) );
  AOI22_X1 SBox_inst_XOR_T09_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_0__1_), .A2(SBox_inst_t1[13]), .B1(
        SBox_inst_sboxInput1_reg_0__2_), .B2(SBox_inst_t1[12]), .ZN(
        SBox_inst_XOR_T09_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T09_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_0__1_), .A2(SBox_inst_t1[12]), .B1(
        SBox_inst_sboxInput1_reg_0__2_), .B2(SBox_inst_t1[13]), .ZN(
        SBox_inst_XOR_T09_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T09_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T09_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[16]) );
  INV_X1 SBox_inst_XOR_T09_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T09_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[17]) );
  XOR2_X1 SBox_inst_XOR_T10_layer0_xor_U1 ( .A(
        SBox_inst_AND_M46_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_t[7]), .Z(
        SBox_inst_AND_M54_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_T10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t0[10]), .A2(SBox_inst_t0[13]), .B1(SBox_inst_t0[11]), 
        .B2(SBox_inst_t0[12]), .ZN(
        SBox_inst_XOR_T10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t0[10]), .A2(SBox_inst_t0[12]), .B1(SBox_inst_t0[11]), 
        .B2(SBox_inst_t0[13]), .ZN(
        SBox_inst_XOR_T10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[18]) );
  INV_X1 SBox_inst_XOR_T10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[19]) );
  AOI22_X1 SBox_inst_XOR_T10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t1[10]), .A2(SBox_inst_t1[13]), .B1(SBox_inst_t1[11]), 
        .B2(SBox_inst_t1[12]), .ZN(
        SBox_inst_XOR_T10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t1[10]), .A2(SBox_inst_t1[12]), .B1(SBox_inst_t1[11]), 
        .B2(SBox_inst_t1[13]), .ZN(
        SBox_inst_XOR_T10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[18]) );
  INV_X1 SBox_inst_XOR_T10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[19]) );
  XOR2_X1 SBox_inst_XOR_T11_layer0_xor_U1 ( .A(n55), .B(n53), .Z(
        SBox_inst_t[11]) );
  AOI22_X1 SBox_inst_XOR_T11_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_6__1_), .A2(
        SBox_inst_sboxInput0_reg_2__2_), .B1(SBox_inst_sboxInput0_reg_6__2_), 
        .B2(SBox_inst_sboxInput0_reg_2__1_), .ZN(
        SBox_inst_XOR_T11_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T11_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_6__1_), .A2(
        SBox_inst_sboxInput0_reg_2__1_), .B1(SBox_inst_sboxInput0_reg_6__2_), 
        .B2(SBox_inst_sboxInput0_reg_2__2_), .ZN(
        SBox_inst_XOR_T11_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T11_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T11_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[20]) );
  INV_X1 SBox_inst_XOR_T11_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T11_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[21]) );
  AOI22_X1 SBox_inst_XOR_T11_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_6__1_), .A2(
        SBox_inst_sboxInput1_reg_2__2_), .B1(SBox_inst_sboxInput1_reg_6__2_), 
        .B2(SBox_inst_sboxInput1_reg_2__1_), .ZN(
        SBox_inst_XOR_T11_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T11_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_6__1_), .A2(
        SBox_inst_sboxInput1_reg_2__1_), .B1(SBox_inst_sboxInput1_reg_6__2_), 
        .B2(SBox_inst_sboxInput1_reg_2__2_), .ZN(
        SBox_inst_XOR_T11_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T11_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T11_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[20]) );
  INV_X1 SBox_inst_XOR_T11_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T11_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[21]) );
  XOR2_X1 SBox_inst_XOR_T12_layer0_xor_U1 ( .A(n54), .B(n53), .Z(
        SBox_inst_t[12]) );
  AOI22_X1 SBox_inst_XOR_T12_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_5__1_), .A2(
        SBox_inst_sboxInput0_reg_2__2_), .B1(SBox_inst_sboxInput0_reg_5__2_), 
        .B2(SBox_inst_sboxInput0_reg_2__1_), .ZN(
        SBox_inst_XOR_T12_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T12_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_5__1_), .A2(
        SBox_inst_sboxInput0_reg_2__1_), .B1(SBox_inst_sboxInput0_reg_5__2_), 
        .B2(SBox_inst_sboxInput0_reg_2__2_), .ZN(
        SBox_inst_XOR_T12_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T12_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T12_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[22]) );
  INV_X1 SBox_inst_XOR_T12_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T12_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[23]) );
  AOI22_X1 SBox_inst_XOR_T12_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_5__1_), .A2(
        SBox_inst_sboxInput1_reg_2__2_), .B1(SBox_inst_sboxInput1_reg_5__2_), 
        .B2(SBox_inst_sboxInput1_reg_2__1_), .ZN(
        SBox_inst_XOR_T12_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T12_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_5__1_), .A2(
        SBox_inst_sboxInput1_reg_2__1_), .B1(SBox_inst_sboxInput1_reg_5__2_), 
        .B2(SBox_inst_sboxInput1_reg_2__2_), .ZN(
        SBox_inst_XOR_T12_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T12_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T12_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[22]) );
  INV_X1 SBox_inst_XOR_T12_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T12_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[23]) );
  XOR2_X1 SBox_inst_XOR_T13_layer0_xor_U1 ( .A(
        SBox_inst_AND_M58_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M62_nonlinear_precomp_b_delayed_0__0_), .Z(
        SBox_inst_AND_M55_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_T13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t0[4]), .A2(SBox_inst_t0[7]), .B1(SBox_inst_t0[5]), .B2(
        SBox_inst_t0[6]), .ZN(
        SBox_inst_XOR_T13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t0[4]), .A2(SBox_inst_t0[6]), .B1(SBox_inst_t0[5]), .B2(
        SBox_inst_t0[7]), .ZN(
        SBox_inst_XOR_T13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[24]) );
  INV_X1 SBox_inst_XOR_T13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[25]) );
  AOI22_X1 SBox_inst_XOR_T13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t1[4]), .A2(SBox_inst_t1[7]), .B1(SBox_inst_t1[5]), .B2(
        SBox_inst_t1[6]), .ZN(
        SBox_inst_XOR_T13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t1[4]), .A2(SBox_inst_t1[6]), .B1(SBox_inst_t1[5]), .B2(
        SBox_inst_t1[7]), .ZN(
        SBox_inst_XOR_T13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[24]) );
  INV_X1 SBox_inst_XOR_T13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[25]) );
  XOR2_X1 SBox_inst_XOR_T14_layer0_xor_U1 ( .A(
        SBox_inst_AND_M46_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_t[11]), .Z(SBox_inst_t[14]) );
  AOI22_X1 SBox_inst_XOR_T14_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t0[10]), .A2(SBox_inst_t0[21]), .B1(SBox_inst_t0[11]), 
        .B2(SBox_inst_t0[20]), .ZN(
        SBox_inst_XOR_T14_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T14_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t0[10]), .A2(SBox_inst_t0[20]), .B1(SBox_inst_t0[11]), 
        .B2(SBox_inst_t0[21]), .ZN(
        SBox_inst_XOR_T14_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T14_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T14_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[26]) );
  INV_X1 SBox_inst_XOR_T14_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T14_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[27]) );
  AOI22_X1 SBox_inst_XOR_T14_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t1[10]), .A2(SBox_inst_t1[21]), .B1(SBox_inst_t1[11]), 
        .B2(SBox_inst_t1[20]), .ZN(
        SBox_inst_XOR_T14_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T14_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t1[10]), .A2(SBox_inst_t1[20]), .B1(SBox_inst_t1[11]), 
        .B2(SBox_inst_t1[21]), .ZN(
        SBox_inst_XOR_T14_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T14_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T14_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[26]) );
  INV_X1 SBox_inst_XOR_T14_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T14_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[27]) );
  XOR2_X1 SBox_inst_XOR_T15_layer0_xor_U1 ( .A(SBox_inst_t[5]), .B(
        SBox_inst_t[11]), .Z(
        SBox_inst_AND_M52_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_T15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t0[8]), .A2(SBox_inst_t0[21]), .B1(SBox_inst_t0[9]), 
        .B2(SBox_inst_t0[20]), .ZN(
        SBox_inst_XOR_T15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t0[8]), .A2(SBox_inst_t0[20]), .B1(SBox_inst_t0[9]), 
        .B2(SBox_inst_t0[21]), .ZN(
        SBox_inst_XOR_T15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[28]) );
  INV_X1 SBox_inst_XOR_T15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[29]) );
  AOI22_X1 SBox_inst_XOR_T15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t1[8]), .A2(SBox_inst_t1[21]), .B1(SBox_inst_t1[9]), 
        .B2(SBox_inst_t1[20]), .ZN(
        SBox_inst_XOR_T15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t1[8]), .A2(SBox_inst_t1[20]), .B1(SBox_inst_t1[9]), 
        .B2(SBox_inst_t1[21]), .ZN(
        SBox_inst_XOR_T15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[28]) );
  INV_X1 SBox_inst_XOR_T15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[29]) );
  XOR2_X1 SBox_inst_XOR_T16_layer0_xor_U1 ( .A(SBox_inst_t[5]), .B(
        SBox_inst_t[12]), .Z(
        SBox_inst_AND_M49_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_T16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t0[8]), .A2(SBox_inst_t0[23]), .B1(SBox_inst_t0[9]), 
        .B2(SBox_inst_t0[22]), .ZN(
        SBox_inst_XOR_T16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t0[8]), .A2(SBox_inst_t0[22]), .B1(SBox_inst_t0[9]), 
        .B2(SBox_inst_t0[23]), .ZN(
        SBox_inst_XOR_T16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[30]) );
  INV_X1 SBox_inst_XOR_T16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[31]) );
  AOI22_X1 SBox_inst_XOR_T16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t1[8]), .A2(SBox_inst_t1[23]), .B1(SBox_inst_t1[9]), 
        .B2(SBox_inst_t1[22]), .ZN(
        SBox_inst_XOR_T16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t1[8]), .A2(SBox_inst_t1[22]), .B1(SBox_inst_t1[9]), 
        .B2(SBox_inst_t1[23]), .ZN(
        SBox_inst_XOR_T16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[30]) );
  INV_X1 SBox_inst_XOR_T16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[31]) );
  XOR2_X1 SBox_inst_XOR_T17_layer0_xor_U1 ( .A(
        SBox_inst_AND_M50_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M49_nonlinear_precomp_b_delayed_0__0_), .Z(
        SBox_inst_AND_M51_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_T17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t0[16]), .A2(SBox_inst_t0[31]), .B1(SBox_inst_t0[17]), 
        .B2(SBox_inst_t0[30]), .ZN(
        SBox_inst_XOR_T17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t0[16]), .A2(SBox_inst_t0[30]), .B1(SBox_inst_t0[17]), 
        .B2(SBox_inst_t0[31]), .ZN(
        SBox_inst_XOR_T17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[32]) );
  INV_X1 SBox_inst_XOR_T17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[33]) );
  AOI22_X1 SBox_inst_XOR_T17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t1[16]), .A2(SBox_inst_t1[31]), .B1(SBox_inst_t1[17]), 
        .B2(SBox_inst_t1[30]), .ZN(
        SBox_inst_XOR_T17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t1[16]), .A2(SBox_inst_t1[30]), .B1(SBox_inst_t1[17]), 
        .B2(SBox_inst_t1[31]), .ZN(
        SBox_inst_XOR_T17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[32]) );
  INV_X1 SBox_inst_XOR_T17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[33]) );
  XOR2_X1 SBox_inst_XOR_T18_layer0_xor_U1 ( .A(n58), .B(
        SBox_inst_AND_M48_nonlinear_precomp_b_delayed_0__0_), .Z(
        SBox_inst_t[18]) );
  AOI22_X1 SBox_inst_XOR_T18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_4__1_), .A2(
        SBox_inst_sboxInput0_reg_0__2_), .B1(SBox_inst_sboxInput0_reg_4__2_), 
        .B2(SBox_inst_sboxInput0_reg_0__1_), .ZN(
        SBox_inst_XOR_T18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_4__1_), .A2(
        SBox_inst_sboxInput0_reg_0__1_), .B1(SBox_inst_sboxInput0_reg_4__2_), 
        .B2(SBox_inst_sboxInput0_reg_0__2_), .ZN(
        SBox_inst_XOR_T18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[34]) );
  INV_X1 SBox_inst_XOR_T18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[35]) );
  AOI22_X1 SBox_inst_XOR_T18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_4__1_), .A2(
        SBox_inst_sboxInput1_reg_0__2_), .B1(SBox_inst_sboxInput1_reg_4__2_), 
        .B2(SBox_inst_sboxInput1_reg_0__1_), .ZN(
        SBox_inst_XOR_T18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_4__1_), .A2(
        SBox_inst_sboxInput1_reg_0__1_), .B1(SBox_inst_sboxInput1_reg_4__2_), 
        .B2(SBox_inst_sboxInput1_reg_0__2_), .ZN(
        SBox_inst_XOR_T18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[34]) );
  INV_X1 SBox_inst_XOR_T18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[35]) );
  XOR2_X1 SBox_inst_XOR_T19_layer0_xor_U1 ( .A(SBox_inst_t[7]), .B(
        SBox_inst_t[18]), .Z(
        SBox_inst_AND_M57_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_T19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t0[12]), .A2(SBox_inst_t0[35]), .B1(SBox_inst_t0[13]), 
        .B2(SBox_inst_t0[34]), .ZN(
        SBox_inst_XOR_T19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t0[12]), .A2(SBox_inst_t0[34]), .B1(SBox_inst_t0[13]), 
        .B2(SBox_inst_t0[35]), .ZN(
        SBox_inst_XOR_T19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[36]) );
  INV_X1 SBox_inst_XOR_T19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[37]) );
  AOI22_X1 SBox_inst_XOR_T19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t1[12]), .A2(SBox_inst_t1[35]), .B1(SBox_inst_t1[13]), 
        .B2(SBox_inst_t1[34]), .ZN(
        SBox_inst_XOR_T19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t1[12]), .A2(SBox_inst_t1[34]), .B1(SBox_inst_t1[13]), 
        .B2(SBox_inst_t1[35]), .ZN(
        SBox_inst_XOR_T19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[36]) );
  INV_X1 SBox_inst_XOR_T19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[37]) );
  XOR2_X1 SBox_inst_XOR_T20_layer0_xor_U1 ( .A(
        SBox_inst_AND_M61_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M57_nonlinear_precomp_b_delayed_0__0_), .Z(
        SBox_inst_AND_M60_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_T20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t0[0]), .A2(SBox_inst_t0[37]), .B1(SBox_inst_t0[1]), 
        .B2(SBox_inst_t0[36]), .ZN(
        SBox_inst_XOR_T20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t0[0]), .A2(SBox_inst_t0[36]), .B1(SBox_inst_t0[1]), 
        .B2(SBox_inst_t0[37]), .ZN(
        SBox_inst_XOR_T20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[38]) );
  INV_X1 SBox_inst_XOR_T20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[39]) );
  AOI22_X1 SBox_inst_XOR_T20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t1[0]), .A2(SBox_inst_t1[37]), .B1(SBox_inst_t1[1]), 
        .B2(SBox_inst_t1[36]), .ZN(
        SBox_inst_XOR_T20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t1[0]), .A2(SBox_inst_t1[36]), .B1(SBox_inst_t1[1]), 
        .B2(SBox_inst_t1[37]), .ZN(
        SBox_inst_XOR_T20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[38]) );
  INV_X1 SBox_inst_XOR_T20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[39]) );
  XOR2_X1 SBox_inst_XOR_T21_layer0_xor_U1 ( .A(n56), .B(
        SBox_inst_AND_M48_nonlinear_precomp_b_delayed_0__0_), .Z(
        SBox_inst_t[21]) );
  AOI22_X1 SBox_inst_XOR_T21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_1__1_), .A2(
        SBox_inst_sboxInput0_reg_0__2_), .B1(SBox_inst_sboxInput0_reg_1__2_), 
        .B2(SBox_inst_sboxInput0_reg_0__1_), .ZN(
        SBox_inst_XOR_T21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_1__1_), .A2(
        SBox_inst_sboxInput0_reg_0__1_), .B1(SBox_inst_sboxInput0_reg_1__2_), 
        .B2(SBox_inst_sboxInput0_reg_0__2_), .ZN(
        SBox_inst_XOR_T21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[40]) );
  INV_X1 SBox_inst_XOR_T21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[41]) );
  AOI22_X1 SBox_inst_XOR_T21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_1__1_), .A2(
        SBox_inst_sboxInput1_reg_0__2_), .B1(SBox_inst_sboxInput1_reg_1__2_), 
        .B2(SBox_inst_sboxInput1_reg_0__1_), .ZN(
        SBox_inst_XOR_T21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_1__1_), .A2(
        SBox_inst_sboxInput1_reg_0__1_), .B1(SBox_inst_sboxInput1_reg_1__2_), 
        .B2(SBox_inst_sboxInput1_reg_0__2_), .ZN(
        SBox_inst_XOR_T21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[40]) );
  INV_X1 SBox_inst_XOR_T21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[41]) );
  XOR2_X1 SBox_inst_XOR_T22_layer0_xor_U1 ( .A(SBox_inst_t[7]), .B(
        SBox_inst_t[21]), .Z(
        SBox_inst_AND_M59_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_T22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t0[12]), .A2(SBox_inst_t0[41]), .B1(SBox_inst_t0[13]), 
        .B2(SBox_inst_t0[40]), .ZN(
        SBox_inst_XOR_T22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t0[12]), .A2(SBox_inst_t0[40]), .B1(SBox_inst_t0[13]), 
        .B2(SBox_inst_t0[41]), .ZN(
        SBox_inst_XOR_T22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[42]) );
  INV_X1 SBox_inst_XOR_T22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[43]) );
  AOI22_X1 SBox_inst_XOR_T22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t1[12]), .A2(SBox_inst_t1[41]), .B1(SBox_inst_t1[13]), 
        .B2(SBox_inst_t1[40]), .ZN(
        SBox_inst_XOR_T22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t1[12]), .A2(SBox_inst_t1[40]), .B1(SBox_inst_t1[13]), 
        .B2(SBox_inst_t1[41]), .ZN(
        SBox_inst_XOR_T22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[42]) );
  INV_X1 SBox_inst_XOR_T22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[43]) );
  XOR2_X1 SBox_inst_XOR_T23_layer0_xor_U1 ( .A(
        SBox_inst_AND_M63_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M59_nonlinear_precomp_b_delayed_0__0_), .Z(
        SBox_inst_AND_M56_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_T23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t0[2]), .A2(SBox_inst_t0[43]), .B1(SBox_inst_t0[3]), 
        .B2(SBox_inst_t0[42]), .ZN(
        SBox_inst_XOR_T23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t0[2]), .A2(SBox_inst_t0[42]), .B1(SBox_inst_t0[3]), 
        .B2(SBox_inst_t0[43]), .ZN(
        SBox_inst_XOR_T23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[44]) );
  INV_X1 SBox_inst_XOR_T23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[45]) );
  AOI22_X1 SBox_inst_XOR_T23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t1[2]), .A2(SBox_inst_t1[43]), .B1(SBox_inst_t1[3]), 
        .B2(SBox_inst_t1[42]), .ZN(
        SBox_inst_XOR_T23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t1[2]), .A2(SBox_inst_t1[42]), .B1(SBox_inst_t1[3]), 
        .B2(SBox_inst_t1[43]), .ZN(
        SBox_inst_XOR_T23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[44]) );
  INV_X1 SBox_inst_XOR_T23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[45]) );
  XOR2_X1 SBox_inst_XOR_T24_layer0_xor_U1 ( .A(
        SBox_inst_AND_M63_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M54_nonlinear_precomp_b_delayed_0__0_), .Z(
        SBox_inst_t[24]) );
  AOI22_X1 SBox_inst_XOR_T24_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t0[2]), .A2(SBox_inst_t0[19]), .B1(SBox_inst_t0[3]), 
        .B2(SBox_inst_t0[18]), .ZN(
        SBox_inst_XOR_T24_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T24_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t0[2]), .A2(SBox_inst_t0[18]), .B1(SBox_inst_t0[3]), 
        .B2(SBox_inst_t0[19]), .ZN(
        SBox_inst_XOR_T24_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T24_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T24_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[46]) );
  INV_X1 SBox_inst_XOR_T24_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T24_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[47]) );
  AOI22_X1 SBox_inst_XOR_T24_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t1[2]), .A2(SBox_inst_t1[19]), .B1(SBox_inst_t1[3]), 
        .B2(SBox_inst_t1[18]), .ZN(
        SBox_inst_XOR_T24_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T24_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t1[2]), .A2(SBox_inst_t1[18]), .B1(SBox_inst_t1[3]), 
        .B2(SBox_inst_t1[19]), .ZN(
        SBox_inst_XOR_T24_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T24_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T24_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[46]) );
  INV_X1 SBox_inst_XOR_T24_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T24_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[47]) );
  XOR2_X1 SBox_inst_XOR_T25_layer0_xor_U1 ( .A(
        SBox_inst_AND_M60_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M51_nonlinear_precomp_b_delayed_0__0_), .Z(
        SBox_inst_t[25]) );
  AOI22_X1 SBox_inst_XOR_T25_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t0[38]), .A2(SBox_inst_t0[33]), .B1(SBox_inst_t0[39]), 
        .B2(SBox_inst_t0[32]), .ZN(
        SBox_inst_XOR_T25_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T25_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t0[38]), .A2(SBox_inst_t0[32]), .B1(SBox_inst_t0[39]), 
        .B2(SBox_inst_t0[33]), .ZN(
        SBox_inst_XOR_T25_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T25_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T25_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[48]) );
  INV_X1 SBox_inst_XOR_T25_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T25_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[49]) );
  AOI22_X1 SBox_inst_XOR_T25_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t1[38]), .A2(SBox_inst_t1[33]), .B1(SBox_inst_t1[39]), 
        .B2(SBox_inst_t1[32]), .ZN(
        SBox_inst_XOR_T25_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T25_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t1[38]), .A2(SBox_inst_t1[32]), .B1(SBox_inst_t1[39]), 
        .B2(SBox_inst_t1[33]), .ZN(
        SBox_inst_XOR_T25_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T25_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T25_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[48]) );
  INV_X1 SBox_inst_XOR_T25_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T25_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[49]) );
  XOR2_X1 SBox_inst_XOR_T26_layer0_xor_U1 ( .A(
        SBox_inst_AND_M58_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M49_nonlinear_precomp_b_delayed_0__0_), .Z(
        SBox_inst_t[26]) );
  AOI22_X1 SBox_inst_XOR_T26_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t0[4]), .A2(SBox_inst_t0[31]), .B1(SBox_inst_t0[5]), 
        .B2(SBox_inst_t0[30]), .ZN(
        SBox_inst_XOR_T26_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T26_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t0[4]), .A2(SBox_inst_t0[30]), .B1(SBox_inst_t0[5]), 
        .B2(SBox_inst_t0[31]), .ZN(
        SBox_inst_XOR_T26_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T26_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T26_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[50]) );
  INV_X1 SBox_inst_XOR_T26_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T26_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[51]) );
  AOI22_X1 SBox_inst_XOR_T26_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t1[4]), .A2(SBox_inst_t1[31]), .B1(SBox_inst_t1[5]), 
        .B2(SBox_inst_t1[30]), .ZN(
        SBox_inst_XOR_T26_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T26_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t1[4]), .A2(SBox_inst_t1[30]), .B1(SBox_inst_t1[5]), 
        .B2(SBox_inst_t1[31]), .ZN(
        SBox_inst_XOR_T26_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T26_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T26_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[50]) );
  INV_X1 SBox_inst_XOR_T26_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T26_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[51]) );
  XOR2_X1 SBox_inst_XOR_T27_layer0_xor_U1 ( .A(
        SBox_inst_AND_M61_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_t[12]), .Z(
        SBox_inst_AND_M53_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_T27_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t0[0]), .A2(SBox_inst_t0[23]), .B1(SBox_inst_t0[1]), 
        .B2(SBox_inst_t0[22]), .ZN(
        SBox_inst_XOR_T27_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T27_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t0[0]), .A2(SBox_inst_t0[22]), .B1(SBox_inst_t0[1]), 
        .B2(SBox_inst_t0[23]), .ZN(
        SBox_inst_XOR_T27_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T27_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T27_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t0[52]) );
  INV_X1 SBox_inst_XOR_T27_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T27_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t0[53]) );
  AOI22_X1 SBox_inst_XOR_T27_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t1[0]), .A2(SBox_inst_t1[23]), .B1(SBox_inst_t1[1]), 
        .B2(SBox_inst_t1[22]), .ZN(
        SBox_inst_XOR_T27_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_T27_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t1[0]), .A2(SBox_inst_t1[22]), .B1(SBox_inst_t1[1]), 
        .B2(SBox_inst_t1[23]), .ZN(
        SBox_inst_XOR_T27_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_T27_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_T27_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_t1[52]) );
  INV_X1 SBox_inst_XOR_T27_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_T27_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_t1[53]) );
  NAND2_X1 SBox_inst_AND_M1_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M46_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M55_nonlinear_precomp_b_delayed_0__0_), .ZN(
        SBox_inst_AND_M1_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M1_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M1_nonlinear_layer0_a0nandb0), .B(r_SR[0]), .ZN(
        SBox_inst_m[1]) );
  XOR2_X1 SBox_inst_AND_M1_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M55_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[0]), 
        .Z(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 SBox_inst_AND_M1_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M46_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[0]), 
        .Z(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 SBox_inst_AND_M1_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M46_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_) );
  INV_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( 
        .A(r_SR[0]), .ZN(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_) );
  INV_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( 
        .A(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( 
        .A(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_) );
  INV_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( 
        .A(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_) );
  NOR2_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]) );
  NOR2_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[0]), .ZN(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]) );
  NOR2_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]) );
  NOR2_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]) );
  NOR2_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]) );
  DFF_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]), .CK(clk), .Q(SBox_inst_AND_M1_t_DR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]), .CK(clk), .Q(SBox_inst_AND_M1_t_DR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]), .CK(clk), .Q(SBox_inst_AND_M1_t_DR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]), .CK(clk), .Q(SBox_inst_AND_M1_t_DR0[3]), .QN() );
  DFF_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]), .CK(clk), .Q(SBox_inst_AND_M1_t_DR0[4]), .QN() );
  DFF_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]), .CK(clk), .Q(SBox_inst_AND_M1_t_DR0[5]), .QN() );
  DFF_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]), .CK(clk), .Q(SBox_inst_AND_M1_t_DR0[6]), .QN() );
  DFF_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]), .CK(clk), .Q(SBox_inst_AND_M1_t_DR0[7]), .QN() );
  NOR2_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]) );
  NOR2_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[0]), .ZN(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]) );
  NOR2_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]) );
  NOR2_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]) );
  NOR2_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]) );
  DFF_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]), .CK(clk), .Q(SBox_inst_AND_M1_t_DR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]), .CK(clk), .Q(SBox_inst_AND_M1_t_DR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]), .CK(clk), .Q(SBox_inst_AND_M1_t_DR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]), .CK(clk), .Q(SBox_inst_AND_M1_t_DR1[3]), .QN() );
  DFF_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]), .CK(clk), .Q(SBox_inst_AND_M1_t_DR1[4]), .QN() );
  DFF_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]), .CK(clk), .Q(SBox_inst_AND_M1_t_DR1[5]), .QN() );
  DFF_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]), .CK(clk), .Q(SBox_inst_AND_M1_t_DR1[6]), .QN() );
  DFF_X1 SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]), .CK(clk), .Q(SBox_inst_AND_M1_t_DR1[7]), .QN() );
  NAND3_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[10]), .A2(SBox_inst_t0[24]), .A3(
        SBox_inst_AND_M1_t_DR0[3]), .ZN(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[11]), .A2(SBox_inst_t0[24]), .A3(
        SBox_inst_AND_M1_t_DR0[2]), .ZN(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[10]), .A2(SBox_inst_t0[25]), .A3(
        SBox_inst_AND_M1_t_DR0[1]), .ZN(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[11]), .A2(SBox_inst_t0[25]), .A3(
        SBox_inst_AND_M1_t_DR0[0]), .ZN(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[0]) );
  NAND3_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[10]), .A2(SBox_inst_t0[24]), .A3(
        SBox_inst_AND_M1_t_DR0[7]), .ZN(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[11]), .A2(SBox_inst_t0[24]), .A3(
        SBox_inst_AND_M1_t_DR0[6]), .ZN(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[10]), .A2(SBox_inst_t0[25]), .A3(
        SBox_inst_AND_M1_t_DR0[5]), .ZN(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[11]), .A2(SBox_inst_t0[25]), .A3(
        SBox_inst_AND_M1_t_DR0[4]), .ZN(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[1]) );
  NAND3_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[10]), .A2(SBox_inst_t1[24]), .A3(
        SBox_inst_AND_M1_t_DR1[3]), .ZN(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[11]), .A2(SBox_inst_t1[24]), .A3(
        SBox_inst_AND_M1_t_DR1[2]), .ZN(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[10]), .A2(SBox_inst_t1[25]), .A3(
        SBox_inst_AND_M1_t_DR1[1]), .ZN(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[11]), .A2(SBox_inst_t1[25]), .A3(
        SBox_inst_AND_M1_t_DR1[0]), .ZN(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[0]) );
  NAND3_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[10]), .A2(SBox_inst_t1[24]), .A3(
        SBox_inst_AND_M1_t_DR1[7]), .ZN(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[11]), .A2(SBox_inst_t1[24]), .A3(
        SBox_inst_AND_M1_t_DR1[6]), .ZN(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[10]), .A2(SBox_inst_t1[25]), .A3(
        SBox_inst_AND_M1_t_DR1[5]), .ZN(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[11]), .A2(SBox_inst_t1[25]), .A3(
        SBox_inst_AND_M1_t_DR1[4]), .ZN(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[1]) );
  NAND2_X1 SBox_inst_AND_M2_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M47_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M56_nonlinear_precomp_b_delayed_0__0_), .ZN(
        SBox_inst_AND_M2_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M2_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M2_nonlinear_layer0_a0nandb0), .B(r_SR[1]), .ZN(
        SBox_inst_m[2]) );
  XOR2_X1 SBox_inst_AND_M2_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M56_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[1]), 
        .Z(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 SBox_inst_AND_M2_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M47_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[1]), 
        .Z(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 SBox_inst_AND_M2_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M47_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_) );
  INV_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( 
        .A(r_SR[1]), .ZN(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_) );
  INV_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( 
        .A(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( 
        .A(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_) );
  INV_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( 
        .A(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_) );
  NOR2_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]) );
  NOR2_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[1]), .ZN(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]) );
  NOR2_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]) );
  NOR2_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]) );
  NOR2_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]) );
  DFF_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]), .CK(clk), .Q(SBox_inst_AND_M2_t_DR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]), .CK(clk), .Q(SBox_inst_AND_M2_t_DR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]), .CK(clk), .Q(SBox_inst_AND_M2_t_DR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]), .CK(clk), .Q(SBox_inst_AND_M2_t_DR0[3]), .QN() );
  DFF_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]), .CK(clk), .Q(SBox_inst_AND_M2_t_DR0[4]), .QN() );
  DFF_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]), .CK(clk), .Q(SBox_inst_AND_M2_t_DR0[5]), .QN() );
  DFF_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]), .CK(clk), .Q(SBox_inst_AND_M2_t_DR0[6]), .QN() );
  DFF_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]), .CK(clk), .Q(SBox_inst_AND_M2_t_DR0[7]), .QN() );
  NOR2_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]) );
  NOR2_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[1]), .ZN(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]) );
  NOR2_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]) );
  NOR2_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]) );
  NOR2_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]) );
  DFF_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]), .CK(clk), .Q(SBox_inst_AND_M2_t_DR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]), .CK(clk), .Q(SBox_inst_AND_M2_t_DR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]), .CK(clk), .Q(SBox_inst_AND_M2_t_DR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]), .CK(clk), .Q(SBox_inst_AND_M2_t_DR1[3]), .QN() );
  DFF_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]), .CK(clk), .Q(SBox_inst_AND_M2_t_DR1[4]), .QN() );
  DFF_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]), .CK(clk), .Q(SBox_inst_AND_M2_t_DR1[5]), .QN() );
  DFF_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]), .CK(clk), .Q(SBox_inst_AND_M2_t_DR1[6]), .QN() );
  DFF_X1 SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M2_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]), .CK(clk), .Q(SBox_inst_AND_M2_t_DR1[7]), .QN() );
  NAND3_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[14]), .A2(SBox_inst_t0[44]), .A3(
        SBox_inst_AND_M2_t_DR0[3]), .ZN(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[15]), .A2(SBox_inst_t0[44]), .A3(
        SBox_inst_AND_M2_t_DR0[2]), .ZN(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[14]), .A2(SBox_inst_t0[45]), .A3(
        SBox_inst_AND_M2_t_DR0[1]), .ZN(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[15]), .A2(SBox_inst_t0[45]), .A3(
        SBox_inst_AND_M2_t_DR0[0]), .ZN(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[2]) );
  NAND3_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[14]), .A2(SBox_inst_t0[44]), .A3(
        SBox_inst_AND_M2_t_DR0[7]), .ZN(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[15]), .A2(SBox_inst_t0[44]), .A3(
        SBox_inst_AND_M2_t_DR0[6]), .ZN(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[14]), .A2(SBox_inst_t0[45]), .A3(
        SBox_inst_AND_M2_t_DR0[5]), .ZN(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[15]), .A2(SBox_inst_t0[45]), .A3(
        SBox_inst_AND_M2_t_DR0[4]), .ZN(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[3]) );
  NAND3_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[14]), .A2(SBox_inst_t1[44]), .A3(
        SBox_inst_AND_M2_t_DR1[3]), .ZN(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[15]), .A2(SBox_inst_t1[44]), .A3(
        SBox_inst_AND_M2_t_DR1[2]), .ZN(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[14]), .A2(SBox_inst_t1[45]), .A3(
        SBox_inst_AND_M2_t_DR1[1]), .ZN(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[15]), .A2(SBox_inst_t1[45]), .A3(
        SBox_inst_AND_M2_t_DR1[0]), .ZN(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[2]) );
  NAND3_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[14]), .A2(SBox_inst_t1[44]), .A3(
        SBox_inst_AND_M2_t_DR1[7]), .ZN(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[15]), .A2(SBox_inst_t1[44]), .A3(
        SBox_inst_AND_M2_t_DR1[6]), .ZN(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[14]), .A2(SBox_inst_t1[45]), .A3(
        SBox_inst_AND_M2_t_DR1[5]), .ZN(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[15]), .A2(SBox_inst_t1[45]), .A3(
        SBox_inst_AND_M2_t_DR1[4]), .ZN(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M2_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[3]) );
  XOR2_X1 SBox_inst_XOR_M3_layer0_xor_U1 ( .A(SBox_inst_t[14]), .B(
        SBox_inst_m[1]), .Z(SBox_inst_m[3]) );
  AOI22_X1 SBox_inst_XOR_M3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t0[26]), .A2(SBox_inst_m0[1]), .B1(SBox_inst_t0[27]), 
        .B2(SBox_inst_m0[0]), .ZN(
        SBox_inst_XOR_M3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t0[26]), .A2(SBox_inst_m0[0]), .B1(SBox_inst_t0[27]), 
        .B2(SBox_inst_m0[1]), .ZN(
        SBox_inst_XOR_M3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m0[4]) );
  INV_X1 SBox_inst_XOR_M3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m0[5]) );
  AOI22_X1 SBox_inst_XOR_M3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t1[26]), .A2(SBox_inst_m1[1]), .B1(SBox_inst_t1[27]), 
        .B2(SBox_inst_m1[0]), .ZN(
        SBox_inst_XOR_M3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t1[26]), .A2(SBox_inst_m1[0]), .B1(SBox_inst_t1[27]), 
        .B2(SBox_inst_m1[1]), .ZN(
        SBox_inst_XOR_M3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m1[4]) );
  INV_X1 SBox_inst_XOR_M3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m1[5]) );
  NAND2_X1 SBox_inst_AND_M4_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M48_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M57_nonlinear_precomp_b_delayed_0__0_), .ZN(
        SBox_inst_AND_M4_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M4_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M4_nonlinear_layer0_a0nandb0), .B(r_SR[2]), .ZN(
        SBox_inst_m[4]) );
  XOR2_X1 SBox_inst_AND_M4_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M57_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[2]), 
        .Z(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 SBox_inst_AND_M4_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M48_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[2]), 
        .Z(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 SBox_inst_AND_M4_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M48_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_) );
  INV_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( 
        .A(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_) );
  INV_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( 
        .A(r_SR[2]), .ZN(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_) );
  INV_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( 
        .A(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( 
        .A(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_) );
  NOR2_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]) );
  NOR2_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[2]), .ZN(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]) );
  NOR2_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]) );
  NOR2_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]) );
  NOR2_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]) );
  DFF_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]), .CK(clk), .Q(SBox_inst_AND_M4_t_DR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]), .CK(clk), .Q(SBox_inst_AND_M4_t_DR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]), .CK(clk), .Q(SBox_inst_AND_M4_t_DR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]), .CK(clk), .Q(SBox_inst_AND_M4_t_DR0[3]), .QN() );
  DFF_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]), .CK(clk), .Q(SBox_inst_AND_M4_t_DR0[4]), .QN() );
  DFF_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]), .CK(clk), .Q(SBox_inst_AND_M4_t_DR0[5]), .QN() );
  DFF_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]), .CK(clk), .Q(SBox_inst_AND_M4_t_DR0[6]), .QN() );
  DFF_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]), .CK(clk), .Q(SBox_inst_AND_M4_t_DR0[7]), .QN() );
  NOR2_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]) );
  NOR2_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[2]), .ZN(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]) );
  NOR2_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]) );
  NOR2_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]) );
  NOR2_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]) );
  DFF_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]), .CK(clk), .Q(SBox_inst_AND_M4_t_DR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]), .CK(clk), .Q(SBox_inst_AND_M4_t_DR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]), .CK(clk), .Q(SBox_inst_AND_M4_t_DR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]), .CK(clk), .Q(SBox_inst_AND_M4_t_DR1[3]), .QN() );
  DFF_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]), .CK(clk), .Q(SBox_inst_AND_M4_t_DR1[4]), .QN() );
  DFF_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]), .CK(clk), .Q(SBox_inst_AND_M4_t_DR1[5]), .QN() );
  DFF_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]), .CK(clk), .Q(SBox_inst_AND_M4_t_DR1[6]), .QN() );
  DFF_X1 SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M4_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]), .CK(clk), .Q(SBox_inst_AND_M4_t_DR1[7]), .QN() );
  NAND3_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_0__1_), .A2(SBox_inst_t0[36]), .A3(
        SBox_inst_AND_M4_t_DR0[3]), .ZN(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_0__2_), .A2(SBox_inst_t0[36]), .A3(
        SBox_inst_AND_M4_t_DR0[2]), .ZN(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_0__1_), .A2(SBox_inst_t0[37]), .A3(
        SBox_inst_AND_M4_t_DR0[1]), .ZN(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_0__2_), .A2(SBox_inst_t0[37]), .A3(
        SBox_inst_AND_M4_t_DR0[0]), .ZN(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[6]) );
  NAND3_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_0__1_), .A2(SBox_inst_t0[36]), .A3(
        SBox_inst_AND_M4_t_DR0[7]), .ZN(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_0__2_), .A2(SBox_inst_t0[36]), .A3(
        SBox_inst_AND_M4_t_DR0[6]), .ZN(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_0__1_), .A2(SBox_inst_t0[37]), .A3(
        SBox_inst_AND_M4_t_DR0[5]), .ZN(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_0__2_), .A2(SBox_inst_t0[37]), .A3(
        SBox_inst_AND_M4_t_DR0[4]), .ZN(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[7]) );
  NAND3_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_0__1_), .A2(SBox_inst_t1[36]), .A3(
        SBox_inst_AND_M4_t_DR1[3]), .ZN(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_0__2_), .A2(SBox_inst_t1[36]), .A3(
        SBox_inst_AND_M4_t_DR1[2]), .ZN(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_0__1_), .A2(SBox_inst_t1[37]), .A3(
        SBox_inst_AND_M4_t_DR1[1]), .ZN(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_0__2_), .A2(SBox_inst_t1[37]), .A3(
        SBox_inst_AND_M4_t_DR1[0]), .ZN(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[6]) );
  NAND3_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_0__1_), .A2(SBox_inst_t1[36]), .A3(
        SBox_inst_AND_M4_t_DR1[7]), .ZN(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_0__2_), .A2(SBox_inst_t1[36]), .A3(
        SBox_inst_AND_M4_t_DR1[6]), .ZN(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_0__1_), .A2(SBox_inst_t1[37]), .A3(
        SBox_inst_AND_M4_t_DR1[5]), .ZN(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_0__2_), .A2(SBox_inst_t1[37]), .A3(
        SBox_inst_AND_M4_t_DR1[4]), .ZN(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M4_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[7]) );
  XOR2_X1 SBox_inst_XOR_M5_layer0_xor_U1 ( .A(SBox_inst_m[4]), .B(
        SBox_inst_m[1]), .Z(SBox_inst_m[5]) );
  AOI22_X1 SBox_inst_XOR_M5_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[6]), .A2(SBox_inst_m0[1]), .B1(SBox_inst_m0[7]), .B2(
        SBox_inst_m0[0]), .ZN(
        SBox_inst_XOR_M5_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M5_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[6]), .A2(SBox_inst_m0[0]), .B1(SBox_inst_m0[7]), .B2(
        SBox_inst_m0[1]), .ZN(
        SBox_inst_XOR_M5_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M5_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M5_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m0[8]) );
  INV_X1 SBox_inst_XOR_M5_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M5_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m0[9]) );
  AOI22_X1 SBox_inst_XOR_M5_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[6]), .A2(SBox_inst_m1[1]), .B1(SBox_inst_m1[7]), .B2(
        SBox_inst_m1[0]), .ZN(
        SBox_inst_XOR_M5_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M5_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[6]), .A2(SBox_inst_m1[0]), .B1(SBox_inst_m1[7]), .B2(
        SBox_inst_m1[1]), .ZN(
        SBox_inst_XOR_M5_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M5_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M5_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m1[8]) );
  INV_X1 SBox_inst_XOR_M5_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M5_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m1[9]) );
  NAND2_X1 SBox_inst_AND_M6_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M49_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M58_nonlinear_precomp_b_delayed_0__0_), .ZN(
        SBox_inst_AND_M6_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M6_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M6_nonlinear_layer0_a0nandb0), .B(r_SR[3]), .ZN(
        SBox_inst_m[6]) );
  XOR2_X1 SBox_inst_AND_M6_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M58_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[3]), 
        .Z(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 SBox_inst_AND_M6_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M49_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[3]), 
        .Z(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 SBox_inst_AND_M6_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M49_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_) );
  INV_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( 
        .A(r_SR[3]), .ZN(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_) );
  INV_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( 
        .A(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( 
        .A(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_) );
  INV_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( 
        .A(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_) );
  NOR2_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]) );
  NOR2_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[3]), .ZN(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]) );
  NOR2_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]) );
  NOR2_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]) );
  NOR2_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]) );
  DFF_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]), .CK(clk), .Q(SBox_inst_AND_M6_t_DR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]), .CK(clk), .Q(SBox_inst_AND_M6_t_DR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]), .CK(clk), .Q(SBox_inst_AND_M6_t_DR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]), .CK(clk), .Q(SBox_inst_AND_M6_t_DR0[3]), .QN() );
  DFF_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]), .CK(clk), .Q(SBox_inst_AND_M6_t_DR0[4]), .QN() );
  DFF_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]), .CK(clk), .Q(SBox_inst_AND_M6_t_DR0[5]), .QN() );
  DFF_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]), .CK(clk), .Q(SBox_inst_AND_M6_t_DR0[6]), .QN() );
  DFF_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]), .CK(clk), .Q(SBox_inst_AND_M6_t_DR0[7]), .QN() );
  NOR2_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]) );
  NOR2_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[3]), .ZN(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]) );
  NOR2_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]) );
  NOR2_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]) );
  NOR2_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]) );
  DFF_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]), .CK(clk), .Q(SBox_inst_AND_M6_t_DR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]), .CK(clk), .Q(SBox_inst_AND_M6_t_DR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]), .CK(clk), .Q(SBox_inst_AND_M6_t_DR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]), .CK(clk), .Q(SBox_inst_AND_M6_t_DR1[3]), .QN() );
  DFF_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]), .CK(clk), .Q(SBox_inst_AND_M6_t_DR1[4]), .QN() );
  DFF_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]), .CK(clk), .Q(SBox_inst_AND_M6_t_DR1[5]), .QN() );
  DFF_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]), .CK(clk), .Q(SBox_inst_AND_M6_t_DR1[6]), .QN() );
  DFF_X1 SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M6_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]), .CK(clk), .Q(SBox_inst_AND_M6_t_DR1[7]), .QN() );
  NAND3_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[30]), .A2(SBox_inst_t0[4]), .A3(
        SBox_inst_AND_M6_t_DR0[3]), .ZN(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[31]), .A2(SBox_inst_t0[4]), .A3(
        SBox_inst_AND_M6_t_DR0[2]), .ZN(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[30]), .A2(SBox_inst_t0[5]), .A3(
        SBox_inst_AND_M6_t_DR0[1]), .ZN(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[31]), .A2(SBox_inst_t0[5]), .A3(
        SBox_inst_AND_M6_t_DR0[0]), .ZN(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[10]) );
  NAND3_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[30]), .A2(SBox_inst_t0[4]), .A3(
        SBox_inst_AND_M6_t_DR0[7]), .ZN(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[31]), .A2(SBox_inst_t0[4]), .A3(
        SBox_inst_AND_M6_t_DR0[6]), .ZN(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[30]), .A2(SBox_inst_t0[5]), .A3(
        SBox_inst_AND_M6_t_DR0[5]), .ZN(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[31]), .A2(SBox_inst_t0[5]), .A3(
        SBox_inst_AND_M6_t_DR0[4]), .ZN(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[11]) );
  NAND3_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[30]), .A2(SBox_inst_t1[4]), .A3(
        SBox_inst_AND_M6_t_DR1[3]), .ZN(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[31]), .A2(SBox_inst_t1[4]), .A3(
        SBox_inst_AND_M6_t_DR1[2]), .ZN(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[30]), .A2(SBox_inst_t1[5]), .A3(
        SBox_inst_AND_M6_t_DR1[1]), .ZN(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[31]), .A2(SBox_inst_t1[5]), .A3(
        SBox_inst_AND_M6_t_DR1[0]), .ZN(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[10]) );
  NAND3_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[30]), .A2(SBox_inst_t1[4]), .A3(
        SBox_inst_AND_M6_t_DR1[7]), .ZN(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[31]), .A2(SBox_inst_t1[4]), .A3(
        SBox_inst_AND_M6_t_DR1[6]), .ZN(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[30]), .A2(SBox_inst_t1[5]), .A3(
        SBox_inst_AND_M6_t_DR1[5]), .ZN(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[31]), .A2(SBox_inst_t1[5]), .A3(
        SBox_inst_AND_M6_t_DR1[4]), .ZN(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M6_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[11]) );
  NAND2_X1 SBox_inst_AND_M7_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M50_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M59_nonlinear_precomp_b_delayed_0__0_), .ZN(
        SBox_inst_AND_M7_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M7_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M7_nonlinear_layer0_a0nandb0), .B(r_SR[4]), .ZN(
        SBox_inst_m[7]) );
  XOR2_X1 SBox_inst_AND_M7_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M59_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[4]), 
        .Z(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 SBox_inst_AND_M7_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M50_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[4]), 
        .Z(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 SBox_inst_AND_M7_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M50_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_) );
  INV_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( 
        .A(r_SR[4]), .ZN(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_) );
  INV_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( 
        .A(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( 
        .A(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_) );
  INV_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( 
        .A(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_) );
  NOR2_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]) );
  NOR2_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[4]), .ZN(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]) );
  NOR2_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]) );
  NOR2_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]) );
  NOR2_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]) );
  DFF_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]), .CK(clk), .Q(SBox_inst_AND_M7_t_DR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]), .CK(clk), .Q(SBox_inst_AND_M7_t_DR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]), .CK(clk), .Q(SBox_inst_AND_M7_t_DR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]), .CK(clk), .Q(SBox_inst_AND_M7_t_DR0[3]), .QN() );
  DFF_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]), .CK(clk), .Q(SBox_inst_AND_M7_t_DR0[4]), .QN() );
  DFF_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]), .CK(clk), .Q(SBox_inst_AND_M7_t_DR0[5]), .QN() );
  DFF_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]), .CK(clk), .Q(SBox_inst_AND_M7_t_DR0[6]), .QN() );
  DFF_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]), .CK(clk), .Q(SBox_inst_AND_M7_t_DR0[7]), .QN() );
  NOR2_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]) );
  NOR2_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[4]), .ZN(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]) );
  NOR2_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]) );
  NOR2_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]) );
  NOR2_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]) );
  DFF_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]), .CK(clk), .Q(SBox_inst_AND_M7_t_DR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]), .CK(clk), .Q(SBox_inst_AND_M7_t_DR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]), .CK(clk), .Q(SBox_inst_AND_M7_t_DR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]), .CK(clk), .Q(SBox_inst_AND_M7_t_DR1[3]), .QN() );
  DFF_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]), .CK(clk), .Q(SBox_inst_AND_M7_t_DR1[4]), .QN() );
  DFF_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]), .CK(clk), .Q(SBox_inst_AND_M7_t_DR1[5]), .QN() );
  DFF_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]), .CK(clk), .Q(SBox_inst_AND_M7_t_DR1[6]), .QN() );
  DFF_X1 SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M7_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]), .CK(clk), .Q(SBox_inst_AND_M7_t_DR1[7]), .QN() );
  NAND3_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[16]), .A2(SBox_inst_t0[42]), .A3(
        SBox_inst_AND_M7_t_DR0[3]), .ZN(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[17]), .A2(SBox_inst_t0[42]), .A3(
        SBox_inst_AND_M7_t_DR0[2]), .ZN(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[16]), .A2(SBox_inst_t0[43]), .A3(
        SBox_inst_AND_M7_t_DR0[1]), .ZN(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[17]), .A2(SBox_inst_t0[43]), .A3(
        SBox_inst_AND_M7_t_DR0[0]), .ZN(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[12]) );
  NAND3_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[16]), .A2(SBox_inst_t0[42]), .A3(
        SBox_inst_AND_M7_t_DR0[7]), .ZN(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[17]), .A2(SBox_inst_t0[42]), .A3(
        SBox_inst_AND_M7_t_DR0[6]), .ZN(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[16]), .A2(SBox_inst_t0[43]), .A3(
        SBox_inst_AND_M7_t_DR0[5]), .ZN(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[17]), .A2(SBox_inst_t0[43]), .A3(
        SBox_inst_AND_M7_t_DR0[4]), .ZN(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[13]) );
  NAND3_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[16]), .A2(SBox_inst_t1[42]), .A3(
        SBox_inst_AND_M7_t_DR1[3]), .ZN(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[17]), .A2(SBox_inst_t1[42]), .A3(
        SBox_inst_AND_M7_t_DR1[2]), .ZN(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[16]), .A2(SBox_inst_t1[43]), .A3(
        SBox_inst_AND_M7_t_DR1[1]), .ZN(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[17]), .A2(SBox_inst_t1[43]), .A3(
        SBox_inst_AND_M7_t_DR1[0]), .ZN(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[12]) );
  NAND3_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[16]), .A2(SBox_inst_t1[42]), .A3(
        SBox_inst_AND_M7_t_DR1[7]), .ZN(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[17]), .A2(SBox_inst_t1[42]), .A3(
        SBox_inst_AND_M7_t_DR1[6]), .ZN(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[16]), .A2(SBox_inst_t1[43]), .A3(
        SBox_inst_AND_M7_t_DR1[5]), .ZN(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[17]), .A2(SBox_inst_t1[43]), .A3(
        SBox_inst_AND_M7_t_DR1[4]), .ZN(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M7_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[13]) );
  XOR2_X1 SBox_inst_XOR_M8_layer0_xor_U1 ( .A(SBox_inst_t[26]), .B(
        SBox_inst_m[6]), .Z(SBox_inst_m[8]) );
  AOI22_X1 SBox_inst_XOR_M8_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t0[50]), .A2(SBox_inst_m0[11]), .B1(SBox_inst_t0[51]), 
        .B2(SBox_inst_m0[10]), .ZN(
        SBox_inst_XOR_M8_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M8_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t0[50]), .A2(SBox_inst_m0[10]), .B1(SBox_inst_t0[51]), 
        .B2(SBox_inst_m0[11]), .ZN(
        SBox_inst_XOR_M8_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M8_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M8_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m0[14]) );
  INV_X1 SBox_inst_XOR_M8_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M8_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m0[15]) );
  AOI22_X1 SBox_inst_XOR_M8_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_t1[50]), .A2(SBox_inst_m1[11]), .B1(SBox_inst_t1[51]), 
        .B2(SBox_inst_m1[10]), .ZN(
        SBox_inst_XOR_M8_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M8_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_t1[50]), .A2(SBox_inst_m1[10]), .B1(SBox_inst_t1[51]), 
        .B2(SBox_inst_m1[11]), .ZN(
        SBox_inst_XOR_M8_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M8_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M8_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m1[14]) );
  INV_X1 SBox_inst_XOR_M8_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M8_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m1[15]) );
  NAND2_X1 SBox_inst_AND_M9_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M51_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M60_nonlinear_precomp_b_delayed_0__0_), .ZN(
        SBox_inst_AND_M9_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M9_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M9_nonlinear_layer0_a0nandb0), .B(r_SR[5]), .ZN(
        SBox_inst_m[9]) );
  XOR2_X1 SBox_inst_AND_M9_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M60_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[5]), 
        .Z(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 SBox_inst_AND_M9_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M51_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[5]), 
        .Z(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 SBox_inst_AND_M9_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M51_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_) );
  INV_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( 
        .A(r_SR[5]), .ZN(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_) );
  INV_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( 
        .A(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( 
        .A(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_) );
  INV_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( 
        .A(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_) );
  NOR2_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]) );
  NOR2_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[5]), .ZN(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]) );
  NOR2_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]) );
  NOR2_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]) );
  NOR2_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]) );
  DFF_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]), .CK(clk), .Q(SBox_inst_AND_M9_t_DR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]), .CK(clk), .Q(SBox_inst_AND_M9_t_DR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]), .CK(clk), .Q(SBox_inst_AND_M9_t_DR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]), .CK(clk), .Q(SBox_inst_AND_M9_t_DR0[3]), .QN() );
  DFF_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]), .CK(clk), .Q(SBox_inst_AND_M9_t_DR0[4]), .QN() );
  DFF_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]), .CK(clk), .Q(SBox_inst_AND_M9_t_DR0[5]), .QN() );
  DFF_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]), .CK(clk), .Q(SBox_inst_AND_M9_t_DR0[6]), .QN() );
  DFF_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]), .CK(clk), .Q(SBox_inst_AND_M9_t_DR0[7]), .QN() );
  NOR2_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]) );
  NOR2_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[5]), .ZN(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]) );
  NOR2_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]) );
  NOR2_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]) );
  NOR2_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]) );
  DFF_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]), .CK(clk), .Q(SBox_inst_AND_M9_t_DR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]), .CK(clk), .Q(SBox_inst_AND_M9_t_DR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]), .CK(clk), .Q(SBox_inst_AND_M9_t_DR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]), .CK(clk), .Q(SBox_inst_AND_M9_t_DR1[3]), .QN() );
  DFF_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]), .CK(clk), .Q(SBox_inst_AND_M9_t_DR1[4]), .QN() );
  DFF_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]), .CK(clk), .Q(SBox_inst_AND_M9_t_DR1[5]), .QN() );
  DFF_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]), .CK(clk), .Q(SBox_inst_AND_M9_t_DR1[6]), .QN() );
  DFF_X1 SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M9_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]), .CK(clk), .Q(SBox_inst_AND_M9_t_DR1[7]), .QN() );
  NAND3_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[32]), .A2(SBox_inst_t0[38]), .A3(
        SBox_inst_AND_M9_t_DR0[3]), .ZN(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[33]), .A2(SBox_inst_t0[38]), .A3(
        SBox_inst_AND_M9_t_DR0[2]), .ZN(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[32]), .A2(SBox_inst_t0[39]), .A3(
        SBox_inst_AND_M9_t_DR0[1]), .ZN(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[33]), .A2(SBox_inst_t0[39]), .A3(
        SBox_inst_AND_M9_t_DR0[0]), .ZN(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[16]) );
  NAND3_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[32]), .A2(SBox_inst_t0[38]), .A3(
        SBox_inst_AND_M9_t_DR0[7]), .ZN(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[33]), .A2(SBox_inst_t0[38]), .A3(
        SBox_inst_AND_M9_t_DR0[6]), .ZN(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[32]), .A2(SBox_inst_t0[39]), .A3(
        SBox_inst_AND_M9_t_DR0[5]), .ZN(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[33]), .A2(SBox_inst_t0[39]), .A3(
        SBox_inst_AND_M9_t_DR0[4]), .ZN(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[17]) );
  NAND3_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[32]), .A2(SBox_inst_t1[38]), .A3(
        SBox_inst_AND_M9_t_DR1[3]), .ZN(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[33]), .A2(SBox_inst_t1[38]), .A3(
        SBox_inst_AND_M9_t_DR1[2]), .ZN(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[32]), .A2(SBox_inst_t1[39]), .A3(
        SBox_inst_AND_M9_t_DR1[1]), .ZN(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[33]), .A2(SBox_inst_t1[39]), .A3(
        SBox_inst_AND_M9_t_DR1[0]), .ZN(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[16]) );
  NAND3_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[32]), .A2(SBox_inst_t1[38]), .A3(
        SBox_inst_AND_M9_t_DR1[7]), .ZN(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[33]), .A2(SBox_inst_t1[38]), .A3(
        SBox_inst_AND_M9_t_DR1[6]), .ZN(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[32]), .A2(SBox_inst_t1[39]), .A3(
        SBox_inst_AND_M9_t_DR1[5]), .ZN(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[33]), .A2(SBox_inst_t1[39]), .A3(
        SBox_inst_AND_M9_t_DR1[4]), .ZN(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M9_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[17]) );
  XOR2_X1 SBox_inst_XOR_M10_layer0_xor_U1 ( .A(SBox_inst_m[9]), .B(
        SBox_inst_m[6]), .Z(SBox_inst_m[10]) );
  AOI22_X1 SBox_inst_XOR_M10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[16]), .A2(SBox_inst_m0[11]), .B1(SBox_inst_m0[17]), 
        .B2(SBox_inst_m0[10]), .ZN(
        SBox_inst_XOR_M10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[16]), .A2(SBox_inst_m0[10]), .B1(SBox_inst_m0[17]), 
        .B2(SBox_inst_m0[11]), .ZN(
        SBox_inst_XOR_M10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m0[18]) );
  INV_X1 SBox_inst_XOR_M10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M10_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m0[19]) );
  AOI22_X1 SBox_inst_XOR_M10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[16]), .A2(SBox_inst_m1[11]), .B1(SBox_inst_m1[17]), 
        .B2(SBox_inst_m1[10]), .ZN(
        SBox_inst_XOR_M10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[16]), .A2(SBox_inst_m1[10]), .B1(SBox_inst_m1[17]), 
        .B2(SBox_inst_m1[11]), .ZN(
        SBox_inst_XOR_M10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m1[18]) );
  INV_X1 SBox_inst_XOR_M10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M10_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m1[19]) );
  NAND2_X1 SBox_inst_AND_M11_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M52_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M61_nonlinear_precomp_b_delayed_0__0_), .ZN(
        SBox_inst_AND_M11_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M11_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M11_nonlinear_layer0_a0nandb0), .B(r_SR[6]), .ZN(
        SBox_inst_m[11]) );
  XOR2_X1 SBox_inst_AND_M11_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M61_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[6]), 
        .Z(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 SBox_inst_AND_M11_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M52_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[6]), 
        .Z(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 SBox_inst_AND_M11_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M52_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_) );
  INV_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( 
        .A(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_) );
  INV_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( 
        .A(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( 
        .A(r_SR[6]), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_) );
  INV_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( 
        .A(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_) );
  NOR2_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]) );
  NOR2_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[6]), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]) );
  NOR2_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]) );
  NOR2_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]) );
  NOR2_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]) );
  DFF_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]), .CK(clk), .Q(SBox_inst_AND_M11_t_DR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]), .CK(clk), .Q(SBox_inst_AND_M11_t_DR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]), .CK(clk), .Q(SBox_inst_AND_M11_t_DR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]), .CK(clk), .Q(SBox_inst_AND_M11_t_DR0[3]), .QN() );
  DFF_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]), .CK(clk), .Q(SBox_inst_AND_M11_t_DR0[4]), .QN() );
  DFF_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]), .CK(clk), .Q(SBox_inst_AND_M11_t_DR0[5]), .QN() );
  DFF_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]), .CK(clk), .Q(SBox_inst_AND_M11_t_DR0[6]), .QN() );
  DFF_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]), .CK(clk), .Q(SBox_inst_AND_M11_t_DR0[7]), .QN() );
  NOR2_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]) );
  NOR2_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[6]), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]) );
  NOR2_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]) );
  NOR2_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]) );
  NOR2_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]) );
  DFF_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]), .CK(clk), .Q(SBox_inst_AND_M11_t_DR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]), .CK(clk), .Q(SBox_inst_AND_M11_t_DR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]), .CK(clk), .Q(SBox_inst_AND_M11_t_DR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]), .CK(clk), .Q(SBox_inst_AND_M11_t_DR1[3]), .QN() );
  DFF_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]), .CK(clk), .Q(SBox_inst_AND_M11_t_DR1[4]), .QN() );
  DFF_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]), .CK(clk), .Q(SBox_inst_AND_M11_t_DR1[5]), .QN() );
  DFF_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]), .CK(clk), .Q(SBox_inst_AND_M11_t_DR1[6]), .QN() );
  DFF_X1 SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M11_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]), .CK(clk), .Q(SBox_inst_AND_M11_t_DR1[7]), .QN() );
  NAND3_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[28]), .A2(SBox_inst_t0[0]), .A3(
        SBox_inst_AND_M11_t_DR0[3]), .ZN(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[29]), .A2(SBox_inst_t0[0]), .A3(
        SBox_inst_AND_M11_t_DR0[2]), .ZN(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[28]), .A2(SBox_inst_t0[1]), .A3(
        SBox_inst_AND_M11_t_DR0[1]), .ZN(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[29]), .A2(SBox_inst_t0[1]), .A3(
        SBox_inst_AND_M11_t_DR0[0]), .ZN(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[20]) );
  NAND3_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[28]), .A2(SBox_inst_t0[0]), .A3(
        SBox_inst_AND_M11_t_DR0[7]), .ZN(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[29]), .A2(SBox_inst_t0[0]), .A3(
        SBox_inst_AND_M11_t_DR0[6]), .ZN(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[28]), .A2(SBox_inst_t0[1]), .A3(
        SBox_inst_AND_M11_t_DR0[5]), .ZN(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[29]), .A2(SBox_inst_t0[1]), .A3(
        SBox_inst_AND_M11_t_DR0[4]), .ZN(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[21]) );
  NAND3_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[28]), .A2(SBox_inst_t1[0]), .A3(
        SBox_inst_AND_M11_t_DR1[3]), .ZN(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[29]), .A2(SBox_inst_t1[0]), .A3(
        SBox_inst_AND_M11_t_DR1[2]), .ZN(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[28]), .A2(SBox_inst_t1[1]), .A3(
        SBox_inst_AND_M11_t_DR1[1]), .ZN(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[29]), .A2(SBox_inst_t1[1]), .A3(
        SBox_inst_AND_M11_t_DR1[0]), .ZN(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[20]) );
  NAND3_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[28]), .A2(SBox_inst_t1[0]), .A3(
        SBox_inst_AND_M11_t_DR1[7]), .ZN(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[29]), .A2(SBox_inst_t1[0]), .A3(
        SBox_inst_AND_M11_t_DR1[6]), .ZN(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[28]), .A2(SBox_inst_t1[1]), .A3(
        SBox_inst_AND_M11_t_DR1[5]), .ZN(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[29]), .A2(SBox_inst_t1[1]), .A3(
        SBox_inst_AND_M11_t_DR1[4]), .ZN(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M11_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[21]) );
  NAND2_X1 SBox_inst_AND_M12_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M53_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M62_nonlinear_precomp_b_delayed_0__0_), .ZN(
        SBox_inst_AND_M12_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M12_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M12_nonlinear_layer0_a0nandb0), .B(r_SR[7]), .ZN(
        SBox_inst_m[12]) );
  XOR2_X1 SBox_inst_AND_M12_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M62_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[7]), 
        .Z(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 SBox_inst_AND_M12_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M53_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[7]), 
        .Z(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 SBox_inst_AND_M12_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M53_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_) );
  INV_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( 
        .A(r_SR[7]), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_) );
  INV_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( 
        .A(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( 
        .A(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_) );
  INV_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( 
        .A(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_) );
  NOR2_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]) );
  NOR2_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[7]), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]) );
  NOR2_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]) );
  NOR2_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]) );
  NOR2_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]) );
  DFF_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]), .CK(clk), .Q(SBox_inst_AND_M12_t_DR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]), .CK(clk), .Q(SBox_inst_AND_M12_t_DR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]), .CK(clk), .Q(SBox_inst_AND_M12_t_DR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]), .CK(clk), .Q(SBox_inst_AND_M12_t_DR0[3]), .QN() );
  DFF_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]), .CK(clk), .Q(SBox_inst_AND_M12_t_DR0[4]), .QN() );
  DFF_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]), .CK(clk), .Q(SBox_inst_AND_M12_t_DR0[5]), .QN() );
  DFF_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]), .CK(clk), .Q(SBox_inst_AND_M12_t_DR0[6]), .QN() );
  DFF_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]), .CK(clk), .Q(SBox_inst_AND_M12_t_DR0[7]), .QN() );
  NOR2_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]) );
  NOR2_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[7]), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]) );
  NOR2_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]) );
  NOR2_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]) );
  NOR2_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]) );
  DFF_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]), .CK(clk), .Q(SBox_inst_AND_M12_t_DR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]), .CK(clk), .Q(SBox_inst_AND_M12_t_DR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]), .CK(clk), .Q(SBox_inst_AND_M12_t_DR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]), .CK(clk), .Q(SBox_inst_AND_M12_t_DR1[3]), .QN() );
  DFF_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]), .CK(clk), .Q(SBox_inst_AND_M12_t_DR1[4]), .QN() );
  DFF_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]), .CK(clk), .Q(SBox_inst_AND_M12_t_DR1[5]), .QN() );
  DFF_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]), .CK(clk), .Q(SBox_inst_AND_M12_t_DR1[6]), .QN() );
  DFF_X1 SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M12_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]), .CK(clk), .Q(SBox_inst_AND_M12_t_DR1[7]), .QN() );
  NAND3_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[52]), .A2(SBox_inst_t0[6]), .A3(
        SBox_inst_AND_M12_t_DR0[3]), .ZN(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[53]), .A2(SBox_inst_t0[6]), .A3(
        SBox_inst_AND_M12_t_DR0[2]), .ZN(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[52]), .A2(SBox_inst_t0[7]), .A3(
        SBox_inst_AND_M12_t_DR0[1]), .ZN(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[53]), .A2(SBox_inst_t0[7]), .A3(
        SBox_inst_AND_M12_t_DR0[0]), .ZN(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[22]) );
  NAND3_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[52]), .A2(SBox_inst_t0[6]), .A3(
        SBox_inst_AND_M12_t_DR0[7]), .ZN(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[53]), .A2(SBox_inst_t0[6]), .A3(
        SBox_inst_AND_M12_t_DR0[6]), .ZN(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[52]), .A2(SBox_inst_t0[7]), .A3(
        SBox_inst_AND_M12_t_DR0[5]), .ZN(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[53]), .A2(SBox_inst_t0[7]), .A3(
        SBox_inst_AND_M12_t_DR0[4]), .ZN(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[23]) );
  NAND3_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[52]), .A2(SBox_inst_t1[6]), .A3(
        SBox_inst_AND_M12_t_DR1[3]), .ZN(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[53]), .A2(SBox_inst_t1[6]), .A3(
        SBox_inst_AND_M12_t_DR1[2]), .ZN(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[52]), .A2(SBox_inst_t1[7]), .A3(
        SBox_inst_AND_M12_t_DR1[1]), .ZN(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[53]), .A2(SBox_inst_t1[7]), .A3(
        SBox_inst_AND_M12_t_DR1[0]), .ZN(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[22]) );
  NAND3_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[52]), .A2(SBox_inst_t1[6]), .A3(
        SBox_inst_AND_M12_t_DR1[7]), .ZN(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[53]), .A2(SBox_inst_t1[6]), .A3(
        SBox_inst_AND_M12_t_DR1[6]), .ZN(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[52]), .A2(SBox_inst_t1[7]), .A3(
        SBox_inst_AND_M12_t_DR1[5]), .ZN(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[53]), .A2(SBox_inst_t1[7]), .A3(
        SBox_inst_AND_M12_t_DR1[4]), .ZN(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M12_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[23]) );
  XOR2_X1 SBox_inst_XOR_M13_layer0_xor_U1 ( .A(SBox_inst_m[12]), .B(
        SBox_inst_m[11]), .Z(SBox_inst_m[13]) );
  AOI22_X1 SBox_inst_XOR_M13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[22]), .A2(SBox_inst_m0[21]), .B1(SBox_inst_m0[23]), 
        .B2(SBox_inst_m0[20]), .ZN(
        SBox_inst_XOR_M13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[22]), .A2(SBox_inst_m0[20]), .B1(SBox_inst_m0[23]), 
        .B2(SBox_inst_m0[21]), .ZN(
        SBox_inst_XOR_M13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m0[24]) );
  INV_X1 SBox_inst_XOR_M13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M13_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m0[25]) );
  AOI22_X1 SBox_inst_XOR_M13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[22]), .A2(SBox_inst_m1[21]), .B1(SBox_inst_m1[23]), 
        .B2(SBox_inst_m1[20]), .ZN(
        SBox_inst_XOR_M13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[22]), .A2(SBox_inst_m1[20]), .B1(SBox_inst_m1[23]), 
        .B2(SBox_inst_m1[21]), .ZN(
        SBox_inst_XOR_M13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m1[24]) );
  INV_X1 SBox_inst_XOR_M13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M13_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m1[25]) );
  NAND2_X1 SBox_inst_AND_M14_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M54_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M63_nonlinear_precomp_b_delayed_0__0_), .ZN(
        SBox_inst_AND_M14_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M14_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M14_nonlinear_layer0_a0nandb0), .B(r_SR[8]), .ZN(
        SBox_inst_m[14]) );
  XOR2_X1 SBox_inst_AND_M14_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M63_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[8]), 
        .Z(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 SBox_inst_AND_M14_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M54_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[8]), 
        .Z(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 SBox_inst_AND_M14_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M54_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_) );
  INV_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( 
        .A(r_SR[8]), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_) );
  INV_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( 
        .A(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( 
        .A(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_) );
  INV_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( 
        .A(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_) );
  NOR2_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]) );
  NOR2_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[8]), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]) );
  NOR2_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]) );
  NOR2_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]) );
  NOR2_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]) );
  DFF_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]), .CK(clk), .Q(SBox_inst_AND_M14_t_DR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]), .CK(clk), .Q(SBox_inst_AND_M14_t_DR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]), .CK(clk), .Q(SBox_inst_AND_M14_t_DR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]), .CK(clk), .Q(SBox_inst_AND_M14_t_DR0[3]), .QN() );
  DFF_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]), .CK(clk), .Q(SBox_inst_AND_M14_t_DR0[4]), .QN() );
  DFF_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]), .CK(clk), .Q(SBox_inst_AND_M14_t_DR0[5]), .QN() );
  DFF_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]), .CK(clk), .Q(SBox_inst_AND_M14_t_DR0[6]), .QN() );
  DFF_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]), .CK(clk), .Q(SBox_inst_AND_M14_t_DR0[7]), .QN() );
  NOR2_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]) );
  NOR2_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[8]), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]) );
  NOR2_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]) );
  NOR2_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]) );
  NOR2_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]) );
  DFF_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]), .CK(clk), .Q(SBox_inst_AND_M14_t_DR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]), .CK(clk), .Q(SBox_inst_AND_M14_t_DR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]), .CK(clk), .Q(SBox_inst_AND_M14_t_DR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]), .CK(clk), .Q(SBox_inst_AND_M14_t_DR1[3]), .QN() );
  DFF_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]), .CK(clk), .Q(SBox_inst_AND_M14_t_DR1[4]), .QN() );
  DFF_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]), .CK(clk), .Q(SBox_inst_AND_M14_t_DR1[5]), .QN() );
  DFF_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]), .CK(clk), .Q(SBox_inst_AND_M14_t_DR1[6]), .QN() );
  DFF_X1 SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_M14_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]), .CK(clk), .Q(SBox_inst_AND_M14_t_DR1[7]), .QN() );
  NAND3_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[18]), .A2(SBox_inst_t0[2]), .A3(
        SBox_inst_AND_M14_t_DR0[3]), .ZN(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[19]), .A2(SBox_inst_t0[2]), .A3(
        SBox_inst_AND_M14_t_DR0[2]), .ZN(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[18]), .A2(SBox_inst_t0[3]), .A3(
        SBox_inst_AND_M14_t_DR0[1]), .ZN(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[19]), .A2(SBox_inst_t0[3]), .A3(
        SBox_inst_AND_M14_t_DR0[0]), .ZN(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[26]) );
  NAND3_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[18]), .A2(SBox_inst_t0[2]), .A3(
        SBox_inst_AND_M14_t_DR0[7]), .ZN(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[19]), .A2(SBox_inst_t0[2]), .A3(
        SBox_inst_AND_M14_t_DR0[6]), .ZN(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[18]), .A2(SBox_inst_t0[3]), .A3(
        SBox_inst_AND_M14_t_DR0[5]), .ZN(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[19]), .A2(SBox_inst_t0[3]), .A3(
        SBox_inst_AND_M14_t_DR0[4]), .ZN(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m0[27]) );
  NAND3_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[18]), .A2(SBox_inst_t1[2]), .A3(
        SBox_inst_AND_M14_t_DR1[3]), .ZN(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[19]), .A2(SBox_inst_t1[2]), .A3(
        SBox_inst_AND_M14_t_DR1[2]), .ZN(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[18]), .A2(SBox_inst_t1[3]), .A3(
        SBox_inst_AND_M14_t_DR1[1]), .ZN(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[19]), .A2(SBox_inst_t1[3]), .A3(
        SBox_inst_AND_M14_t_DR1[0]), .ZN(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[26]) );
  NAND3_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[18]), .A2(SBox_inst_t1[2]), .A3(
        SBox_inst_AND_M14_t_DR1[7]), .ZN(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[19]), .A2(SBox_inst_t1[2]), .A3(
        SBox_inst_AND_M14_t_DR1[6]), .ZN(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[18]), .A2(SBox_inst_t1[3]), .A3(
        SBox_inst_AND_M14_t_DR1[5]), .ZN(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[19]), .A2(SBox_inst_t1[3]), .A3(
        SBox_inst_AND_M14_t_DR1[4]), .ZN(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M14_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_m1[27]) );
  XOR2_X1 SBox_inst_XOR_M15_layer0_xor_U1 ( .A(SBox_inst_m[14]), .B(
        SBox_inst_m[11]), .Z(SBox_inst_m[15]) );
  AOI22_X1 SBox_inst_XOR_M15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[26]), .A2(SBox_inst_m0[21]), .B1(SBox_inst_m0[27]), 
        .B2(SBox_inst_m0[20]), .ZN(
        SBox_inst_XOR_M15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[26]), .A2(SBox_inst_m0[20]), .B1(SBox_inst_m0[27]), 
        .B2(SBox_inst_m0[21]), .ZN(
        SBox_inst_XOR_M15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m0[28]) );
  INV_X1 SBox_inst_XOR_M15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M15_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m0[29]) );
  AOI22_X1 SBox_inst_XOR_M15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[26]), .A2(SBox_inst_m1[21]), .B1(SBox_inst_m1[27]), 
        .B2(SBox_inst_m1[20]), .ZN(
        SBox_inst_XOR_M15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[26]), .A2(SBox_inst_m1[20]), .B1(SBox_inst_m1[27]), 
        .B2(SBox_inst_m1[21]), .ZN(
        SBox_inst_XOR_M15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m1[28]) );
  INV_X1 SBox_inst_XOR_M15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M15_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m1[29]) );
  XOR2_X1 SBox_inst_XOR_M16_layer0_xor_U1 ( .A(SBox_inst_m[3]), .B(
        SBox_inst_m[2]), .Z(SBox_inst_m[16]) );
  AOI22_X1 SBox_inst_XOR_M16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[4]), .A2(SBox_inst_m0[3]), .B1(SBox_inst_m0[5]), .B2(
        SBox_inst_m0[2]), .ZN(
        SBox_inst_XOR_M16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[4]), .A2(SBox_inst_m0[2]), .B1(SBox_inst_m0[5]), .B2(
        SBox_inst_m0[3]), .ZN(
        SBox_inst_XOR_M16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m0[30]) );
  INV_X1 SBox_inst_XOR_M16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M16_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m0[31]) );
  AOI22_X1 SBox_inst_XOR_M16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[4]), .A2(SBox_inst_m1[3]), .B1(SBox_inst_m1[5]), .B2(
        SBox_inst_m1[2]), .ZN(
        SBox_inst_XOR_M16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[4]), .A2(SBox_inst_m1[2]), .B1(SBox_inst_m1[5]), .B2(
        SBox_inst_m1[3]), .ZN(
        SBox_inst_XOR_M16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m1[30]) );
  INV_X1 SBox_inst_XOR_M16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M16_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m1[31]) );
  XOR2_X1 SBox_inst_XOR_M17_layer0_xor_U1 ( .A(SBox_inst_m[5]), .B(
        SBox_inst_t[24]), .Z(SBox_inst_m[17]) );
  AOI22_X1 SBox_inst_XOR_M17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[8]), .A2(SBox_inst_t0[47]), .B1(SBox_inst_m0[9]), 
        .B2(SBox_inst_t0[46]), .ZN(
        SBox_inst_XOR_M17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[8]), .A2(SBox_inst_t0[46]), .B1(SBox_inst_m0[9]), 
        .B2(SBox_inst_t0[47]), .ZN(
        SBox_inst_XOR_M17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m0[32]) );
  INV_X1 SBox_inst_XOR_M17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M17_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m0[33]) );
  AOI22_X1 SBox_inst_XOR_M17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[8]), .A2(SBox_inst_t1[47]), .B1(SBox_inst_m1[9]), 
        .B2(SBox_inst_t1[46]), .ZN(
        SBox_inst_XOR_M17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[8]), .A2(SBox_inst_t1[46]), .B1(SBox_inst_m1[9]), 
        .B2(SBox_inst_t1[47]), .ZN(
        SBox_inst_XOR_M17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m1[32]) );
  INV_X1 SBox_inst_XOR_M17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M17_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m1[33]) );
  XOR2_X1 SBox_inst_XOR_M18_layer0_xor_U1 ( .A(SBox_inst_m[8]), .B(
        SBox_inst_m[7]), .Z(SBox_inst_m[18]) );
  AOI22_X1 SBox_inst_XOR_M18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[14]), .A2(SBox_inst_m0[13]), .B1(SBox_inst_m0[15]), 
        .B2(SBox_inst_m0[12]), .ZN(
        SBox_inst_XOR_M18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[14]), .A2(SBox_inst_m0[12]), .B1(SBox_inst_m0[15]), 
        .B2(SBox_inst_m0[13]), .ZN(
        SBox_inst_XOR_M18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m0[34]) );
  INV_X1 SBox_inst_XOR_M18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M18_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m0[35]) );
  AOI22_X1 SBox_inst_XOR_M18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[14]), .A2(SBox_inst_m1[13]), .B1(SBox_inst_m1[15]), 
        .B2(SBox_inst_m1[12]), .ZN(
        SBox_inst_XOR_M18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[14]), .A2(SBox_inst_m1[12]), .B1(SBox_inst_m1[15]), 
        .B2(SBox_inst_m1[13]), .ZN(
        SBox_inst_XOR_M18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m1[34]) );
  INV_X1 SBox_inst_XOR_M18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M18_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m1[35]) );
  XOR2_X1 SBox_inst_XOR_M19_layer0_xor_U1 ( .A(SBox_inst_m[10]), .B(
        SBox_inst_m[15]), .Z(SBox_inst_m[19]) );
  AOI22_X1 SBox_inst_XOR_M19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[18]), .A2(SBox_inst_m0[29]), .B1(SBox_inst_m0[19]), 
        .B2(SBox_inst_m0[28]), .ZN(
        SBox_inst_XOR_M19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[18]), .A2(SBox_inst_m0[28]), .B1(SBox_inst_m0[19]), 
        .B2(SBox_inst_m0[29]), .ZN(
        SBox_inst_XOR_M19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m0[36]) );
  INV_X1 SBox_inst_XOR_M19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M19_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m0[37]) );
  AOI22_X1 SBox_inst_XOR_M19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[18]), .A2(SBox_inst_m1[29]), .B1(SBox_inst_m1[19]), 
        .B2(SBox_inst_m1[28]), .ZN(
        SBox_inst_XOR_M19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[18]), .A2(SBox_inst_m1[28]), .B1(SBox_inst_m1[19]), 
        .B2(SBox_inst_m1[29]), .ZN(
        SBox_inst_XOR_M19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m1[36]) );
  INV_X1 SBox_inst_XOR_M19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M19_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m1[37]) );
  XOR2_X1 SBox_inst_XOR_M20_layer0_xor_U1 ( .A(SBox_inst_m[16]), .B(
        SBox_inst_m[13]), .Z(
        SBox_inst_AND_E0_nonlinear_precomp_a_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_M20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[30]), .A2(SBox_inst_m0[25]), .B1(SBox_inst_m0[31]), 
        .B2(SBox_inst_m0[24]), .ZN(
        SBox_inst_XOR_M20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[30]), .A2(SBox_inst_m0[24]), .B1(SBox_inst_m0[31]), 
        .B2(SBox_inst_m0[25]), .ZN(
        SBox_inst_XOR_M20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m0[38]) );
  INV_X1 SBox_inst_XOR_M20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M20_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m0[39]) );
  AOI22_X1 SBox_inst_XOR_M20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[30]), .A2(SBox_inst_m1[25]), .B1(SBox_inst_m1[31]), 
        .B2(SBox_inst_m1[24]), .ZN(
        SBox_inst_XOR_M20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[30]), .A2(SBox_inst_m1[24]), .B1(SBox_inst_m1[31]), 
        .B2(SBox_inst_m1[25]), .ZN(
        SBox_inst_XOR_M20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m1[38]) );
  INV_X1 SBox_inst_XOR_M20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M20_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m1[39]) );
  XOR2_X1 SBox_inst_XOR_M21_layer0_xor_U1 ( .A(SBox_inst_m[17]), .B(
        SBox_inst_m[15]), .Z(
        SBox_inst_AND_B0_nonlinear_precomp_a_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_M21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[32]), .A2(SBox_inst_m0[29]), .B1(SBox_inst_m0[33]), 
        .B2(SBox_inst_m0[28]), .ZN(
        SBox_inst_XOR_M21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[32]), .A2(SBox_inst_m0[28]), .B1(SBox_inst_m0[33]), 
        .B2(SBox_inst_m0[29]), .ZN(
        SBox_inst_XOR_M21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m0[40]) );
  INV_X1 SBox_inst_XOR_M21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M21_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m0[41]) );
  AOI22_X1 SBox_inst_XOR_M21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[32]), .A2(SBox_inst_m1[29]), .B1(SBox_inst_m1[33]), 
        .B2(SBox_inst_m1[28]), .ZN(
        SBox_inst_XOR_M21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[32]), .A2(SBox_inst_m1[28]), .B1(SBox_inst_m1[33]), 
        .B2(SBox_inst_m1[29]), .ZN(
        SBox_inst_XOR_M21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m1[40]) );
  INV_X1 SBox_inst_XOR_M21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M21_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m1[41]) );
  XOR2_X1 SBox_inst_XOR_M22_layer0_xor_U1 ( .A(SBox_inst_m[18]), .B(
        SBox_inst_m[13]), .Z(
        SBox_inst_AND_E1_nonlinear_precomp_a_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_M22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[34]), .A2(SBox_inst_m0[25]), .B1(SBox_inst_m0[35]), 
        .B2(SBox_inst_m0[24]), .ZN(
        SBox_inst_XOR_M22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[34]), .A2(SBox_inst_m0[24]), .B1(SBox_inst_m0[35]), 
        .B2(SBox_inst_m0[25]), .ZN(
        SBox_inst_XOR_M22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m0[42]) );
  INV_X1 SBox_inst_XOR_M22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M22_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m0[43]) );
  AOI22_X1 SBox_inst_XOR_M22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[34]), .A2(SBox_inst_m1[25]), .B1(SBox_inst_m1[35]), 
        .B2(SBox_inst_m1[24]), .ZN(
        SBox_inst_XOR_M22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[34]), .A2(SBox_inst_m1[24]), .B1(SBox_inst_m1[35]), 
        .B2(SBox_inst_m1[25]), .ZN(
        SBox_inst_XOR_M22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m1[42]) );
  INV_X1 SBox_inst_XOR_M22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M22_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m1[43]) );
  XOR2_X1 SBox_inst_XOR_M23_layer0_xor_U1 ( .A(SBox_inst_m[19]), .B(
        SBox_inst_t[25]), .Z(
        SBox_inst_AND_B0_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_M23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[36]), .A2(SBox_inst_t0[49]), .B1(SBox_inst_m0[37]), 
        .B2(SBox_inst_t0[48]), .ZN(
        SBox_inst_XOR_M23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[36]), .A2(SBox_inst_t0[48]), .B1(SBox_inst_m0[37]), 
        .B2(SBox_inst_t0[49]), .ZN(
        SBox_inst_XOR_M23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m0[44]) );
  INV_X1 SBox_inst_XOR_M23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M23_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m0[45]) );
  AOI22_X1 SBox_inst_XOR_M23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[36]), .A2(SBox_inst_t1[49]), .B1(SBox_inst_m1[37]), 
        .B2(SBox_inst_t1[48]), .ZN(
        SBox_inst_XOR_M23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[36]), .A2(SBox_inst_t1[48]), .B1(SBox_inst_m1[37]), 
        .B2(SBox_inst_t1[49]), .ZN(
        SBox_inst_XOR_M23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m1[44]) );
  INV_X1 SBox_inst_XOR_M23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M23_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m1[45]) );
  XOR2_X1 SBox_inst_XOR_A0_layer0_xor_U1 ( .A(
        SBox_inst_AND_E1_nonlinear_precomp_a_delayed_0__0_), .B(
        SBox_inst_AND_B0_nonlinear_precomp_b_delayed_0__0_), .Z(
        SBox_inst_AND_F1_nonlinear_precomp_a_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_A0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[42]), .A2(SBox_inst_m0[45]), .B1(SBox_inst_m0[43]), 
        .B2(SBox_inst_m0[44]), .ZN(
        SBox_inst_XOR_A0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_A0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[42]), .A2(SBox_inst_m0[44]), .B1(SBox_inst_m0[43]), 
        .B2(SBox_inst_m0[45]), .ZN(
        SBox_inst_XOR_A0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_A0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_A0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_a0[0]) );
  INV_X1 SBox_inst_XOR_A0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_A0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_a0[1]) );
  AOI22_X1 SBox_inst_XOR_A0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[42]), .A2(SBox_inst_m1[45]), .B1(SBox_inst_m1[43]), 
        .B2(SBox_inst_m1[44]), .ZN(
        SBox_inst_XOR_A0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_A0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[42]), .A2(SBox_inst_m1[44]), .B1(SBox_inst_m1[43]), 
        .B2(SBox_inst_m1[45]), .ZN(
        SBox_inst_XOR_A0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_A0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_A0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_a1[0]) );
  INV_X1 SBox_inst_XOR_A0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_A0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_a1[1]) );
  XOR2_X1 SBox_inst_XOR_A1_layer0_xor_U1 ( .A(
        SBox_inst_AND_E0_nonlinear_precomp_a_delayed_0__0_), .B(
        SBox_inst_AND_B0_nonlinear_precomp_a_delayed_0__0_), .Z(
        SBox_inst_AND_F0_nonlinear_precomp_a_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_A1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[38]), .A2(SBox_inst_m0[41]), .B1(SBox_inst_m0[39]), 
        .B2(SBox_inst_m0[40]), .ZN(
        SBox_inst_XOR_A1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_A1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[38]), .A2(SBox_inst_m0[40]), .B1(SBox_inst_m0[39]), 
        .B2(SBox_inst_m0[41]), .ZN(
        SBox_inst_XOR_A1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_A1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_A1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_a0[2]) );
  INV_X1 SBox_inst_XOR_A1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_A1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_a0[3]) );
  AOI22_X1 SBox_inst_XOR_A1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[38]), .A2(SBox_inst_m1[41]), .B1(SBox_inst_m1[39]), 
        .B2(SBox_inst_m1[40]), .ZN(
        SBox_inst_XOR_A1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_A1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[38]), .A2(SBox_inst_m1[40]), .B1(SBox_inst_m1[39]), 
        .B2(SBox_inst_m1[41]), .ZN(
        SBox_inst_XOR_A1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_A1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_A1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_a1[2]) );
  INV_X1 SBox_inst_XOR_A1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_A1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_a1[3]) );
  NAND2_X1 SBox_inst_AND_B0_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_B0_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_B0_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_B0_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_B0_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_B0_nonlinear_layer0_a0nandb0), .B(r_SR[9]), .ZN(
        SBox_inst_inv_b[0]) );
  XOR2_X1 SBox_inst_AND_B0_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_B0_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[9]), 
        .Z(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 SBox_inst_AND_B0_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_B0_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[9]), 
        .Z(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 SBox_inst_AND_B0_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_B0_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_) );
  INV_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( 
        .A(r_SR[9]), .ZN(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_) );
  INV_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( 
        .A(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( 
        .A(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_) );
  INV_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( 
        .A(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_) );
  NOR2_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]) );
  NOR2_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[9]), .ZN(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]) );
  NOR2_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]) );
  NOR2_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]) );
  NOR2_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]) );
  DFF_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]), .CK(clk), .Q(SBox_inst_AND_B0_t_DR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]), .CK(clk), .Q(SBox_inst_AND_B0_t_DR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]), .CK(clk), .Q(SBox_inst_AND_B0_t_DR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]), .CK(clk), .Q(SBox_inst_AND_B0_t_DR0[3]), .QN() );
  DFF_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]), .CK(clk), .Q(SBox_inst_AND_B0_t_DR0[4]), .QN() );
  DFF_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]), .CK(clk), .Q(SBox_inst_AND_B0_t_DR0[5]), .QN() );
  DFF_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]), .CK(clk), .Q(SBox_inst_AND_B0_t_DR0[6]), .QN() );
  DFF_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]), .CK(clk), .Q(SBox_inst_AND_B0_t_DR0[7]), .QN() );
  NOR2_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]) );
  NOR2_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[9]), .ZN(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]) );
  NOR2_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]) );
  NOR2_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]) );
  NOR2_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]) );
  DFF_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]), .CK(clk), .Q(SBox_inst_AND_B0_t_DR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]), .CK(clk), .Q(SBox_inst_AND_B0_t_DR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]), .CK(clk), .Q(SBox_inst_AND_B0_t_DR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]), .CK(clk), .Q(SBox_inst_AND_B0_t_DR1[3]), .QN() );
  DFF_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]), .CK(clk), .Q(SBox_inst_AND_B0_t_DR1[4]), .QN() );
  DFF_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]), .CK(clk), .Q(SBox_inst_AND_B0_t_DR1[5]), .QN() );
  DFF_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]), .CK(clk), .Q(SBox_inst_AND_B0_t_DR1[6]), .QN() );
  DFF_X1 SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_B0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]), .CK(clk), .Q(SBox_inst_AND_B0_t_DR1[7]), .QN() );
  NAND3_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_m0[44]), .A2(SBox_inst_m0[40]), .A3(
        SBox_inst_AND_B0_t_DR0[3]), .ZN(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_m0[45]), .A2(SBox_inst_m0[40]), .A3(
        SBox_inst_AND_B0_t_DR0[2]), .ZN(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_m0[44]), .A2(SBox_inst_m0[41]), .A3(
        SBox_inst_AND_B0_t_DR0[1]), .ZN(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_m0[45]), .A2(SBox_inst_m0[41]), .A3(
        SBox_inst_AND_B0_t_DR0[0]), .ZN(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_b0[0]) );
  NAND3_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_m0[44]), .A2(SBox_inst_m0[40]), .A3(
        SBox_inst_AND_B0_t_DR0[7]), .ZN(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_m0[45]), .A2(SBox_inst_m0[40]), .A3(
        SBox_inst_AND_B0_t_DR0[6]), .ZN(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_m0[44]), .A2(SBox_inst_m0[41]), .A3(
        SBox_inst_AND_B0_t_DR0[5]), .ZN(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_m0[45]), .A2(SBox_inst_m0[41]), .A3(
        SBox_inst_AND_B0_t_DR0[4]), .ZN(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_b0[1]) );
  NAND3_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_m1[44]), .A2(SBox_inst_m1[40]), .A3(
        SBox_inst_AND_B0_t_DR1[3]), .ZN(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_m1[45]), .A2(SBox_inst_m1[40]), .A3(
        SBox_inst_AND_B0_t_DR1[2]), .ZN(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_m1[44]), .A2(SBox_inst_m1[41]), .A3(
        SBox_inst_AND_B0_t_DR1[1]), .ZN(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_m1[45]), .A2(SBox_inst_m1[41]), .A3(
        SBox_inst_AND_B0_t_DR1[0]), .ZN(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_b1[0]) );
  NAND3_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_m1[44]), .A2(SBox_inst_m1[40]), .A3(
        SBox_inst_AND_B0_t_DR1[7]), .ZN(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_m1[45]), .A2(SBox_inst_m1[40]), .A3(
        SBox_inst_AND_B0_t_DR1[6]), .ZN(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_m1[44]), .A2(SBox_inst_m1[41]), .A3(
        SBox_inst_AND_B0_t_DR1[5]), .ZN(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_m1[45]), .A2(SBox_inst_m1[41]), .A3(
        SBox_inst_AND_B0_t_DR1[4]), .ZN(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_B0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_b1[1]) );
  NAND2_X1 SBox_inst_AND_B1_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_E1_nonlinear_precomp_a_delayed_0__0_), .A2(
        SBox_inst_AND_E0_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_B1_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_B1_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_B1_nonlinear_layer0_a0nandb0), .B(r_SR[10]), .ZN(
        SBox_inst_inv_b[1]) );
  XOR2_X1 SBox_inst_AND_B1_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_E0_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[10]), 
        .Z(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 SBox_inst_AND_B1_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_E1_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[10]), 
        .Z(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 SBox_inst_AND_B1_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_E1_nonlinear_precomp_a_delayed_0__0_), .B(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_) );
  INV_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( 
        .A(r_SR[10]), .ZN(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_) );
  INV_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( 
        .A(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_) );
  INV_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( 
        .A(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( 
        .A(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_) );
  NOR2_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]) );
  NOR2_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[10]), .ZN(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]) );
  NOR2_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]) );
  NOR2_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]) );
  NOR2_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]) );
  DFF_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]), .CK(clk), .Q(SBox_inst_AND_B1_t_DR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]), .CK(clk), .Q(SBox_inst_AND_B1_t_DR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]), .CK(clk), .Q(SBox_inst_AND_B1_t_DR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]), .CK(clk), .Q(SBox_inst_AND_B1_t_DR0[3]), .QN() );
  DFF_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]), .CK(clk), .Q(SBox_inst_AND_B1_t_DR0[4]), .QN() );
  DFF_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]), .CK(clk), .Q(SBox_inst_AND_B1_t_DR0[5]), .QN() );
  DFF_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]), .CK(clk), .Q(SBox_inst_AND_B1_t_DR0[6]), .QN() );
  DFF_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]), .CK(clk), .Q(SBox_inst_AND_B1_t_DR0[7]), .QN() );
  NOR2_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]) );
  NOR2_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[10]), .ZN(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]) );
  NOR2_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]) );
  NOR2_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]) );
  NOR2_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]) );
  DFF_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]), .CK(clk), .Q(SBox_inst_AND_B1_t_DR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]), .CK(clk), .Q(SBox_inst_AND_B1_t_DR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]), .CK(clk), .Q(SBox_inst_AND_B1_t_DR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]), .CK(clk), .Q(SBox_inst_AND_B1_t_DR1[3]), .QN() );
  DFF_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]), .CK(clk), .Q(SBox_inst_AND_B1_t_DR1[4]), .QN() );
  DFF_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]), .CK(clk), .Q(SBox_inst_AND_B1_t_DR1[5]), .QN() );
  DFF_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]), .CK(clk), .Q(SBox_inst_AND_B1_t_DR1[6]), .QN() );
  DFF_X1 SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_B1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]), .CK(clk), .Q(SBox_inst_AND_B1_t_DR1[7]), .QN() );
  NAND3_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_m0[42]), .A2(SBox_inst_m0[38]), .A3(
        SBox_inst_AND_B1_t_DR0[3]), .ZN(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_m0[43]), .A2(SBox_inst_m0[38]), .A3(
        SBox_inst_AND_B1_t_DR0[2]), .ZN(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_m0[42]), .A2(SBox_inst_m0[39]), .A3(
        SBox_inst_AND_B1_t_DR0[1]), .ZN(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_m0[43]), .A2(SBox_inst_m0[39]), .A3(
        SBox_inst_AND_B1_t_DR0[0]), .ZN(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_b0[2]) );
  NAND3_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_m0[42]), .A2(SBox_inst_m0[38]), .A3(
        SBox_inst_AND_B1_t_DR0[7]), .ZN(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_m0[43]), .A2(SBox_inst_m0[38]), .A3(
        SBox_inst_AND_B1_t_DR0[6]), .ZN(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_m0[42]), .A2(SBox_inst_m0[39]), .A3(
        SBox_inst_AND_B1_t_DR0[5]), .ZN(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_m0[43]), .A2(SBox_inst_m0[39]), .A3(
        SBox_inst_AND_B1_t_DR0[4]), .ZN(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_b0[3]) );
  NAND3_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_m1[42]), .A2(SBox_inst_m1[38]), .A3(
        SBox_inst_AND_B1_t_DR1[3]), .ZN(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_m1[43]), .A2(SBox_inst_m1[38]), .A3(
        SBox_inst_AND_B1_t_DR1[2]), .ZN(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_m1[42]), .A2(SBox_inst_m1[39]), .A3(
        SBox_inst_AND_B1_t_DR1[1]), .ZN(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_m1[43]), .A2(SBox_inst_m1[39]), .A3(
        SBox_inst_AND_B1_t_DR1[0]), .ZN(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_b1[2]) );
  NAND3_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_m1[42]), .A2(SBox_inst_m1[38]), .A3(
        SBox_inst_AND_B1_t_DR1[7]), .ZN(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_m1[43]), .A2(SBox_inst_m1[38]), .A3(
        SBox_inst_AND_B1_t_DR1[6]), .ZN(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_m1[42]), .A2(SBox_inst_m1[39]), .A3(
        SBox_inst_AND_B1_t_DR1[5]), .ZN(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_m1[43]), .A2(SBox_inst_m1[39]), .A3(
        SBox_inst_AND_B1_t_DR1[4]), .ZN(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_B1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_b1[3]) );
  XOR2_X1 SBox_inst_XOR_C0_layer0_xor_U1 ( .A(
        SBox_inst_AND_F1_nonlinear_precomp_a_delayed_0__0_), .B(
        SBox_inst_inv_b[0]), .Z(
        SBox_inst_AND_E0_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_C0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_inv_a0[0]), .A2(SBox_inst_inv_b0[1]), .B1(
        SBox_inst_inv_a0[1]), .B2(SBox_inst_inv_b0[0]), .ZN(
        SBox_inst_XOR_C0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_C0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_inv_a0[0]), .A2(SBox_inst_inv_b0[0]), .B1(
        SBox_inst_inv_a0[1]), .B2(SBox_inst_inv_b0[1]), .ZN(
        SBox_inst_XOR_C0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_C0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_C0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_c0[0]) );
  INV_X1 SBox_inst_XOR_C0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_C0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_c0[1]) );
  AOI22_X1 SBox_inst_XOR_C0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_inv_a1[0]), .A2(SBox_inst_inv_b1[1]), .B1(
        SBox_inst_inv_a1[1]), .B2(SBox_inst_inv_b1[0]), .ZN(
        SBox_inst_XOR_C0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_C0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_inv_a1[0]), .A2(SBox_inst_inv_b1[0]), .B1(
        SBox_inst_inv_a1[1]), .B2(SBox_inst_inv_b1[1]), .ZN(
        SBox_inst_XOR_C0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_C0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_C0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_c1[0]) );
  INV_X1 SBox_inst_XOR_C0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_C0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_c1[1]) );
  XOR2_X1 SBox_inst_XOR_C1_layer0_xor_U1 ( .A(
        SBox_inst_AND_F0_nonlinear_precomp_a_delayed_0__0_), .B(
        SBox_inst_inv_b[0]), .Z(
        SBox_inst_AND_E1_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_C1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_inv_a0[2]), .A2(SBox_inst_inv_b0[1]), .B1(
        SBox_inst_inv_a0[3]), .B2(SBox_inst_inv_b0[0]), .ZN(
        SBox_inst_XOR_C1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_C1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_inv_a0[2]), .A2(SBox_inst_inv_b0[0]), .B1(
        SBox_inst_inv_a0[3]), .B2(SBox_inst_inv_b0[1]), .ZN(
        SBox_inst_XOR_C1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_C1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_C1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_c0[2]) );
  INV_X1 SBox_inst_XOR_C1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_C1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_c0[3]) );
  AOI22_X1 SBox_inst_XOR_C1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_inv_a1[2]), .A2(SBox_inst_inv_b1[1]), .B1(
        SBox_inst_inv_a1[3]), .B2(SBox_inst_inv_b1[0]), .ZN(
        SBox_inst_XOR_C1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_C1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_inv_a1[2]), .A2(SBox_inst_inv_b1[0]), .B1(
        SBox_inst_inv_a1[3]), .B2(SBox_inst_inv_b1[1]), .ZN(
        SBox_inst_XOR_C1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_C1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_C1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_c1[2]) );
  INV_X1 SBox_inst_XOR_C1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_C1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_c1[3]) );
  XOR2_X1 SBox_inst_XOR_D0_layer0_xor_U1 ( .A(
        SBox_inst_AND_B0_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_inv_b[1]), .Z(
        SBox_inst_AND_F0_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_D0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[44]), .A2(SBox_inst_inv_b0[3]), .B1(SBox_inst_m0[45]), 
        .B2(SBox_inst_inv_b0[2]), .ZN(
        SBox_inst_XOR_D0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_D0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[44]), .A2(SBox_inst_inv_b0[2]), .B1(SBox_inst_m0[45]), 
        .B2(SBox_inst_inv_b0[3]), .ZN(
        SBox_inst_XOR_D0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_D0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_D0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_d0[0]) );
  INV_X1 SBox_inst_XOR_D0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_D0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_d0[1]) );
  AOI22_X1 SBox_inst_XOR_D0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[44]), .A2(SBox_inst_inv_b1[3]), .B1(SBox_inst_m1[45]), 
        .B2(SBox_inst_inv_b1[2]), .ZN(
        SBox_inst_XOR_D0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_D0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[44]), .A2(SBox_inst_inv_b1[2]), .B1(SBox_inst_m1[45]), 
        .B2(SBox_inst_inv_b1[3]), .ZN(
        SBox_inst_XOR_D0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_D0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_D0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_d1[0]) );
  INV_X1 SBox_inst_XOR_D0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_D0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_d1[1]) );
  XOR2_X1 SBox_inst_XOR_D1_layer0_xor_U1 ( .A(
        SBox_inst_AND_B0_nonlinear_precomp_a_delayed_0__0_), .B(
        SBox_inst_inv_b[1]), .Z(
        SBox_inst_AND_F1_nonlinear_precomp_b_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_D1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[40]), .A2(SBox_inst_inv_b0[3]), .B1(SBox_inst_m0[41]), 
        .B2(SBox_inst_inv_b0[2]), .ZN(
        SBox_inst_XOR_D1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_D1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[40]), .A2(SBox_inst_inv_b0[2]), .B1(SBox_inst_m0[41]), 
        .B2(SBox_inst_inv_b0[3]), .ZN(
        SBox_inst_XOR_D1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_D1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_D1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_d0[2]) );
  INV_X1 SBox_inst_XOR_D1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_D1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_d0[3]) );
  AOI22_X1 SBox_inst_XOR_D1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[40]), .A2(SBox_inst_inv_b1[3]), .B1(SBox_inst_m1[41]), 
        .B2(SBox_inst_inv_b1[2]), .ZN(
        SBox_inst_XOR_D1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_D1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[40]), .A2(SBox_inst_inv_b1[2]), .B1(SBox_inst_m1[41]), 
        .B2(SBox_inst_inv_b1[3]), .ZN(
        SBox_inst_XOR_D1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_D1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_D1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_d1[2]) );
  INV_X1 SBox_inst_XOR_D1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_D1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_d1[3]) );
  NAND2_X1 SBox_inst_AND_E0_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_E0_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_E0_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_E0_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_E0_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_E0_nonlinear_layer0_a0nandb0), .B(r_SR[11]), .ZN(
        SBox_inst_inv_e[0]) );
  XOR2_X1 SBox_inst_AND_E0_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_E0_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[11]), 
        .Z(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 SBox_inst_AND_E0_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_E0_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[11]), 
        .Z(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 SBox_inst_AND_E0_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_E0_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_) );
  INV_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( 
        .A(r_SR[11]), .ZN(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_) );
  INV_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( 
        .A(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( 
        .A(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_) );
  INV_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( 
        .A(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_) );
  NOR2_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]) );
  NOR2_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[11]), .ZN(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]) );
  NOR2_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]) );
  NOR2_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]) );
  NOR2_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]) );
  DFF_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]), .CK(clk), .Q(SBox_inst_AND_E0_t_DR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]), .CK(clk), .Q(SBox_inst_AND_E0_t_DR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]), .CK(clk), .Q(SBox_inst_AND_E0_t_DR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]), .CK(clk), .Q(SBox_inst_AND_E0_t_DR0[3]), .QN() );
  DFF_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]), .CK(clk), .Q(SBox_inst_AND_E0_t_DR0[4]), .QN() );
  DFF_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]), .CK(clk), .Q(SBox_inst_AND_E0_t_DR0[5]), .QN() );
  DFF_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]), .CK(clk), .Q(SBox_inst_AND_E0_t_DR0[6]), .QN() );
  DFF_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]), .CK(clk), .Q(SBox_inst_AND_E0_t_DR0[7]), .QN() );
  NOR2_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]) );
  NOR2_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[11]), .ZN(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]) );
  NOR2_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]) );
  NOR2_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]) );
  NOR2_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]) );
  DFF_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]), .CK(clk), .Q(SBox_inst_AND_E0_t_DR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]), .CK(clk), .Q(SBox_inst_AND_E0_t_DR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]), .CK(clk), .Q(SBox_inst_AND_E0_t_DR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]), .CK(clk), .Q(SBox_inst_AND_E0_t_DR1[3]), .QN() );
  DFF_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]), .CK(clk), .Q(SBox_inst_AND_E0_t_DR1[4]), .QN() );
  DFF_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]), .CK(clk), .Q(SBox_inst_AND_E0_t_DR1[5]), .QN() );
  DFF_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]), .CK(clk), .Q(SBox_inst_AND_E0_t_DR1[6]), .QN() );
  DFF_X1 SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_E0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]), .CK(clk), .Q(SBox_inst_AND_E0_t_DR1[7]), .QN() );
  NAND3_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_inv_c0[0]), .A2(SBox_inst_m0[38]), .A3(
        SBox_inst_AND_E0_t_DR0[3]), .ZN(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_inv_c0[1]), .A2(SBox_inst_m0[38]), .A3(
        SBox_inst_AND_E0_t_DR0[2]), .ZN(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_inv_c0[0]), .A2(SBox_inst_m0[39]), .A3(
        SBox_inst_AND_E0_t_DR0[1]), .ZN(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_inv_c0[1]), .A2(SBox_inst_m0[39]), .A3(
        SBox_inst_AND_E0_t_DR0[0]), .ZN(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_e0[0]) );
  NAND3_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_inv_c0[0]), .A2(SBox_inst_m0[38]), .A3(
        SBox_inst_AND_E0_t_DR0[7]), .ZN(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_inv_c0[1]), .A2(SBox_inst_m0[38]), .A3(
        SBox_inst_AND_E0_t_DR0[6]), .ZN(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_inv_c0[0]), .A2(SBox_inst_m0[39]), .A3(
        SBox_inst_AND_E0_t_DR0[5]), .ZN(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_inv_c0[1]), .A2(SBox_inst_m0[39]), .A3(
        SBox_inst_AND_E0_t_DR0[4]), .ZN(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_e0[1]) );
  NAND3_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_inv_c1[0]), .A2(SBox_inst_m1[38]), .A3(
        SBox_inst_AND_E0_t_DR1[3]), .ZN(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_inv_c1[1]), .A2(SBox_inst_m1[38]), .A3(
        SBox_inst_AND_E0_t_DR1[2]), .ZN(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_inv_c1[0]), .A2(SBox_inst_m1[39]), .A3(
        SBox_inst_AND_E0_t_DR1[1]), .ZN(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_inv_c1[1]), .A2(SBox_inst_m1[39]), .A3(
        SBox_inst_AND_E0_t_DR1[0]), .ZN(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_e1[0]) );
  NAND3_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_inv_c1[0]), .A2(SBox_inst_m1[38]), .A3(
        SBox_inst_AND_E0_t_DR1[7]), .ZN(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_inv_c1[1]), .A2(SBox_inst_m1[38]), .A3(
        SBox_inst_AND_E0_t_DR1[6]), .ZN(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_inv_c1[0]), .A2(SBox_inst_m1[39]), .A3(
        SBox_inst_AND_E0_t_DR1[5]), .ZN(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_inv_c1[1]), .A2(SBox_inst_m1[39]), .A3(
        SBox_inst_AND_E0_t_DR1[4]), .ZN(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_E0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_e1[1]) );
  NAND2_X1 SBox_inst_AND_E1_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_E1_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_E1_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_E1_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_E1_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_E1_nonlinear_layer0_a0nandb0), .B(r_SR[12]), .ZN(
        SBox_inst_inv_e[1]) );
  XOR2_X1 SBox_inst_AND_E1_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_E1_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[12]), 
        .Z(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 SBox_inst_AND_E1_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_E1_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[12]), 
        .Z(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 SBox_inst_AND_E1_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_E1_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_) );
  INV_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( 
        .A(r_SR[12]), .ZN(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_) );
  INV_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( 
        .A(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( 
        .A(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_) );
  INV_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( 
        .A(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_) );
  NOR2_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]) );
  NOR2_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[12]), .ZN(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]) );
  NOR2_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]) );
  NOR2_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]) );
  NOR2_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]) );
  DFF_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]), .CK(clk), .Q(SBox_inst_AND_E1_t_DR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]), .CK(clk), .Q(SBox_inst_AND_E1_t_DR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]), .CK(clk), .Q(SBox_inst_AND_E1_t_DR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]), .CK(clk), .Q(SBox_inst_AND_E1_t_DR0[3]), .QN() );
  DFF_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]), .CK(clk), .Q(SBox_inst_AND_E1_t_DR0[4]), .QN() );
  DFF_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]), .CK(clk), .Q(SBox_inst_AND_E1_t_DR0[5]), .QN() );
  DFF_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]), .CK(clk), .Q(SBox_inst_AND_E1_t_DR0[6]), .QN() );
  DFF_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]), .CK(clk), .Q(SBox_inst_AND_E1_t_DR0[7]), .QN() );
  NOR2_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]) );
  NOR2_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[12]), .ZN(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]) );
  NOR2_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]) );
  NOR2_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]) );
  NOR2_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]) );
  DFF_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]), .CK(clk), .Q(SBox_inst_AND_E1_t_DR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]), .CK(clk), .Q(SBox_inst_AND_E1_t_DR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]), .CK(clk), .Q(SBox_inst_AND_E1_t_DR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]), .CK(clk), .Q(SBox_inst_AND_E1_t_DR1[3]), .QN() );
  DFF_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]), .CK(clk), .Q(SBox_inst_AND_E1_t_DR1[4]), .QN() );
  DFF_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]), .CK(clk), .Q(SBox_inst_AND_E1_t_DR1[5]), .QN() );
  DFF_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]), .CK(clk), .Q(SBox_inst_AND_E1_t_DR1[6]), .QN() );
  DFF_X1 SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_E1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]), .CK(clk), .Q(SBox_inst_AND_E1_t_DR1[7]), .QN() );
  NAND3_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_inv_c0[2]), .A2(SBox_inst_m0[42]), .A3(
        SBox_inst_AND_E1_t_DR0[3]), .ZN(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_inv_c0[3]), .A2(SBox_inst_m0[42]), .A3(
        SBox_inst_AND_E1_t_DR0[2]), .ZN(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_inv_c0[2]), .A2(SBox_inst_m0[43]), .A3(
        SBox_inst_AND_E1_t_DR0[1]), .ZN(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_inv_c0[3]), .A2(SBox_inst_m0[43]), .A3(
        SBox_inst_AND_E1_t_DR0[0]), .ZN(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_e0[2]) );
  NAND3_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_inv_c0[2]), .A2(SBox_inst_m0[42]), .A3(
        SBox_inst_AND_E1_t_DR0[7]), .ZN(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_inv_c0[3]), .A2(SBox_inst_m0[42]), .A3(
        SBox_inst_AND_E1_t_DR0[6]), .ZN(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_inv_c0[2]), .A2(SBox_inst_m0[43]), .A3(
        SBox_inst_AND_E1_t_DR0[5]), .ZN(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_inv_c0[3]), .A2(SBox_inst_m0[43]), .A3(
        SBox_inst_AND_E1_t_DR0[4]), .ZN(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_e0[3]) );
  NAND3_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_inv_c1[2]), .A2(SBox_inst_m1[42]), .A3(
        SBox_inst_AND_E1_t_DR1[3]), .ZN(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_inv_c1[3]), .A2(SBox_inst_m1[42]), .A3(
        SBox_inst_AND_E1_t_DR1[2]), .ZN(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_inv_c1[2]), .A2(SBox_inst_m1[43]), .A3(
        SBox_inst_AND_E1_t_DR1[1]), .ZN(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_inv_c1[3]), .A2(SBox_inst_m1[43]), .A3(
        SBox_inst_AND_E1_t_DR1[0]), .ZN(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_e1[2]) );
  NAND3_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_inv_c1[2]), .A2(SBox_inst_m1[42]), .A3(
        SBox_inst_AND_E1_t_DR1[7]), .ZN(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_inv_c1[3]), .A2(SBox_inst_m1[42]), .A3(
        SBox_inst_AND_E1_t_DR1[6]), .ZN(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_inv_c1[2]), .A2(SBox_inst_m1[43]), .A3(
        SBox_inst_AND_E1_t_DR1[5]), .ZN(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_inv_c1[3]), .A2(SBox_inst_m1[43]), .A3(
        SBox_inst_AND_E1_t_DR1[4]), .ZN(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_E1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_e1[3]) );
  NAND2_X1 SBox_inst_AND_F0_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_F0_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_F0_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_F0_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_F0_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_F0_nonlinear_layer0_a0nandb0), .B(r_SR[13]), .ZN(
        SBox_inst_inv_f[0]) );
  XOR2_X1 SBox_inst_AND_F0_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_F0_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[13]), 
        .Z(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 SBox_inst_AND_F0_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_F0_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[13]), 
        .Z(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 SBox_inst_AND_F0_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_F0_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_) );
  INV_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( 
        .A(r_SR[13]), .ZN(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_) );
  INV_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( 
        .A(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( 
        .A(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_) );
  INV_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( 
        .A(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_) );
  NOR2_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]) );
  NOR2_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[13]), .ZN(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]) );
  NOR2_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]) );
  NOR2_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]) );
  NOR2_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]) );
  DFF_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]), .CK(clk), .Q(SBox_inst_AND_F0_t_DR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]), .CK(clk), .Q(SBox_inst_AND_F0_t_DR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]), .CK(clk), .Q(SBox_inst_AND_F0_t_DR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]), .CK(clk), .Q(SBox_inst_AND_F0_t_DR0[3]), .QN() );
  DFF_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]), .CK(clk), .Q(SBox_inst_AND_F0_t_DR0[4]), .QN() );
  DFF_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]), .CK(clk), .Q(SBox_inst_AND_F0_t_DR0[5]), .QN() );
  DFF_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]), .CK(clk), .Q(SBox_inst_AND_F0_t_DR0[6]), .QN() );
  DFF_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]), .CK(clk), .Q(SBox_inst_AND_F0_t_DR0[7]), .QN() );
  NOR2_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]) );
  NOR2_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[13]), .ZN(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]) );
  NOR2_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]) );
  NOR2_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]) );
  NOR2_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]) );
  DFF_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]), .CK(clk), .Q(SBox_inst_AND_F0_t_DR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]), .CK(clk), .Q(SBox_inst_AND_F0_t_DR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]), .CK(clk), .Q(SBox_inst_AND_F0_t_DR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]), .CK(clk), .Q(SBox_inst_AND_F0_t_DR1[3]), .QN() );
  DFF_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]), .CK(clk), .Q(SBox_inst_AND_F0_t_DR1[4]), .QN() );
  DFF_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]), .CK(clk), .Q(SBox_inst_AND_F0_t_DR1[5]), .QN() );
  DFF_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]), .CK(clk), .Q(SBox_inst_AND_F0_t_DR1[6]), .QN() );
  DFF_X1 SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_F0_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]), .CK(clk), .Q(SBox_inst_AND_F0_t_DR1[7]), .QN() );
  NAND3_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_inv_d0[0]), .A2(SBox_inst_inv_a0[2]), .A3(
        SBox_inst_AND_F0_t_DR0[3]), .ZN(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_inv_d0[1]), .A2(SBox_inst_inv_a0[2]), .A3(
        SBox_inst_AND_F0_t_DR0[2]), .ZN(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_inv_d0[0]), .A2(SBox_inst_inv_a0[3]), .A3(
        SBox_inst_AND_F0_t_DR0[1]), .ZN(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_inv_d0[1]), .A2(SBox_inst_inv_a0[3]), .A3(
        SBox_inst_AND_F0_t_DR0[0]), .ZN(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_f0[0]) );
  NAND3_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_inv_d0[0]), .A2(SBox_inst_inv_a0[2]), .A3(
        SBox_inst_AND_F0_t_DR0[7]), .ZN(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_inv_d0[1]), .A2(SBox_inst_inv_a0[2]), .A3(
        SBox_inst_AND_F0_t_DR0[6]), .ZN(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_inv_d0[0]), .A2(SBox_inst_inv_a0[3]), .A3(
        SBox_inst_AND_F0_t_DR0[5]), .ZN(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_inv_d0[1]), .A2(SBox_inst_inv_a0[3]), .A3(
        SBox_inst_AND_F0_t_DR0[4]), .ZN(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_f0[1]) );
  NAND3_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_inv_d1[0]), .A2(SBox_inst_inv_a1[2]), .A3(
        SBox_inst_AND_F0_t_DR1[3]), .ZN(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_inv_d1[1]), .A2(SBox_inst_inv_a1[2]), .A3(
        SBox_inst_AND_F0_t_DR1[2]), .ZN(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_inv_d1[0]), .A2(SBox_inst_inv_a1[3]), .A3(
        SBox_inst_AND_F0_t_DR1[1]), .ZN(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_inv_d1[1]), .A2(SBox_inst_inv_a1[3]), .A3(
        SBox_inst_AND_F0_t_DR1[0]), .ZN(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_f1[0]) );
  NAND3_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_inv_d1[0]), .A2(SBox_inst_inv_a1[2]), .A3(
        SBox_inst_AND_F0_t_DR1[7]), .ZN(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_inv_d1[1]), .A2(SBox_inst_inv_a1[2]), .A3(
        SBox_inst_AND_F0_t_DR1[6]), .ZN(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_inv_d1[0]), .A2(SBox_inst_inv_a1[3]), .A3(
        SBox_inst_AND_F0_t_DR1[5]), .ZN(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_inv_d1[1]), .A2(SBox_inst_inv_a1[3]), .A3(
        SBox_inst_AND_F0_t_DR1[4]), .ZN(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_F0_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_f1[1]) );
  NAND2_X1 SBox_inst_AND_F1_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_F1_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_F1_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_F1_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_F1_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_F1_nonlinear_layer0_a0nandb0), .B(r_SR[14]), .ZN(
        SBox_inst_inv_f[1]) );
  XOR2_X1 SBox_inst_AND_F1_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_F1_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[14]), 
        .Z(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_) );
  XOR2_X1 SBox_inst_AND_F1_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_F1_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[14]), 
        .Z(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_) );
  XNOR2_X1 SBox_inst_AND_F1_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_F1_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_) );
  INV_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U4 ( 
        .A(r_SR[14]), .ZN(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_) );
  INV_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U2 ( 
        .A(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_) );
  INV_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U3 ( 
        .A(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_) );
  INV_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_SRtDR_inst_U1 ( 
        .A(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_) );
  NOR2_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]) );
  NOR2_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[14]), .ZN(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]) );
  NOR2_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]) );
  NOR2_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]) );
  NOR2_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]) );
  DFF_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[0]), .CK(clk), .Q(SBox_inst_AND_F1_t_DR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[1]), .CK(clk), .Q(SBox_inst_AND_F1_t_DR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[2]), .CK(clk), .Q(SBox_inst_AND_F1_t_DR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[3]), .CK(clk), .Q(SBox_inst_AND_F1_t_DR0[3]), .QN() );
  DFF_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[4]), .CK(clk), .Q(SBox_inst_AND_F1_t_DR0[4]), .QN() );
  DFF_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[5]), .CK(clk), .Q(SBox_inst_AND_F1_t_DR0[5]), .QN() );
  DFF_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[6]), .CK(clk), .Q(SBox_inst_AND_F1_t_DR0[6]), .QN() );
  DFF_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst0_w[7]), .CK(clk), .Q(SBox_inst_AND_F1_t_DR0[7]), .QN() );
  NOR2_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_0_), .ZN(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_1_), .ZN(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_2_), .ZN(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_3_), .ZN(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]) );
  NOR2_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__4__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[14]), .ZN(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]) );
  NOR2_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__5__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_5_), .ZN(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]) );
  NOR2_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__6__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_6_), .ZN(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]) );
  NOR2_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_ctrl_inst_loop_gen_prch__7__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__t_DR_in_7_), .ZN(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]) );
  DFF_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_0_ ( 
        .D(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[0]), .CK(clk), .Q(SBox_inst_AND_F1_t_DR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_1_ ( 
        .D(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[1]), .CK(clk), .Q(SBox_inst_AND_F1_t_DR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_2_ ( 
        .D(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[2]), .CK(clk), .Q(SBox_inst_AND_F1_t_DR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_3_ ( 
        .D(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[3]), .CK(clk), .Q(SBox_inst_AND_F1_t_DR1[3]), .QN() );
  DFF_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_4_ ( 
        .D(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[4]), .CK(clk), .Q(SBox_inst_AND_F1_t_DR1[4]), .QN() );
  DFF_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_5_ ( 
        .D(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[5]), .CK(clk), .Q(SBox_inst_AND_F1_t_DR1[5]), .QN() );
  DFF_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_6_ ( 
        .D(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[6]), .CK(clk), .Q(SBox_inst_AND_F1_t_DR1[6]), .QN() );
  DFF_X1 SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_reg_inst_q_reg_7_ ( 
        .D(
        SBox_inst_AND_F1_gen_layer__1__gen_default__gen_default_prch__reg_t_inst1_w[7]), .CK(clk), .Q(SBox_inst_AND_F1_t_DR1[7]), .QN() );
  NAND3_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_inv_d0[2]), .A2(SBox_inst_inv_a0[0]), .A3(
        SBox_inst_AND_F1_t_DR0[3]), .ZN(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_inv_d0[3]), .A2(SBox_inst_inv_a0[0]), .A3(
        SBox_inst_AND_F1_t_DR0[2]), .ZN(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_inv_d0[2]), .A2(SBox_inst_inv_a0[1]), .A3(
        SBox_inst_AND_F1_t_DR0[1]), .ZN(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_inv_d0[3]), .A2(SBox_inst_inv_a0[1]), .A3(
        SBox_inst_AND_F1_t_DR0[0]), .ZN(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_f0[2]) );
  NAND3_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_inv_d0[2]), .A2(SBox_inst_inv_a0[0]), .A3(
        SBox_inst_AND_F1_t_DR0[7]), .ZN(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_inv_d0[3]), .A2(SBox_inst_inv_a0[0]), .A3(
        SBox_inst_AND_F1_t_DR0[6]), .ZN(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_inv_d0[2]), .A2(SBox_inst_inv_a0[1]), .A3(
        SBox_inst_AND_F1_t_DR0[5]), .ZN(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_inv_d0[3]), .A2(SBox_inst_inv_a0[1]), .A3(
        SBox_inst_AND_F1_t_DR0[4]), .ZN(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_f0[3]) );
  NAND3_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_inv_d1[2]), .A2(SBox_inst_inv_a1[0]), .A3(
        SBox_inst_AND_F1_t_DR1[3]), .ZN(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_inv_d1[3]), .A2(SBox_inst_inv_a1[0]), .A3(
        SBox_inst_AND_F1_t_DR1[2]), .ZN(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_inv_d1[2]), .A2(SBox_inst_inv_a1[1]), .A3(
        SBox_inst_AND_F1_t_DR1[1]), .ZN(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_inv_d1[3]), .A2(SBox_inst_inv_a1[1]), .A3(
        SBox_inst_AND_F1_t_DR1[0]), .ZN(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_t_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_f1[2]) );
  NAND3_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_inv_d1[2]), .A2(SBox_inst_inv_a1[0]), .A3(
        SBox_inst_AND_F1_t_DR1[7]), .ZN(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_inv_d1[3]), .A2(SBox_inst_inv_a1[0]), .A3(
        SBox_inst_AND_F1_t_DR1[6]), .ZN(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_inv_d1[2]), .A2(SBox_inst_inv_a1[1]), .A3(
        SBox_inst_AND_F1_t_DR1[5]), .ZN(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_inv_d1[3]), .A2(SBox_inst_inv_a1[1]), .A3(
        SBox_inst_AND_F1_t_DR1[4]), .ZN(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_F1_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_default__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_mux_inst_f_genblk2_mux_inst_w[3]), .ZN(SBox_inst_inv_f1[3]) );
  XOR2_X1 SBox_inst_XOR_L3_layer0_xor_U1 ( .A(
        SBox_inst_AND_F1_nonlinear_precomp_a_delayed_0__0_), .B(
        SBox_inst_inv_e[1]), .Z(
        SBox_inst_AND_M56_nonlinear_precomp_a_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_L3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_inv_a0[0]), .A2(SBox_inst_inv_e0[3]), .B1(
        SBox_inst_inv_a0[1]), .B2(SBox_inst_inv_e0[2]), .ZN(
        SBox_inst_XOR_L3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_L3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_inv_a0[0]), .A2(SBox_inst_inv_e0[2]), .B1(
        SBox_inst_inv_a0[1]), .B2(SBox_inst_inv_e0[3]), .ZN(
        SBox_inst_XOR_L3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_L3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_L3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_l0[6]) );
  INV_X1 SBox_inst_XOR_L3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_L3_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_l0[7]) );
  AOI22_X1 SBox_inst_XOR_L3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_inv_a1[0]), .A2(SBox_inst_inv_e1[3]), .B1(
        SBox_inst_inv_a1[1]), .B2(SBox_inst_inv_e1[2]), .ZN(
        SBox_inst_XOR_L3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_L3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_inv_a1[0]), .A2(SBox_inst_inv_e1[2]), .B1(
        SBox_inst_inv_a1[1]), .B2(SBox_inst_inv_e1[3]), .ZN(
        SBox_inst_XOR_L3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_L3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_L3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_l1[6]) );
  INV_X1 SBox_inst_XOR_L3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_L3_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_l1[7]) );
  XOR2_X1 SBox_inst_XOR_L2_layer0_xor_U1 ( .A(
        SBox_inst_AND_B0_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_inv_f[1]), .Z(
        SBox_inst_AND_M57_nonlinear_precomp_a_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_L2_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[44]), .A2(SBox_inst_inv_f0[3]), .B1(SBox_inst_m0[45]), 
        .B2(SBox_inst_inv_f0[2]), .ZN(
        SBox_inst_XOR_L2_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_L2_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[44]), .A2(SBox_inst_inv_f0[2]), .B1(SBox_inst_m0[45]), 
        .B2(SBox_inst_inv_f0[3]), .ZN(
        SBox_inst_XOR_L2_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_L2_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_L2_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_l0[4]) );
  INV_X1 SBox_inst_XOR_L2_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_L2_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_l0[5]) );
  AOI22_X1 SBox_inst_XOR_L2_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[44]), .A2(SBox_inst_inv_f1[3]), .B1(SBox_inst_m1[45]), 
        .B2(SBox_inst_inv_f1[2]), .ZN(
        SBox_inst_XOR_L2_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_L2_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[44]), .A2(SBox_inst_inv_f1[2]), .B1(SBox_inst_m1[45]), 
        .B2(SBox_inst_inv_f1[3]), .ZN(
        SBox_inst_XOR_L2_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_L2_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_L2_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_l1[4]) );
  INV_X1 SBox_inst_XOR_L2_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_L2_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_l1[5]) );
  XOR2_X1 SBox_inst_XOR_L1_layer0_xor_U1 ( .A(
        SBox_inst_AND_F0_nonlinear_precomp_a_delayed_0__0_), .B(
        SBox_inst_inv_e[0]), .Z(
        SBox_inst_AND_M59_nonlinear_precomp_a_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_L1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_inv_a0[2]), .A2(SBox_inst_inv_e0[1]), .B1(
        SBox_inst_inv_a0[3]), .B2(SBox_inst_inv_e0[0]), .ZN(
        SBox_inst_XOR_L1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_L1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_inv_a0[2]), .A2(SBox_inst_inv_e0[0]), .B1(
        SBox_inst_inv_a0[3]), .B2(SBox_inst_inv_e0[1]), .ZN(
        SBox_inst_XOR_L1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_L1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_L1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_l0[2]) );
  INV_X1 SBox_inst_XOR_L1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_L1_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_l0[3]) );
  AOI22_X1 SBox_inst_XOR_L1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_inv_a1[2]), .A2(SBox_inst_inv_e1[1]), .B1(
        SBox_inst_inv_a1[3]), .B2(SBox_inst_inv_e1[0]), .ZN(
        SBox_inst_XOR_L1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_L1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_inv_a1[2]), .A2(SBox_inst_inv_e1[0]), .B1(
        SBox_inst_inv_a1[3]), .B2(SBox_inst_inv_e1[1]), .ZN(
        SBox_inst_XOR_L1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_L1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_L1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_l1[2]) );
  INV_X1 SBox_inst_XOR_L1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_L1_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_l1[3]) );
  XOR2_X1 SBox_inst_XOR_L0_layer0_xor_U1 ( .A(
        SBox_inst_AND_B0_nonlinear_precomp_a_delayed_0__0_), .B(
        SBox_inst_inv_f[0]), .Z(
        SBox_inst_AND_M60_nonlinear_precomp_a_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_L0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m0[40]), .A2(SBox_inst_inv_f0[1]), .B1(SBox_inst_m0[41]), 
        .B2(SBox_inst_inv_f0[0]), .ZN(
        SBox_inst_XOR_L0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_L0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m0[40]), .A2(SBox_inst_inv_f0[0]), .B1(SBox_inst_m0[41]), 
        .B2(SBox_inst_inv_f0[1]), .ZN(
        SBox_inst_XOR_L0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_L0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_L0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_l0[0]) );
  INV_X1 SBox_inst_XOR_L0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_L0_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_l0[1]) );
  AOI22_X1 SBox_inst_XOR_L0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m1[40]), .A2(SBox_inst_inv_f1[1]), .B1(SBox_inst_m1[41]), 
        .B2(SBox_inst_inv_f1[0]), .ZN(
        SBox_inst_XOR_L0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_L0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m1[40]), .A2(SBox_inst_inv_f1[0]), .B1(SBox_inst_m1[41]), 
        .B2(SBox_inst_inv_f1[1]), .ZN(
        SBox_inst_XOR_L0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_L0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_L0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_inv_l1[0]) );
  INV_X1 SBox_inst_XOR_L0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_L0_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_inv_l1[1]) );
  XOR2_X1 SBox_inst_XOR_M41_layer0_xor_U1 ( .A(
        SBox_inst_AND_M59_nonlinear_precomp_a_delayed_0__0_), .B(
        SBox_inst_AND_M56_nonlinear_precomp_a_delayed_0__0_), .Z(
        SBox_inst_AND_M63_nonlinear_precomp_a_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_M41_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_inv_l0[2]), .A2(SBox_inst_inv_l0[7]), .B1(
        SBox_inst_inv_l0[3]), .B2(SBox_inst_inv_l0[6]), .ZN(
        SBox_inst_XOR_M41_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M41_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_inv_l0[2]), .A2(SBox_inst_inv_l0[6]), .B1(
        SBox_inst_inv_l0[3]), .B2(SBox_inst_inv_l0[7]), .ZN(
        SBox_inst_XOR_M41_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M41_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M41_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m_post0_41__1_) );
  INV_X1 SBox_inst_XOR_M41_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M41_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m_post0_41__2_) );
  AOI22_X1 SBox_inst_XOR_M41_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_inv_l1[2]), .A2(SBox_inst_inv_l1[7]), .B1(
        SBox_inst_inv_l1[3]), .B2(SBox_inst_inv_l1[6]), .ZN(
        SBox_inst_XOR_M41_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M41_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_inv_l1[2]), .A2(SBox_inst_inv_l1[6]), .B1(
        SBox_inst_inv_l1[3]), .B2(SBox_inst_inv_l1[7]), .ZN(
        SBox_inst_XOR_M41_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M41_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M41_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m_post1_41__1_) );
  INV_X1 SBox_inst_XOR_M41_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M41_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m_post1_41__2_) );
  XOR2_X1 SBox_inst_XOR_M42_layer0_xor_U1 ( .A(
        SBox_inst_AND_M60_nonlinear_precomp_a_delayed_0__0_), .B(
        SBox_inst_AND_M57_nonlinear_precomp_a_delayed_0__0_), .Z(
        SBox_inst_AND_M61_nonlinear_precomp_a_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_M42_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_inv_l0[0]), .A2(SBox_inst_inv_l0[5]), .B1(
        SBox_inst_inv_l0[1]), .B2(SBox_inst_inv_l0[4]), .ZN(
        SBox_inst_XOR_M42_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M42_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_inv_l0[0]), .A2(SBox_inst_inv_l0[4]), .B1(
        SBox_inst_inv_l0[1]), .B2(SBox_inst_inv_l0[5]), .ZN(
        SBox_inst_XOR_M42_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M42_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M42_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m_post0_42__1_) );
  INV_X1 SBox_inst_XOR_M42_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M42_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m_post0_42__2_) );
  AOI22_X1 SBox_inst_XOR_M42_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_inv_l1[0]), .A2(SBox_inst_inv_l1[5]), .B1(
        SBox_inst_inv_l1[1]), .B2(SBox_inst_inv_l1[4]), .ZN(
        SBox_inst_XOR_M42_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M42_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_inv_l1[0]), .A2(SBox_inst_inv_l1[4]), .B1(
        SBox_inst_inv_l1[1]), .B2(SBox_inst_inv_l1[5]), .ZN(
        SBox_inst_XOR_M42_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M42_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M42_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m_post1_42__1_) );
  INV_X1 SBox_inst_XOR_M42_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M42_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m_post1_42__2_) );
  XOR2_X1 SBox_inst_XOR_M43_layer0_xor_U1 ( .A(
        SBox_inst_AND_M60_nonlinear_precomp_a_delayed_0__0_), .B(
        SBox_inst_AND_M59_nonlinear_precomp_a_delayed_0__0_), .Z(
        SBox_inst_AND_M58_nonlinear_precomp_a_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_M43_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_inv_l0[0]), .A2(SBox_inst_inv_l0[3]), .B1(
        SBox_inst_inv_l0[1]), .B2(SBox_inst_inv_l0[2]), .ZN(
        SBox_inst_XOR_M43_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M43_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_inv_l0[0]), .A2(SBox_inst_inv_l0[2]), .B1(
        SBox_inst_inv_l0[1]), .B2(SBox_inst_inv_l0[3]), .ZN(
        SBox_inst_XOR_M43_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M43_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M43_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m_post0_43__1_) );
  INV_X1 SBox_inst_XOR_M43_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M43_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m_post0_43__2_) );
  AOI22_X1 SBox_inst_XOR_M43_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_inv_l1[0]), .A2(SBox_inst_inv_l1[3]), .B1(
        SBox_inst_inv_l1[1]), .B2(SBox_inst_inv_l1[2]), .ZN(
        SBox_inst_XOR_M43_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M43_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_inv_l1[0]), .A2(SBox_inst_inv_l1[2]), .B1(
        SBox_inst_inv_l1[1]), .B2(SBox_inst_inv_l1[3]), .ZN(
        SBox_inst_XOR_M43_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M43_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M43_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m_post1_43__1_) );
  INV_X1 SBox_inst_XOR_M43_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M43_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m_post1_43__2_) );
  XOR2_X1 SBox_inst_XOR_M44_layer0_xor_U1 ( .A(
        SBox_inst_AND_M57_nonlinear_precomp_a_delayed_0__0_), .B(
        SBox_inst_AND_M56_nonlinear_precomp_a_delayed_0__0_), .Z(
        SBox_inst_AND_M55_nonlinear_precomp_a_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_M44_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_inv_l0[4]), .A2(SBox_inst_inv_l0[7]), .B1(
        SBox_inst_inv_l0[5]), .B2(SBox_inst_inv_l0[6]), .ZN(
        SBox_inst_XOR_M44_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M44_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_inv_l0[4]), .A2(SBox_inst_inv_l0[6]), .B1(
        SBox_inst_inv_l0[5]), .B2(SBox_inst_inv_l0[7]), .ZN(
        SBox_inst_XOR_M44_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M44_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M44_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m_post0_44__1_) );
  INV_X1 SBox_inst_XOR_M44_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M44_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m_post0_44__2_) );
  AOI22_X1 SBox_inst_XOR_M44_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_inv_l1[4]), .A2(SBox_inst_inv_l1[7]), .B1(
        SBox_inst_inv_l1[5]), .B2(SBox_inst_inv_l1[6]), .ZN(
        SBox_inst_XOR_M44_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M44_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_inv_l1[4]), .A2(SBox_inst_inv_l1[6]), .B1(
        SBox_inst_inv_l1[5]), .B2(SBox_inst_inv_l1[7]), .ZN(
        SBox_inst_XOR_M44_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M44_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M44_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m_post1_44__1_) );
  INV_X1 SBox_inst_XOR_M44_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M44_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m_post1_44__2_) );
  XOR2_X1 SBox_inst_XOR_M45_layer0_xor_U1 ( .A(
        SBox_inst_AND_M61_nonlinear_precomp_a_delayed_0__0_), .B(
        SBox_inst_AND_M63_nonlinear_precomp_a_delayed_0__0_), .Z(
        SBox_inst_AND_M62_nonlinear_precomp_a_delayed_0__0_) );
  AOI22_X1 SBox_inst_XOR_M45_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m_post0_42__1_), .A2(SBox_inst_m_post0_41__2_), .B1(
        SBox_inst_m_post0_42__2_), .B2(SBox_inst_m_post0_41__1_), .ZN(
        SBox_inst_XOR_M45_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M45_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m_post0_42__1_), .A2(SBox_inst_m_post0_41__1_), .B1(
        SBox_inst_m_post0_42__2_), .B2(SBox_inst_m_post0_41__2_), .ZN(
        SBox_inst_XOR_M45_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M45_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M45_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m_post0_45__1_) );
  INV_X1 SBox_inst_XOR_M45_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M45_XOR_duality0_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m_post0_45__2_) );
  AOI22_X1 SBox_inst_XOR_M45_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst0_U1 ( 
        .A1(SBox_inst_m_post1_42__1_), .A2(SBox_inst_m_post1_41__2_), .B1(
        SBox_inst_m_post1_42__2_), .B2(SBox_inst_m_post1_41__1_), .ZN(
        SBox_inst_XOR_M45_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]) );
  AOI22_X1 SBox_inst_XOR_M45_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_aoi22_inst1_U1 ( 
        .A1(SBox_inst_m_post1_42__1_), .A2(SBox_inst_m_post1_41__1_), .B1(
        SBox_inst_m_post1_42__2_), .B2(SBox_inst_m_post1_41__2_), .ZN(
        SBox_inst_XOR_M45_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]) );
  INV_X1 SBox_inst_XOR_M45_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst0_U1 ( 
        .A(
        SBox_inst_XOR_M45_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[0]), .ZN(SBox_inst_m_post1_45__1_) );
  INV_X1 SBox_inst_XOR_M45_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_inv_inst1_U1 ( 
        .A(
        SBox_inst_XOR_M45_XOR_duality1_loop_gen_layer__0__xor_inst_genblk1_xor_inst_w[1]), .ZN(SBox_inst_m_post1_45__2_) );
  NAND2_X1 SBox_inst_AND_M46_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M46_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M55_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M46_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M46_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M46_nonlinear_layer0_a0nandb0), .B(r_SR[15]), .ZN(
        SBox_inst_m_merged[0]) );
  XOR2_X1 SBox_inst_AND_M46_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M55_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[15]), 
        .Z(SBox_inst_AND_M46_t_1_) );
  XOR2_X1 SBox_inst_AND_M46_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M46_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[15]), 
        .Z(SBox_inst_AND_M46_t_2_) );
  XNOR2_X1 SBox_inst_AND_M46_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M46_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M46_t_1_), .ZN(SBox_inst_AND_M46_t_3_) );
  NOR2_X1 SBox_inst_AND_M46_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[15]), .ZN(
        SBox_inst_AND_M46_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M46_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M46_t_1_), .ZN(
        SBox_inst_AND_M46_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M46_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M46_t_2_), .ZN(
        SBox_inst_AND_M46_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M46_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M46_t_3_), .ZN(
        SBox_inst_AND_M46_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M46_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M46_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M46_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M46_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M46_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M46_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M46_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M46_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M46_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M46_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M46_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M46_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M46_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[15]), .ZN(
        SBox_inst_AND_M46_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M46_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M46_t_1_), .ZN(
        SBox_inst_AND_M46_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M46_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M46_t_2_), .ZN(
        SBox_inst_AND_M46_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M46_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M46_t_3_), .ZN(
        SBox_inst_AND_M46_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M46_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M46_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M46_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M46_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M46_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M46_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M46_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M46_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M46_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M46_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M46_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M46_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[10]), .A2(SBox_inst_m_post0_44__1_), .A3(
        SBox_inst_AND_M46_t_SR0[3]), .ZN(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[11]), .A2(SBox_inst_m_post0_44__1_), .A3(
        SBox_inst_AND_M46_t_SR0[2]), .ZN(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[10]), .A2(SBox_inst_m_post0_44__2_), .A3(
        SBox_inst_AND_M46_t_SR0[1]), .ZN(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[11]), .A2(SBox_inst_m_post0_44__2_), .A3(
        SBox_inst_AND_M46_t_SR0[0]), .ZN(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[10]), .A2(SBox_inst_m_post1_44__1_), .A3(
        SBox_inst_AND_M46_t_SR1[3]), .ZN(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[11]), .A2(SBox_inst_m_post1_44__1_), .A3(
        SBox_inst_AND_M46_t_SR1[2]), .ZN(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[10]), .A2(SBox_inst_m_post1_44__2_), .A3(
        SBox_inst_AND_M46_t_SR1[1]), .ZN(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[11]), .A2(SBox_inst_m_post1_44__2_), .A3(
        SBox_inst_AND_M46_t_SR1[0]), .ZN(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M46_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[1]) );
  NAND2_X1 SBox_inst_AND_M47_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M47_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M56_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M47_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M47_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M47_nonlinear_layer0_a0nandb0), .B(r_SR[16]), .ZN(
        SBox_inst_m_merged[2]) );
  XOR2_X1 SBox_inst_AND_M47_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M56_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[16]), 
        .Z(SBox_inst_AND_M47_t_1_) );
  XOR2_X1 SBox_inst_AND_M47_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M47_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[16]), 
        .Z(SBox_inst_AND_M47_t_2_) );
  XNOR2_X1 SBox_inst_AND_M47_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M47_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M47_t_1_), .ZN(SBox_inst_AND_M47_t_3_) );
  NOR2_X1 SBox_inst_AND_M47_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[16]), .ZN(
        SBox_inst_AND_M47_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M47_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M47_t_1_), .ZN(
        SBox_inst_AND_M47_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M47_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M47_t_2_), .ZN(
        SBox_inst_AND_M47_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M47_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M47_t_3_), .ZN(
        SBox_inst_AND_M47_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M47_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M47_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M47_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M47_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M47_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M47_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M47_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M47_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M47_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M47_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M47_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M47_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M47_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[16]), .ZN(
        SBox_inst_AND_M47_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M47_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M47_t_1_), .ZN(
        SBox_inst_AND_M47_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M47_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M47_t_2_), .ZN(
        SBox_inst_AND_M47_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M47_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M47_t_3_), .ZN(
        SBox_inst_AND_M47_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M47_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M47_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M47_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M47_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M47_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M47_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M47_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M47_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M47_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M47_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M47_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M47_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[14]), .A2(SBox_inst_inv_l0[6]), .A3(
        SBox_inst_AND_M47_t_SR0[3]), .ZN(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[15]), .A2(SBox_inst_inv_l0[6]), .A3(
        SBox_inst_AND_M47_t_SR0[2]), .ZN(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[14]), .A2(SBox_inst_inv_l0[7]), .A3(
        SBox_inst_AND_M47_t_SR0[1]), .ZN(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[15]), .A2(SBox_inst_inv_l0[7]), .A3(
        SBox_inst_AND_M47_t_SR0[0]), .ZN(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[14]), .A2(SBox_inst_inv_l1[6]), .A3(
        SBox_inst_AND_M47_t_SR1[3]), .ZN(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[15]), .A2(SBox_inst_inv_l1[6]), .A3(
        SBox_inst_AND_M47_t_SR1[2]), .ZN(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[14]), .A2(SBox_inst_inv_l1[7]), .A3(
        SBox_inst_AND_M47_t_SR1[1]), .ZN(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[15]), .A2(SBox_inst_inv_l1[7]), .A3(
        SBox_inst_AND_M47_t_SR1[0]), .ZN(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M47_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[3]) );
  NAND2_X1 SBox_inst_AND_M48_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M48_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M57_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M48_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M48_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M48_nonlinear_layer0_a0nandb0), .B(r_SR[17]), .ZN(
        SBox_inst_m_merged[4]) );
  XOR2_X1 SBox_inst_AND_M48_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M57_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[17]), 
        .Z(SBox_inst_AND_M48_t_1_) );
  XOR2_X1 SBox_inst_AND_M48_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M48_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[17]), 
        .Z(SBox_inst_AND_M48_t_2_) );
  XNOR2_X1 SBox_inst_AND_M48_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M48_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M48_t_1_), .ZN(SBox_inst_AND_M48_t_3_) );
  NOR2_X1 SBox_inst_AND_M48_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[17]), .ZN(
        SBox_inst_AND_M48_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M48_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M48_t_1_), .ZN(
        SBox_inst_AND_M48_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M48_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M48_t_2_), .ZN(
        SBox_inst_AND_M48_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M48_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M48_t_3_), .ZN(
        SBox_inst_AND_M48_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M48_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M48_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M48_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M48_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M48_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M48_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M48_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M48_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M48_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M48_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M48_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M48_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M48_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[17]), .ZN(
        SBox_inst_AND_M48_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M48_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M48_t_1_), .ZN(
        SBox_inst_AND_M48_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M48_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M48_t_2_), .ZN(
        SBox_inst_AND_M48_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M48_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M48_t_3_), .ZN(
        SBox_inst_AND_M48_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M48_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M48_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M48_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M48_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M48_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M48_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M48_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M48_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M48_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M48_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M48_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M48_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_0__1_), .A2(SBox_inst_inv_l0[4]), .A3(
        SBox_inst_AND_M48_t_SR0[3]), .ZN(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_0__2_), .A2(SBox_inst_inv_l0[4]), .A3(
        SBox_inst_AND_M48_t_SR0[2]), .ZN(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_0__1_), .A2(SBox_inst_inv_l0[5]), .A3(
        SBox_inst_AND_M48_t_SR0[1]), .ZN(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_sboxInput0_reg_0__2_), .A2(SBox_inst_inv_l0[5]), .A3(
        SBox_inst_AND_M48_t_SR0[0]), .ZN(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_0__1_), .A2(SBox_inst_inv_l1[4]), .A3(
        SBox_inst_AND_M48_t_SR1[3]), .ZN(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_0__2_), .A2(SBox_inst_inv_l1[4]), .A3(
        SBox_inst_AND_M48_t_SR1[2]), .ZN(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_0__1_), .A2(SBox_inst_inv_l1[5]), .A3(
        SBox_inst_AND_M48_t_SR1[1]), .ZN(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_sboxInput1_reg_0__2_), .A2(SBox_inst_inv_l1[5]), .A3(
        SBox_inst_AND_M48_t_SR1[0]), .ZN(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M48_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[5]) );
  NAND2_X1 SBox_inst_AND_M49_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M49_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M58_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M49_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M49_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M49_nonlinear_layer0_a0nandb0), .B(r_SR[18]), .ZN(
        SBox_inst_m_merged[6]) );
  XOR2_X1 SBox_inst_AND_M49_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M58_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[18]), 
        .Z(SBox_inst_AND_M49_t_1_) );
  XOR2_X1 SBox_inst_AND_M49_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M49_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[18]), 
        .Z(SBox_inst_AND_M49_t_2_) );
  XNOR2_X1 SBox_inst_AND_M49_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M49_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M49_t_1_), .ZN(SBox_inst_AND_M49_t_3_) );
  NOR2_X1 SBox_inst_AND_M49_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[18]), .ZN(
        SBox_inst_AND_M49_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M49_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M49_t_1_), .ZN(
        SBox_inst_AND_M49_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M49_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M49_t_2_), .ZN(
        SBox_inst_AND_M49_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M49_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M49_t_3_), .ZN(
        SBox_inst_AND_M49_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M49_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M49_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M49_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M49_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M49_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M49_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M49_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M49_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M49_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M49_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M49_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M49_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M49_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[18]), .ZN(
        SBox_inst_AND_M49_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M49_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M49_t_1_), .ZN(
        SBox_inst_AND_M49_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M49_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M49_t_2_), .ZN(
        SBox_inst_AND_M49_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M49_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M49_t_3_), .ZN(
        SBox_inst_AND_M49_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M49_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M49_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M49_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M49_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M49_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M49_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M49_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M49_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M49_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M49_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M49_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M49_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[30]), .A2(SBox_inst_m_post0_43__1_), .A3(
        SBox_inst_AND_M49_t_SR0[3]), .ZN(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[31]), .A2(SBox_inst_m_post0_43__1_), .A3(
        SBox_inst_AND_M49_t_SR0[2]), .ZN(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[30]), .A2(SBox_inst_m_post0_43__2_), .A3(
        SBox_inst_AND_M49_t_SR0[1]), .ZN(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[31]), .A2(SBox_inst_m_post0_43__2_), .A3(
        SBox_inst_AND_M49_t_SR0[0]), .ZN(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[30]), .A2(SBox_inst_m_post1_43__1_), .A3(
        SBox_inst_AND_M49_t_SR1[3]), .ZN(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[31]), .A2(SBox_inst_m_post1_43__1_), .A3(
        SBox_inst_AND_M49_t_SR1[2]), .ZN(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[30]), .A2(SBox_inst_m_post1_43__2_), .A3(
        SBox_inst_AND_M49_t_SR1[1]), .ZN(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[31]), .A2(SBox_inst_m_post1_43__2_), .A3(
        SBox_inst_AND_M49_t_SR1[0]), .ZN(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M49_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[7]) );
  NAND2_X1 SBox_inst_AND_M50_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M50_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M59_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M50_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M50_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M50_nonlinear_layer0_a0nandb0), .B(r_SR[19]), .ZN(
        SBox_inst_m_merged[8]) );
  XOR2_X1 SBox_inst_AND_M50_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M59_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[19]), 
        .Z(SBox_inst_AND_M50_t_1_) );
  XOR2_X1 SBox_inst_AND_M50_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M50_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[19]), 
        .Z(SBox_inst_AND_M50_t_2_) );
  XNOR2_X1 SBox_inst_AND_M50_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M50_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M50_t_1_), .ZN(SBox_inst_AND_M50_t_3_) );
  NOR2_X1 SBox_inst_AND_M50_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(prch0_o[0]), .A2(r_SR[19]), .ZN(
        SBox_inst_AND_M50_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M50_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(prch0_o[0]), .A2(SBox_inst_AND_M50_t_1_), .ZN(
        SBox_inst_AND_M50_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M50_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(prch0_o[0]), .A2(SBox_inst_AND_M50_t_2_), .ZN(
        SBox_inst_AND_M50_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M50_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(prch0_o[0]), .A2(SBox_inst_AND_M50_t_3_), .ZN(
        SBox_inst_AND_M50_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M50_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M50_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M50_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M50_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M50_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M50_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M50_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M50_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M50_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M50_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M50_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M50_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M50_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[19]), .ZN(
        SBox_inst_AND_M50_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M50_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M50_t_1_), .ZN(
        SBox_inst_AND_M50_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M50_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M50_t_2_), .ZN(
        SBox_inst_AND_M50_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M50_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M50_t_3_), .ZN(
        SBox_inst_AND_M50_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M50_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M50_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M50_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M50_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M50_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M50_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M50_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M50_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M50_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M50_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M50_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M50_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[16]), .A2(SBox_inst_inv_l0[2]), .A3(
        SBox_inst_AND_M50_t_SR0[3]), .ZN(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[17]), .A2(SBox_inst_inv_l0[2]), .A3(
        SBox_inst_AND_M50_t_SR0[2]), .ZN(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[16]), .A2(SBox_inst_inv_l0[3]), .A3(
        SBox_inst_AND_M50_t_SR0[1]), .ZN(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[17]), .A2(SBox_inst_inv_l0[3]), .A3(
        SBox_inst_AND_M50_t_SR0[0]), .ZN(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[16]), .A2(SBox_inst_inv_l1[2]), .A3(
        SBox_inst_AND_M50_t_SR1[3]), .ZN(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[17]), .A2(SBox_inst_inv_l1[2]), .A3(
        SBox_inst_AND_M50_t_SR1[2]), .ZN(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[16]), .A2(SBox_inst_inv_l1[3]), .A3(
        SBox_inst_AND_M50_t_SR1[1]), .ZN(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[17]), .A2(SBox_inst_inv_l1[3]), .A3(
        SBox_inst_AND_M50_t_SR1[0]), .ZN(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M50_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[9]) );
  NAND2_X1 SBox_inst_AND_M51_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M51_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M60_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M51_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M51_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M51_nonlinear_layer0_a0nandb0), .B(r_SR[20]), .ZN(
        SBox_inst_m_merged[10]) );
  XOR2_X1 SBox_inst_AND_M51_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M60_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[20]), 
        .Z(SBox_inst_AND_M51_t_1_) );
  XOR2_X1 SBox_inst_AND_M51_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M51_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[20]), 
        .Z(SBox_inst_AND_M51_t_2_) );
  XNOR2_X1 SBox_inst_AND_M51_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M51_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M51_t_1_), .ZN(SBox_inst_AND_M51_t_3_) );
  NOR2_X1 SBox_inst_AND_M51_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[20]), .ZN(
        SBox_inst_AND_M51_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M51_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M51_t_1_), .ZN(
        SBox_inst_AND_M51_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M51_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M51_t_2_), .ZN(
        SBox_inst_AND_M51_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M51_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M51_t_3_), .ZN(
        SBox_inst_AND_M51_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M51_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M51_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M51_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M51_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M51_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M51_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M51_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M51_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M51_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M51_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M51_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M51_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M51_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(prch1_o[0]), .A2(r_SR[20]), .ZN(
        SBox_inst_AND_M51_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M51_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(prch1_o[0]), .A2(SBox_inst_AND_M51_t_1_), .ZN(
        SBox_inst_AND_M51_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M51_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(prch1_o[0]), .A2(SBox_inst_AND_M51_t_2_), .ZN(
        SBox_inst_AND_M51_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M51_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(prch1_o[0]), .A2(SBox_inst_AND_M51_t_3_), .ZN(
        SBox_inst_AND_M51_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M51_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M51_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M51_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M51_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M51_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M51_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M51_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M51_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M51_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M51_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M51_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M51_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[32]), .A2(SBox_inst_inv_l0[0]), .A3(
        SBox_inst_AND_M51_t_SR0[3]), .ZN(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[33]), .A2(SBox_inst_inv_l0[0]), .A3(
        SBox_inst_AND_M51_t_SR0[2]), .ZN(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[32]), .A2(SBox_inst_inv_l0[1]), .A3(
        SBox_inst_AND_M51_t_SR0[1]), .ZN(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[33]), .A2(SBox_inst_inv_l0[1]), .A3(
        SBox_inst_AND_M51_t_SR0[0]), .ZN(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[32]), .A2(SBox_inst_inv_l1[0]), .A3(
        SBox_inst_AND_M51_t_SR1[3]), .ZN(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[33]), .A2(SBox_inst_inv_l1[0]), .A3(
        SBox_inst_AND_M51_t_SR1[2]), .ZN(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[32]), .A2(SBox_inst_inv_l1[1]), .A3(
        SBox_inst_AND_M51_t_SR1[1]), .ZN(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[33]), .A2(SBox_inst_inv_l1[1]), .A3(
        SBox_inst_AND_M51_t_SR1[0]), .ZN(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M51_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[11]) );
  NAND2_X1 SBox_inst_AND_M52_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M52_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M61_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M52_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M52_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M52_nonlinear_layer0_a0nandb0), .B(r_SR[21]), .ZN(
        SBox_inst_m_merged[12]) );
  XOR2_X1 SBox_inst_AND_M52_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M61_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[21]), 
        .Z(SBox_inst_AND_M52_t_1_) );
  XOR2_X1 SBox_inst_AND_M52_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M52_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[21]), 
        .Z(SBox_inst_AND_M52_t_2_) );
  XNOR2_X1 SBox_inst_AND_M52_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M52_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M52_t_1_), .ZN(SBox_inst_AND_M52_t_3_) );
  NOR2_X1 SBox_inst_AND_M52_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[21]), .ZN(
        SBox_inst_AND_M52_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M52_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M52_t_1_), .ZN(
        SBox_inst_AND_M52_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M52_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M52_t_2_), .ZN(
        SBox_inst_AND_M52_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M52_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M52_t_3_), .ZN(
        SBox_inst_AND_M52_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M52_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M52_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M52_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M52_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M52_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M52_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M52_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M52_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M52_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M52_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M52_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M52_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M52_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[21]), .ZN(
        SBox_inst_AND_M52_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M52_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M52_t_1_), .ZN(
        SBox_inst_AND_M52_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M52_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M52_t_2_), .ZN(
        SBox_inst_AND_M52_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M52_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M52_t_3_), .ZN(
        SBox_inst_AND_M52_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M52_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M52_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M52_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M52_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M52_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M52_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M52_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M52_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M52_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M52_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M52_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M52_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[28]), .A2(SBox_inst_m_post0_42__1_), .A3(
        SBox_inst_AND_M52_t_SR0[3]), .ZN(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[29]), .A2(SBox_inst_m_post0_42__1_), .A3(
        SBox_inst_AND_M52_t_SR0[2]), .ZN(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[28]), .A2(SBox_inst_m_post0_42__2_), .A3(
        SBox_inst_AND_M52_t_SR0[1]), .ZN(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[29]), .A2(SBox_inst_m_post0_42__2_), .A3(
        SBox_inst_AND_M52_t_SR0[0]), .ZN(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[28]), .A2(SBox_inst_m_post1_42__1_), .A3(
        SBox_inst_AND_M52_t_SR1[3]), .ZN(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[29]), .A2(SBox_inst_m_post1_42__1_), .A3(
        SBox_inst_AND_M52_t_SR1[2]), .ZN(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[28]), .A2(SBox_inst_m_post1_42__2_), .A3(
        SBox_inst_AND_M52_t_SR1[1]), .ZN(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[29]), .A2(SBox_inst_m_post1_42__2_), .A3(
        SBox_inst_AND_M52_t_SR1[0]), .ZN(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M52_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[13]) );
  NAND2_X1 SBox_inst_AND_M53_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M53_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M62_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M53_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M53_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M53_nonlinear_layer0_a0nandb0), .B(r_SR[22]), .ZN(
        SBox_inst_m_merged[14]) );
  XOR2_X1 SBox_inst_AND_M53_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M62_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[22]), 
        .Z(SBox_inst_AND_M53_t_1_) );
  XOR2_X1 SBox_inst_AND_M53_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M53_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[22]), 
        .Z(SBox_inst_AND_M53_t_2_) );
  XNOR2_X1 SBox_inst_AND_M53_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M53_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M53_t_1_), .ZN(SBox_inst_AND_M53_t_3_) );
  NOR2_X1 SBox_inst_AND_M53_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[22]), .ZN(
        SBox_inst_AND_M53_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M53_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M53_t_1_), .ZN(
        SBox_inst_AND_M53_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M53_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M53_t_2_), .ZN(
        SBox_inst_AND_M53_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M53_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M53_t_3_), .ZN(
        SBox_inst_AND_M53_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M53_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M53_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M53_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M53_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M53_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M53_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M53_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M53_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M53_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M53_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M53_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M53_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M53_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[22]), .ZN(
        SBox_inst_AND_M53_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M53_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M53_t_1_), .ZN(
        SBox_inst_AND_M53_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M53_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M53_t_2_), .ZN(
        SBox_inst_AND_M53_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M53_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M53_t_3_), .ZN(
        SBox_inst_AND_M53_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M53_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M53_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M53_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M53_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M53_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M53_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M53_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M53_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M53_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M53_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M53_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M53_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[52]), .A2(SBox_inst_m_post0_45__1_), .A3(
        SBox_inst_AND_M53_t_SR0[3]), .ZN(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[53]), .A2(SBox_inst_m_post0_45__1_), .A3(
        SBox_inst_AND_M53_t_SR0[2]), .ZN(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[52]), .A2(SBox_inst_m_post0_45__2_), .A3(
        SBox_inst_AND_M53_t_SR0[1]), .ZN(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[53]), .A2(SBox_inst_m_post0_45__2_), .A3(
        SBox_inst_AND_M53_t_SR0[0]), .ZN(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[52]), .A2(SBox_inst_m_post1_45__1_), .A3(
        SBox_inst_AND_M53_t_SR1[3]), .ZN(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[53]), .A2(SBox_inst_m_post1_45__1_), .A3(
        SBox_inst_AND_M53_t_SR1[2]), .ZN(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[52]), .A2(SBox_inst_m_post1_45__2_), .A3(
        SBox_inst_AND_M53_t_SR1[1]), .ZN(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[53]), .A2(SBox_inst_m_post1_45__2_), .A3(
        SBox_inst_AND_M53_t_SR1[0]), .ZN(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M53_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[15]) );
  NAND2_X1 SBox_inst_AND_M54_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M54_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M63_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M54_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M54_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M54_nonlinear_layer0_a0nandb0), .B(r_SR[23]), .ZN(
        SBox_inst_m_merged[16]) );
  XOR2_X1 SBox_inst_AND_M54_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M63_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[23]), 
        .Z(SBox_inst_AND_M54_t_1_) );
  XOR2_X1 SBox_inst_AND_M54_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M54_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[23]), 
        .Z(SBox_inst_AND_M54_t_2_) );
  XNOR2_X1 SBox_inst_AND_M54_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M54_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M54_t_1_), .ZN(SBox_inst_AND_M54_t_3_) );
  NOR2_X1 SBox_inst_AND_M54_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[23]), .ZN(
        SBox_inst_AND_M54_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M54_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M54_t_1_), .ZN(
        SBox_inst_AND_M54_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M54_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M54_t_2_), .ZN(
        SBox_inst_AND_M54_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M54_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M54_t_3_), .ZN(
        SBox_inst_AND_M54_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M54_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M54_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M54_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M54_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M54_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M54_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M54_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M54_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M54_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M54_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M54_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M54_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M54_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(prch1_o[0]), .A2(r_SR[23]), .ZN(
        SBox_inst_AND_M54_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M54_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(prch1_o[0]), .A2(SBox_inst_AND_M54_t_1_), .ZN(
        SBox_inst_AND_M54_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M54_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(prch1_o[0]), .A2(SBox_inst_AND_M54_t_2_), .ZN(
        SBox_inst_AND_M54_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M54_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(prch1_o[0]), .A2(SBox_inst_AND_M54_t_3_), .ZN(
        SBox_inst_AND_M54_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M54_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M54_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M54_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M54_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M54_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M54_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M54_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M54_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M54_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M54_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M54_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M54_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[18]), .A2(SBox_inst_m_post0_41__1_), .A3(
        SBox_inst_AND_M54_t_SR0[3]), .ZN(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[19]), .A2(SBox_inst_m_post0_41__1_), .A3(
        SBox_inst_AND_M54_t_SR0[2]), .ZN(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[18]), .A2(SBox_inst_m_post0_41__2_), .A3(
        SBox_inst_AND_M54_t_SR0[1]), .ZN(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[19]), .A2(SBox_inst_m_post0_41__2_), .A3(
        SBox_inst_AND_M54_t_SR0[0]), .ZN(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[18]), .A2(SBox_inst_m_post1_41__1_), .A3(
        SBox_inst_AND_M54_t_SR1[3]), .ZN(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[19]), .A2(SBox_inst_m_post1_41__1_), .A3(
        SBox_inst_AND_M54_t_SR1[2]), .ZN(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[18]), .A2(SBox_inst_m_post1_41__2_), .A3(
        SBox_inst_AND_M54_t_SR1[1]), .ZN(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[19]), .A2(SBox_inst_m_post1_41__2_), .A3(
        SBox_inst_AND_M54_t_SR1[0]), .ZN(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M54_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[17]) );
  NAND2_X1 SBox_inst_AND_M55_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M55_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M55_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M55_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M55_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M55_nonlinear_layer0_a0nandb0), .B(r_SR[24]), .ZN(
        SBox_inst_m_merged[18]) );
  XOR2_X1 SBox_inst_AND_M55_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M55_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[24]), 
        .Z(SBox_inst_AND_M55_t_1_) );
  XOR2_X1 SBox_inst_AND_M55_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M55_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[24]), 
        .Z(SBox_inst_AND_M55_t_2_) );
  XNOR2_X1 SBox_inst_AND_M55_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M55_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M55_t_1_), .ZN(SBox_inst_AND_M55_t_3_) );
  NOR2_X1 SBox_inst_AND_M55_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(prch0_o[0]), .A2(r_SR[24]), .ZN(
        SBox_inst_AND_M55_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M55_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(prch0_o[0]), .A2(SBox_inst_AND_M55_t_1_), .ZN(
        SBox_inst_AND_M55_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M55_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(prch0_o[0]), .A2(SBox_inst_AND_M55_t_2_), .ZN(
        SBox_inst_AND_M55_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M55_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(prch0_o[0]), .A2(SBox_inst_AND_M55_t_3_), .ZN(
        SBox_inst_AND_M55_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M55_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M55_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M55_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M55_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M55_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M55_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M55_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M55_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M55_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M55_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M55_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M55_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M55_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[24]), .ZN(
        SBox_inst_AND_M55_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M55_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M55_t_1_), .ZN(
        SBox_inst_AND_M55_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M55_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M55_t_2_), .ZN(
        SBox_inst_AND_M55_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M55_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M55_t_3_), .ZN(
        SBox_inst_AND_M55_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M55_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M55_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M55_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M55_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M55_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M55_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M55_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M55_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M55_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M55_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M55_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M55_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[24]), .A2(SBox_inst_m_post0_44__1_), .A3(
        SBox_inst_AND_M55_t_SR0[3]), .ZN(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[25]), .A2(SBox_inst_m_post0_44__1_), .A3(
        SBox_inst_AND_M55_t_SR0[2]), .ZN(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[24]), .A2(SBox_inst_m_post0_44__2_), .A3(
        SBox_inst_AND_M55_t_SR0[1]), .ZN(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[25]), .A2(SBox_inst_m_post0_44__2_), .A3(
        SBox_inst_AND_M55_t_SR0[0]), .ZN(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[24]), .A2(SBox_inst_m_post1_44__1_), .A3(
        SBox_inst_AND_M55_t_SR1[3]), .ZN(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[25]), .A2(SBox_inst_m_post1_44__1_), .A3(
        SBox_inst_AND_M55_t_SR1[2]), .ZN(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[24]), .A2(SBox_inst_m_post1_44__2_), .A3(
        SBox_inst_AND_M55_t_SR1[1]), .ZN(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[25]), .A2(SBox_inst_m_post1_44__2_), .A3(
        SBox_inst_AND_M55_t_SR1[0]), .ZN(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M55_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[19]) );
  NAND2_X1 SBox_inst_AND_M56_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M56_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M56_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M56_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M56_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M56_nonlinear_layer0_a0nandb0), .B(r_SR[25]), .ZN(
        SBox_inst_m_merged[20]) );
  XOR2_X1 SBox_inst_AND_M56_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M56_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[25]), 
        .Z(SBox_inst_AND_M56_t_1_) );
  XOR2_X1 SBox_inst_AND_M56_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M56_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[25]), 
        .Z(SBox_inst_AND_M56_t_2_) );
  XNOR2_X1 SBox_inst_AND_M56_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M56_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M56_t_1_), .ZN(SBox_inst_AND_M56_t_3_) );
  NOR2_X1 SBox_inst_AND_M56_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(prch0_o[0]), .A2(r_SR[25]), .ZN(
        SBox_inst_AND_M56_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M56_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(prch0_o[0]), .A2(SBox_inst_AND_M56_t_1_), .ZN(
        SBox_inst_AND_M56_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M56_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(prch0_o[0]), .A2(SBox_inst_AND_M56_t_2_), .ZN(
        SBox_inst_AND_M56_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M56_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(prch0_o[0]), .A2(SBox_inst_AND_M56_t_3_), .ZN(
        SBox_inst_AND_M56_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M56_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M56_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M56_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M56_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M56_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M56_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M56_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M56_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M56_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M56_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M56_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M56_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M56_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(prch1_o[0]), .A2(r_SR[25]), .ZN(
        SBox_inst_AND_M56_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M56_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(prch1_o[0]), .A2(SBox_inst_AND_M56_t_1_), .ZN(
        SBox_inst_AND_M56_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M56_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(prch1_o[0]), .A2(SBox_inst_AND_M56_t_2_), .ZN(
        SBox_inst_AND_M56_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M56_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(prch1_o[0]), .A2(SBox_inst_AND_M56_t_3_), .ZN(
        SBox_inst_AND_M56_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M56_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M56_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M56_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M56_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M56_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M56_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M56_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M56_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M56_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M56_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M56_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M56_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[44]), .A2(SBox_inst_inv_l0[6]), .A3(
        SBox_inst_AND_M56_t_SR0[3]), .ZN(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[45]), .A2(SBox_inst_inv_l0[6]), .A3(
        SBox_inst_AND_M56_t_SR0[2]), .ZN(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[44]), .A2(SBox_inst_inv_l0[7]), .A3(
        SBox_inst_AND_M56_t_SR0[1]), .ZN(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[45]), .A2(SBox_inst_inv_l0[7]), .A3(
        SBox_inst_AND_M56_t_SR0[0]), .ZN(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[44]), .A2(SBox_inst_inv_l1[6]), .A3(
        SBox_inst_AND_M56_t_SR1[3]), .ZN(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[45]), .A2(SBox_inst_inv_l1[6]), .A3(
        SBox_inst_AND_M56_t_SR1[2]), .ZN(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[44]), .A2(SBox_inst_inv_l1[7]), .A3(
        SBox_inst_AND_M56_t_SR1[1]), .ZN(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[45]), .A2(SBox_inst_inv_l1[7]), .A3(
        SBox_inst_AND_M56_t_SR1[0]), .ZN(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M56_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[21]) );
  NAND2_X1 SBox_inst_AND_M57_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M57_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M57_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M57_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M57_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M57_nonlinear_layer0_a0nandb0), .B(r_SR[26]), .ZN(
        SBox_inst_m_merged[22]) );
  XOR2_X1 SBox_inst_AND_M57_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M57_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[26]), 
        .Z(SBox_inst_AND_M57_t_1_) );
  XOR2_X1 SBox_inst_AND_M57_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M57_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[26]), 
        .Z(SBox_inst_AND_M57_t_2_) );
  XNOR2_X1 SBox_inst_AND_M57_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M57_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M57_t_1_), .ZN(SBox_inst_AND_M57_t_3_) );
  NOR2_X1 SBox_inst_AND_M57_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(prch0_o[0]), .A2(r_SR[26]), .ZN(
        SBox_inst_AND_M57_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M57_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(prch0_o[0]), .A2(SBox_inst_AND_M57_t_1_), .ZN(
        SBox_inst_AND_M57_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M57_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(prch0_o[0]), .A2(SBox_inst_AND_M57_t_2_), .ZN(
        SBox_inst_AND_M57_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M57_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(prch0_o[0]), .A2(SBox_inst_AND_M57_t_3_), .ZN(
        SBox_inst_AND_M57_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M57_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M57_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M57_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M57_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M57_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M57_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M57_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M57_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M57_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M57_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M57_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M57_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M57_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[26]), .ZN(
        SBox_inst_AND_M57_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M57_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M57_t_1_), .ZN(
        SBox_inst_AND_M57_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M57_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M57_t_2_), .ZN(
        SBox_inst_AND_M57_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M57_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M57_t_3_), .ZN(
        SBox_inst_AND_M57_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M57_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M57_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M57_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M57_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M57_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M57_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M57_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M57_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M57_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M57_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M57_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M57_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[36]), .A2(SBox_inst_inv_l0[4]), .A3(
        SBox_inst_AND_M57_t_SR0[3]), .ZN(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[37]), .A2(SBox_inst_inv_l0[4]), .A3(
        SBox_inst_AND_M57_t_SR0[2]), .ZN(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[36]), .A2(SBox_inst_inv_l0[5]), .A3(
        SBox_inst_AND_M57_t_SR0[1]), .ZN(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[37]), .A2(SBox_inst_inv_l0[5]), .A3(
        SBox_inst_AND_M57_t_SR0[0]), .ZN(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[36]), .A2(SBox_inst_inv_l1[4]), .A3(
        SBox_inst_AND_M57_t_SR1[3]), .ZN(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[37]), .A2(SBox_inst_inv_l1[4]), .A3(
        SBox_inst_AND_M57_t_SR1[2]), .ZN(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[36]), .A2(SBox_inst_inv_l1[5]), .A3(
        SBox_inst_AND_M57_t_SR1[1]), .ZN(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[37]), .A2(SBox_inst_inv_l1[5]), .A3(
        SBox_inst_AND_M57_t_SR1[0]), .ZN(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M57_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[23]) );
  NAND2_X1 SBox_inst_AND_M58_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M58_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M58_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M58_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M58_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M58_nonlinear_layer0_a0nandb0), .B(r_SR[27]), .ZN(
        SBox_inst_m_merged[24]) );
  XOR2_X1 SBox_inst_AND_M58_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M58_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[27]), 
        .Z(SBox_inst_AND_M58_t_1_) );
  XOR2_X1 SBox_inst_AND_M58_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M58_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[27]), 
        .Z(SBox_inst_AND_M58_t_2_) );
  XNOR2_X1 SBox_inst_AND_M58_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M58_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M58_t_1_), .ZN(SBox_inst_AND_M58_t_3_) );
  NOR2_X1 SBox_inst_AND_M58_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[27]), .ZN(
        SBox_inst_AND_M58_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M58_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M58_t_1_), .ZN(
        SBox_inst_AND_M58_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M58_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M58_t_2_), .ZN(
        SBox_inst_AND_M58_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M58_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M58_t_3_), .ZN(
        SBox_inst_AND_M58_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M58_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M58_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M58_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M58_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M58_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M58_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M58_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M58_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M58_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M58_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M58_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M58_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M58_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[27]), .ZN(
        SBox_inst_AND_M58_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M58_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M58_t_1_), .ZN(
        SBox_inst_AND_M58_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M58_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M58_t_2_), .ZN(
        SBox_inst_AND_M58_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M58_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M58_t_3_), .ZN(
        SBox_inst_AND_M58_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M58_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M58_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M58_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M58_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M58_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M58_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M58_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M58_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M58_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M58_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M58_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M58_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[4]), .A2(SBox_inst_m_post0_43__1_), .A3(
        SBox_inst_AND_M58_t_SR0[3]), .ZN(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[5]), .A2(SBox_inst_m_post0_43__1_), .A3(
        SBox_inst_AND_M58_t_SR0[2]), .ZN(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[4]), .A2(SBox_inst_m_post0_43__2_), .A3(
        SBox_inst_AND_M58_t_SR0[1]), .ZN(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[5]), .A2(SBox_inst_m_post0_43__2_), .A3(
        SBox_inst_AND_M58_t_SR0[0]), .ZN(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[4]), .A2(SBox_inst_m_post1_43__1_), .A3(
        SBox_inst_AND_M58_t_SR1[3]), .ZN(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[5]), .A2(SBox_inst_m_post1_43__1_), .A3(
        SBox_inst_AND_M58_t_SR1[2]), .ZN(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[4]), .A2(SBox_inst_m_post1_43__2_), .A3(
        SBox_inst_AND_M58_t_SR1[1]), .ZN(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[5]), .A2(SBox_inst_m_post1_43__2_), .A3(
        SBox_inst_AND_M58_t_SR1[0]), .ZN(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M58_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[25]) );
  NAND2_X1 SBox_inst_AND_M59_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M59_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M59_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M59_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M59_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M59_nonlinear_layer0_a0nandb0), .B(r_SR[28]), .ZN(
        SBox_inst_m_merged[26]) );
  XOR2_X1 SBox_inst_AND_M59_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M59_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[28]), 
        .Z(SBox_inst_AND_M59_t_1_) );
  XOR2_X1 SBox_inst_AND_M59_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M59_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[28]), 
        .Z(SBox_inst_AND_M59_t_2_) );
  XNOR2_X1 SBox_inst_AND_M59_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M59_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M59_t_1_), .ZN(SBox_inst_AND_M59_t_3_) );
  NOR2_X1 SBox_inst_AND_M59_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[28]), .ZN(
        SBox_inst_AND_M59_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M59_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M59_t_1_), .ZN(
        SBox_inst_AND_M59_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M59_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M59_t_2_), .ZN(
        SBox_inst_AND_M59_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M59_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M59_t_3_), .ZN(
        SBox_inst_AND_M59_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M59_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M59_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M59_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M59_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M59_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M59_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M59_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M59_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M59_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M59_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M59_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M59_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M59_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[28]), .ZN(
        SBox_inst_AND_M59_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M59_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M59_t_1_), .ZN(
        SBox_inst_AND_M59_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M59_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M59_t_2_), .ZN(
        SBox_inst_AND_M59_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M59_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M59_t_3_), .ZN(
        SBox_inst_AND_M59_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M59_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M59_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M59_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M59_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M59_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M59_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M59_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M59_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M59_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M59_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M59_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M59_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[42]), .A2(SBox_inst_inv_l0[2]), .A3(
        SBox_inst_AND_M59_t_SR0[3]), .ZN(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[43]), .A2(SBox_inst_inv_l0[2]), .A3(
        SBox_inst_AND_M59_t_SR0[2]), .ZN(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[42]), .A2(SBox_inst_inv_l0[3]), .A3(
        SBox_inst_AND_M59_t_SR0[1]), .ZN(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[43]), .A2(SBox_inst_inv_l0[3]), .A3(
        SBox_inst_AND_M59_t_SR0[0]), .ZN(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[42]), .A2(SBox_inst_inv_l1[2]), .A3(
        SBox_inst_AND_M59_t_SR1[3]), .ZN(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[43]), .A2(SBox_inst_inv_l1[2]), .A3(
        SBox_inst_AND_M59_t_SR1[2]), .ZN(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[42]), .A2(SBox_inst_inv_l1[3]), .A3(
        SBox_inst_AND_M59_t_SR1[1]), .ZN(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[43]), .A2(SBox_inst_inv_l1[3]), .A3(
        SBox_inst_AND_M59_t_SR1[0]), .ZN(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M59_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[27]) );
  NAND2_X1 SBox_inst_AND_M60_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M60_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M60_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M60_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M60_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M60_nonlinear_layer0_a0nandb0), .B(r_SR[29]), .ZN(
        SBox_inst_m_merged[28]) );
  XOR2_X1 SBox_inst_AND_M60_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M60_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[29]), 
        .Z(SBox_inst_AND_M60_t_1_) );
  XOR2_X1 SBox_inst_AND_M60_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M60_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[29]), 
        .Z(SBox_inst_AND_M60_t_2_) );
  XNOR2_X1 SBox_inst_AND_M60_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M60_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M60_t_1_), .ZN(SBox_inst_AND_M60_t_3_) );
  NOR2_X1 SBox_inst_AND_M60_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[29]), .ZN(
        SBox_inst_AND_M60_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M60_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M60_t_1_), .ZN(
        SBox_inst_AND_M60_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M60_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M60_t_2_), .ZN(
        SBox_inst_AND_M60_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M60_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M60_t_3_), .ZN(
        SBox_inst_AND_M60_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M60_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M60_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M60_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M60_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M60_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M60_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M60_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M60_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M60_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M60_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M60_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M60_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M60_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(prch1_o[0]), .A2(r_SR[29]), .ZN(
        SBox_inst_AND_M60_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M60_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(prch1_o[0]), .A2(SBox_inst_AND_M60_t_1_), .ZN(
        SBox_inst_AND_M60_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M60_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(prch1_o[0]), .A2(SBox_inst_AND_M60_t_2_), .ZN(
        SBox_inst_AND_M60_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M60_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(prch1_o[0]), .A2(SBox_inst_AND_M60_t_3_), .ZN(
        SBox_inst_AND_M60_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M60_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M60_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M60_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M60_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M60_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M60_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M60_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M60_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M60_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M60_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M60_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M60_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[38]), .A2(SBox_inst_inv_l0[0]), .A3(
        SBox_inst_AND_M60_t_SR0[3]), .ZN(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[39]), .A2(SBox_inst_inv_l0[0]), .A3(
        SBox_inst_AND_M60_t_SR0[2]), .ZN(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[38]), .A2(SBox_inst_inv_l0[1]), .A3(
        SBox_inst_AND_M60_t_SR0[1]), .ZN(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[39]), .A2(SBox_inst_inv_l0[1]), .A3(
        SBox_inst_AND_M60_t_SR0[0]), .ZN(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[38]), .A2(SBox_inst_inv_l1[0]), .A3(
        SBox_inst_AND_M60_t_SR1[3]), .ZN(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[39]), .A2(SBox_inst_inv_l1[0]), .A3(
        SBox_inst_AND_M60_t_SR1[2]), .ZN(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[38]), .A2(SBox_inst_inv_l1[1]), .A3(
        SBox_inst_AND_M60_t_SR1[1]), .ZN(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[39]), .A2(SBox_inst_inv_l1[1]), .A3(
        SBox_inst_AND_M60_t_SR1[0]), .ZN(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M60_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[29]) );
  NAND2_X1 SBox_inst_AND_M61_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M61_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M61_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M61_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M61_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M61_nonlinear_layer0_a0nandb0), .B(r_SR[30]), .ZN(
        SBox_inst_m_merged[30]) );
  XOR2_X1 SBox_inst_AND_M61_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M61_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[30]), 
        .Z(SBox_inst_AND_M61_t_1_) );
  XOR2_X1 SBox_inst_AND_M61_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M61_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[30]), 
        .Z(SBox_inst_AND_M61_t_2_) );
  XNOR2_X1 SBox_inst_AND_M61_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M61_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M61_t_1_), .ZN(SBox_inst_AND_M61_t_3_) );
  NOR2_X1 SBox_inst_AND_M61_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[30]), .ZN(
        SBox_inst_AND_M61_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M61_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M61_t_1_), .ZN(
        SBox_inst_AND_M61_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M61_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M61_t_2_), .ZN(
        SBox_inst_AND_M61_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M61_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M61_t_3_), .ZN(
        SBox_inst_AND_M61_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M61_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M61_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M61_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M61_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M61_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M61_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M61_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M61_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M61_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M61_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M61_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M61_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M61_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[30]), .ZN(
        SBox_inst_AND_M61_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M61_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M61_t_1_), .ZN(
        SBox_inst_AND_M61_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M61_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M61_t_2_), .ZN(
        SBox_inst_AND_M61_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M61_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M61_t_3_), .ZN(
        SBox_inst_AND_M61_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M61_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M61_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M61_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M61_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M61_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M61_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M61_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M61_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M61_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M61_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M61_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M61_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[0]), .A2(SBox_inst_m_post0_42__1_), .A3(
        SBox_inst_AND_M61_t_SR0[3]), .ZN(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[1]), .A2(SBox_inst_m_post0_42__1_), .A3(
        SBox_inst_AND_M61_t_SR0[2]), .ZN(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[0]), .A2(SBox_inst_m_post0_42__2_), .A3(
        SBox_inst_AND_M61_t_SR0[1]), .ZN(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[1]), .A2(SBox_inst_m_post0_42__2_), .A3(
        SBox_inst_AND_M61_t_SR0[0]), .ZN(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[0]), .A2(SBox_inst_m_post1_42__1_), .A3(
        SBox_inst_AND_M61_t_SR1[3]), .ZN(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[1]), .A2(SBox_inst_m_post1_42__1_), .A3(
        SBox_inst_AND_M61_t_SR1[2]), .ZN(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[0]), .A2(SBox_inst_m_post1_42__2_), .A3(
        SBox_inst_AND_M61_t_SR1[1]), .ZN(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[1]), .A2(SBox_inst_m_post1_42__2_), .A3(
        SBox_inst_AND_M61_t_SR1[0]), .ZN(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M61_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[31]) );
  NAND2_X1 SBox_inst_AND_M62_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M62_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M62_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M62_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M62_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M62_nonlinear_layer0_a0nandb0), .B(r_SR[31]), .ZN(
        SBox_inst_m_merged[32]) );
  XOR2_X1 SBox_inst_AND_M62_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M62_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[31]), 
        .Z(SBox_inst_AND_M62_t_1_) );
  XOR2_X1 SBox_inst_AND_M62_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M62_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[31]), 
        .Z(SBox_inst_AND_M62_t_2_) );
  XNOR2_X1 SBox_inst_AND_M62_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M62_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M62_t_1_), .ZN(SBox_inst_AND_M62_t_3_) );
  NOR2_X1 SBox_inst_AND_M62_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[31]), .ZN(
        SBox_inst_AND_M62_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M62_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M62_t_1_), .ZN(
        SBox_inst_AND_M62_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M62_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M62_t_2_), .ZN(
        SBox_inst_AND_M62_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M62_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M62_t_3_), .ZN(
        SBox_inst_AND_M62_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M62_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M62_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M62_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M62_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M62_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M62_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M62_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M62_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M62_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M62_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M62_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M62_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M62_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[31]), .ZN(
        SBox_inst_AND_M62_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M62_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M62_t_1_), .ZN(
        SBox_inst_AND_M62_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M62_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M62_t_2_), .ZN(
        SBox_inst_AND_M62_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M62_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M62_t_3_), .ZN(
        SBox_inst_AND_M62_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M62_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M62_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M62_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M62_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M62_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M62_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M62_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M62_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M62_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M62_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M62_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M62_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[6]), .A2(SBox_inst_m_post0_45__1_), .A3(
        SBox_inst_AND_M62_t_SR0[3]), .ZN(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[7]), .A2(SBox_inst_m_post0_45__1_), .A3(
        SBox_inst_AND_M62_t_SR0[2]), .ZN(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[6]), .A2(SBox_inst_m_post0_45__2_), .A3(
        SBox_inst_AND_M62_t_SR0[1]), .ZN(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[7]), .A2(SBox_inst_m_post0_45__2_), .A3(
        SBox_inst_AND_M62_t_SR0[0]), .ZN(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[6]), .A2(SBox_inst_m_post1_45__1_), .A3(
        SBox_inst_AND_M62_t_SR1[3]), .ZN(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[7]), .A2(SBox_inst_m_post1_45__1_), .A3(
        SBox_inst_AND_M62_t_SR1[2]), .ZN(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[6]), .A2(SBox_inst_m_post1_45__2_), .A3(
        SBox_inst_AND_M62_t_SR1[1]), .ZN(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[7]), .A2(SBox_inst_m_post1_45__2_), .A3(
        SBox_inst_AND_M62_t_SR1[0]), .ZN(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M62_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[33]) );
  NAND2_X1 SBox_inst_AND_M63_nonlinear_layer0_nand2_inst_U1 ( .A1(
        SBox_inst_AND_M63_nonlinear_precomp_b_delayed_0__0_), .A2(
        SBox_inst_AND_M63_nonlinear_precomp_a_delayed_0__0_), .ZN(
        SBox_inst_AND_M63_nonlinear_layer0_a0nandb0) );
  XNOR2_X1 SBox_inst_AND_M63_nonlinear_layer0_gen_out__xor2_inst_U1 ( .A(
        SBox_inst_AND_M63_nonlinear_layer0_a0nandb0), .B(r_SR[32]), .ZN(
        SBox_inst_m_merged[34]) );
  XOR2_X1 SBox_inst_AND_M63_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst1_U1 ( 
        .A(SBox_inst_AND_M63_nonlinear_precomp_a_delayed_0__0_), .B(r_SR[32]), 
        .Z(SBox_inst_AND_M63_t_1_) );
  XOR2_X1 SBox_inst_AND_M63_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_xor2_inst2_U1 ( 
        .A(SBox_inst_AND_M63_nonlinear_precomp_b_delayed_0__0_), .B(r_SR[32]), 
        .Z(SBox_inst_AND_M63_t_2_) );
  XNOR2_X1 SBox_inst_AND_M63_nonlinear_precomp_gen_precomp_layer__1__gen_precomp_mtg__0__mtg_inst_following_mtg_instance__xor2_inst3_U1 ( 
        .A(SBox_inst_AND_M63_nonlinear_precomp_b_delayed_0__0_), .B(
        SBox_inst_AND_M63_t_1_), .ZN(SBox_inst_AND_M63_t_3_) );
  NOR2_X1 SBox_inst_AND_M63_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(r_SR[32]), .ZN(
        SBox_inst_AND_M63_gen_layer__1__reg_t_inst0_w[0]) );
  NOR2_X1 SBox_inst_AND_M63_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M63_t_1_), .ZN(
        SBox_inst_AND_M63_gen_layer__1__reg_t_inst0_w[1]) );
  NOR2_X1 SBox_inst_AND_M63_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M63_t_2_), .ZN(
        SBox_inst_AND_M63_gen_layer__1__reg_t_inst0_w[2]) );
  NOR2_X1 SBox_inst_AND_M63_gen_layer__1__reg_t_inst0_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n10), .A2(SBox_inst_AND_M63_t_3_), .ZN(
        SBox_inst_AND_M63_gen_layer__1__reg_t_inst0_w[3]) );
  DFF_X1 SBox_inst_AND_M63_gen_layer__1__reg_t_inst0_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M63_gen_layer__1__reg_t_inst0_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M63_t_SR0[0]), .QN() );
  DFF_X1 SBox_inst_AND_M63_gen_layer__1__reg_t_inst0_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M63_gen_layer__1__reg_t_inst0_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M63_t_SR0[1]), .QN() );
  DFF_X1 SBox_inst_AND_M63_gen_layer__1__reg_t_inst0_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M63_gen_layer__1__reg_t_inst0_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M63_t_SR0[2]), .QN() );
  DFF_X1 SBox_inst_AND_M63_gen_layer__1__reg_t_inst0_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M63_gen_layer__1__reg_t_inst0_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M63_t_SR0[3]), .QN() );
  NOR2_X1 SBox_inst_AND_M63_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__0__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(r_SR[32]), .ZN(
        SBox_inst_AND_M63_gen_layer__1__reg_t_inst1_w[0]) );
  NOR2_X1 SBox_inst_AND_M63_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__1__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M63_t_1_), .ZN(
        SBox_inst_AND_M63_gen_layer__1__reg_t_inst1_w[1]) );
  NOR2_X1 SBox_inst_AND_M63_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__2__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M63_t_2_), .ZN(
        SBox_inst_AND_M63_gen_layer__1__reg_t_inst1_w[2]) );
  NOR2_X1 SBox_inst_AND_M63_gen_layer__1__reg_t_inst1_ctrl_inst_loop_gen_prch__3__ctrl_prch_inst_U1 ( 
        .A1(SBox_inst_n8), .A2(SBox_inst_AND_M63_t_3_), .ZN(
        SBox_inst_AND_M63_gen_layer__1__reg_t_inst1_w[3]) );
  DFF_X1 SBox_inst_AND_M63_gen_layer__1__reg_t_inst1_reg_inst_q_reg_0_ ( .D(
        SBox_inst_AND_M63_gen_layer__1__reg_t_inst1_w[0]), .CK(clk), .Q(
        SBox_inst_AND_M63_t_SR1[0]), .QN() );
  DFF_X1 SBox_inst_AND_M63_gen_layer__1__reg_t_inst1_reg_inst_q_reg_1_ ( .D(
        SBox_inst_AND_M63_gen_layer__1__reg_t_inst1_w[1]), .CK(clk), .Q(
        SBox_inst_AND_M63_t_SR1[1]), .QN() );
  DFF_X1 SBox_inst_AND_M63_gen_layer__1__reg_t_inst1_reg_inst_q_reg_2_ ( .D(
        SBox_inst_AND_M63_gen_layer__1__reg_t_inst1_w[2]), .CK(clk), .Q(
        SBox_inst_AND_M63_t_SR1[2]), .QN() );
  DFF_X1 SBox_inst_AND_M63_gen_layer__1__reg_t_inst1_reg_inst_q_reg_3_ ( .D(
        SBox_inst_AND_M63_gen_layer__1__reg_t_inst1_w[3]), .CK(clk), .Q(
        SBox_inst_AND_M63_t_SR1[3]), .QN() );
  NAND3_X1 SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t0[2]), .A2(SBox_inst_m_post0_41__1_), .A3(
        SBox_inst_AND_M63_t_SR0[3]), .ZN(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t0[3]), .A2(SBox_inst_m_post0_41__1_), .A3(
        SBox_inst_AND_M63_t_SR0[2]), .ZN(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t0[2]), .A2(SBox_inst_m_post0_41__2_), .A3(
        SBox_inst_AND_M63_t_SR0[1]), .ZN(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t0[3]), .A2(SBox_inst_m_post0_41__2_), .A3(
        SBox_inst_AND_M63_t_SR0[0]), .ZN(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst0_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_) );
  NAND3_X1 SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst3_U1 ( 
        .A1(SBox_inst_t1[2]), .A2(SBox_inst_m_post1_41__1_), .A3(
        SBox_inst_AND_M63_t_SR1[3]), .ZN(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]) );
  NAND3_X1 SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst2_U1 ( 
        .A1(SBox_inst_t1[3]), .A2(SBox_inst_m_post1_41__1_), .A3(
        SBox_inst_AND_M63_t_SR1[2]), .ZN(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]) );
  NAND3_X1 SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst1_U1 ( 
        .A1(SBox_inst_t1[2]), .A2(SBox_inst_m_post1_41__2_), .A3(
        SBox_inst_AND_M63_t_SR1[1]), .ZN(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]) );
  NAND3_X1 SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand3_inst0_U1 ( 
        .A1(SBox_inst_t1[3]), .A2(SBox_inst_m_post1_41__2_), .A3(
        SBox_inst_AND_M63_t_SR1[0]), .ZN(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]) );
  NAND4_X1 SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_nand4_inst0_U1 ( 
        .A1(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[0]), .A2(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[1]), .A3(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[2]), .A4(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__mux_L_inst1_loop_gen_parallel_muxes__0__mux_inst_genblk2_mux_inst_w[3]), .ZN(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_) );
  NOR2_X1 SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__gen_merge__0__merge_inst_U1 ( 
        .A1(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux1_0_), .A2(
        SBox_inst_AND_M63_nonlinear_consecutive_inst_gen_consecutive_layer__1__tmp_mux0_0_), .ZN(SBox_inst_m_merged[35]) );
  XOR2_X1 SBox_inst_XOR_L00_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[30]), .B(SBox_inst_m_merged[32]), .Z(SBox_inst_l[0]) );
  XOR2_X1 SBox_inst_XOR_L00_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[31]), .B(SBox_inst_m_merged[33]), .Z(SBox_inst_l[1]) );
  XOR2_X1 SBox_inst_XOR_L01_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[8]), 
        .B(SBox_inst_m_merged[20]), .Z(SBox_inst_l[2]) );
  XOR2_X1 SBox_inst_XOR_L01_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[9]), .B(SBox_inst_m_merged[21]), .Z(SBox_inst_l[3])
         );
  XOR2_X1 SBox_inst_XOR_L02_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[0]), 
        .B(SBox_inst_m_merged[4]), .Z(SBox_inst_l[4]) );
  XOR2_X1 SBox_inst_XOR_L02_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[1]), .B(SBox_inst_m_merged[5]), .Z(SBox_inst_l[5])
         );
  XOR2_X1 SBox_inst_XOR_L03_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[2]), 
        .B(SBox_inst_m_merged[18]), .Z(SBox_inst_l[6]) );
  XOR2_X1 SBox_inst_XOR_L03_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[3]), .B(SBox_inst_m_merged[19]), .Z(SBox_inst_l[7])
         );
  XOR2_X1 SBox_inst_XOR_L04_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[16]), .B(SBox_inst_m_merged[24]), .Z(SBox_inst_l[8]) );
  XOR2_X1 SBox_inst_XOR_L04_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[17]), .B(SBox_inst_m_merged[25]), .Z(SBox_inst_l[9]) );
  XOR2_X1 SBox_inst_XOR_L05_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[6]), 
        .B(SBox_inst_m_merged[30]), .Z(SBox_inst_l[10]) );
  XOR2_X1 SBox_inst_XOR_L05_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[7]), .B(SBox_inst_m_merged[31]), .Z(SBox_inst_l[11]) );
  XOR2_X1 SBox_inst_XOR_L06_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[32]), .B(SBox_inst_l[10]), .Z(SBox_inst_l[12]) );
  XOR2_X1 SBox_inst_XOR_L06_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[33]), .B(SBox_inst_l[11]), .Z(SBox_inst_l[13]) );
  XOR2_X1 SBox_inst_XOR_L07_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[0]), 
        .B(SBox_inst_l[6]), .Z(SBox_inst_l[14]) );
  XOR2_X1 SBox_inst_XOR_L07_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[1]), .B(SBox_inst_l[7]), .Z(SBox_inst_l[15]) );
  XOR2_X1 SBox_inst_XOR_L08_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[10]), .B(SBox_inst_m_merged[26]), .Z(SBox_inst_l[16]) );
  XOR2_X1 SBox_inst_XOR_L08_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[11]), .B(SBox_inst_m_merged[27]), .Z(
        SBox_inst_l[17]) );
  XOR2_X1 SBox_inst_XOR_L09_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[12]), .B(SBox_inst_m_merged[14]), .Z(SBox_inst_l[18]) );
  XOR2_X1 SBox_inst_XOR_L09_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[13]), .B(SBox_inst_m_merged[15]), .Z(
        SBox_inst_l[19]) );
  XOR2_X1 SBox_inst_XOR_L10_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[14]), .B(SBox_inst_l[8]), .Z(SBox_inst_l[20]) );
  XOR2_X1 SBox_inst_XOR_L10_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[15]), .B(SBox_inst_l[9]), .Z(SBox_inst_l[21]) );
  XOR2_X1 SBox_inst_XOR_L11_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[28]), .B(SBox_inst_l[4]), .Z(SBox_inst_l[22]) );
  XOR2_X1 SBox_inst_XOR_L11_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[29]), .B(SBox_inst_l[5]), .Z(SBox_inst_l[23]) );
  XOR2_X1 SBox_inst_XOR_L12_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[4]), 
        .B(SBox_inst_m_merged[10]), .Z(SBox_inst_l[24]) );
  XOR2_X1 SBox_inst_XOR_L12_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[5]), .B(SBox_inst_m_merged[11]), .Z(SBox_inst_l[25]) );
  XOR2_X1 SBox_inst_XOR_L13_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[8]), 
        .B(SBox_inst_l[0]), .Z(SBox_inst_l[26]) );
  XOR2_X1 SBox_inst_XOR_L13_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[9]), .B(SBox_inst_l[1]), .Z(SBox_inst_l[27]) );
  XOR2_X1 SBox_inst_XOR_L14_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[12]), .B(SBox_inst_m_merged[30]), .Z(SBox_inst_l[28]) );
  XOR2_X1 SBox_inst_XOR_L14_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[13]), .B(SBox_inst_m_merged[31]), .Z(
        SBox_inst_l[29]) );
  XOR2_X1 SBox_inst_XOR_L15_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[18]), .B(SBox_inst_l[2]), .Z(SBox_inst_l[30]) );
  XOR2_X1 SBox_inst_XOR_L15_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[19]), .B(SBox_inst_l[3]), .Z(SBox_inst_l[31]) );
  XOR2_X1 SBox_inst_XOR_L16_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[20]), .B(SBox_inst_l[0]), .Z(SBox_inst_l[32]) );
  XOR2_X1 SBox_inst_XOR_L16_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[21]), .B(SBox_inst_l[1]), .Z(SBox_inst_l[33]) );
  XOR2_X1 SBox_inst_XOR_L17_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[22]), .B(SBox_inst_l[2]), .Z(SBox_inst_l[34]) );
  XOR2_X1 SBox_inst_XOR_L17_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[23]), .B(SBox_inst_l[3]), .Z(SBox_inst_l[35]) );
  XOR2_X1 SBox_inst_XOR_L18_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[24]), .B(SBox_inst_l[16]), .Z(SBox_inst_l[36]) );
  XOR2_X1 SBox_inst_XOR_L18_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[25]), .B(SBox_inst_l[17]), .Z(SBox_inst_l[37]) );
  XOR2_X1 SBox_inst_XOR_L19_gen_out__layer0_xor_U1 ( .A(SBox_inst_m_merged[34]), .B(SBox_inst_l[8]), .Z(SBox_inst_l[38]) );
  XOR2_X1 SBox_inst_XOR_L19_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_m_merged[35]), .B(SBox_inst_l[9]), .Z(SBox_inst_l[39]) );
  XOR2_X1 SBox_inst_XOR_L20_gen_out__layer0_xor_U1 ( .A(SBox_inst_l[0]), .B(
        SBox_inst_l[2]), .Z(SBox_inst_l[40]) );
  XOR2_X1 SBox_inst_XOR_L20_loop_gen_layer__1__xor_inst_U1 ( .A(SBox_inst_l[1]), .B(SBox_inst_l[3]), .Z(SBox_inst_l[41]) );
  XOR2_X1 SBox_inst_XOR_L21_gen_out__layer0_xor_U1 ( .A(SBox_inst_l[2]), .B(
        SBox_inst_l[14]), .Z(SBox_inst_l[42]) );
  XOR2_X1 SBox_inst_XOR_L21_loop_gen_layer__1__xor_inst_U1 ( .A(SBox_inst_l[3]), .B(SBox_inst_l[15]), .Z(SBox_inst_l[43]) );
  XOR2_X1 SBox_inst_XOR_L22_gen_out__layer0_xor_U1 ( .A(SBox_inst_l[6]), .B(
        SBox_inst_l[24]), .Z(SBox_inst_l[44]) );
  XOR2_X1 SBox_inst_XOR_L22_loop_gen_layer__1__xor_inst_U1 ( .A(SBox_inst_l[7]), .B(SBox_inst_l[25]), .Z(SBox_inst_l[45]) );
  XOR2_X1 SBox_inst_XOR_L23_gen_out__layer0_xor_U1 ( .A(SBox_inst_l[36]), .B(
        SBox_inst_l[4]), .Z(SBox_inst_l[46]) );
  XOR2_X1 SBox_inst_XOR_L23_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_l[37]), .B(SBox_inst_l[5]), .Z(SBox_inst_l[47]) );
  XOR2_X1 SBox_inst_XOR_L24_gen_out__layer0_xor_U1 ( .A(SBox_inst_l[30]), .B(
        SBox_inst_l[18]), .Z(SBox_inst_l[48]) );
  XOR2_X1 SBox_inst_XOR_L24_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_l[31]), .B(SBox_inst_l[19]), .Z(SBox_inst_l[49]) );
  XOR2_X1 SBox_inst_XOR_L25_gen_out__layer0_xor_U1 ( .A(SBox_inst_l[12]), .B(
        SBox_inst_l[20]), .Z(SBox_inst_l[50]) );
  XOR2_X1 SBox_inst_XOR_L25_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_l[13]), .B(SBox_inst_l[21]), .Z(SBox_inst_l[51]) );
  XOR2_X1 SBox_inst_XOR_L26_gen_out__layer0_xor_U1 ( .A(SBox_inst_l[14]), .B(
        SBox_inst_l[18]), .Z(SBox_inst_l[52]) );
  XOR2_X1 SBox_inst_XOR_L26_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_l[15]), .B(SBox_inst_l[19]), .Z(SBox_inst_l[53]) );
  XOR2_X1 SBox_inst_XOR_L27_gen_out__layer0_xor_U1 ( .A(SBox_inst_l[16]), .B(
        SBox_inst_l[20]), .Z(SBox_inst_l[54]) );
  XOR2_X1 SBox_inst_XOR_L27_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_l[17]), .B(SBox_inst_l[21]), .Z(SBox_inst_l[55]) );
  XOR2_X1 SBox_inst_XOR_L28_gen_out__layer0_xor_U1 ( .A(SBox_inst_l[22]), .B(
        SBox_inst_l[28]), .Z(SBox_inst_l[56]) );
  XOR2_X1 SBox_inst_XOR_L28_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_l[23]), .B(SBox_inst_l[29]), .Z(SBox_inst_l[57]) );
  XOR2_X1 SBox_inst_XOR_L29_gen_out__layer0_xor_U1 ( .A(SBox_inst_l[22]), .B(
        SBox_inst_l[34]), .Z(SBox_inst_l[58]) );
  XOR2_X1 SBox_inst_XOR_L29_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_l[23]), .B(SBox_inst_l[35]), .Z(SBox_inst_l[59]) );
  XOR2_X1 SBox_inst_XOR_S00_gen_out__layer0_xor_U1 ( .A(SBox_inst_l[12]), .B(
        SBox_inst_l[48]), .Z(SBox_inst_sboxOutput_7__0_) );
  XOR2_X1 SBox_inst_XOR_S00_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_l[13]), .B(SBox_inst_l[49]), .Z(z[15]) );
  XNOR2_X1 SBox_inst_XNOR_S01_gen_out_inv__layer0_xnor_U1 ( .A(SBox_inst_l[32]), .B(SBox_inst_l[52]), .ZN(SBox_inst_sboxOutput_6__0_) );
  XOR2_X1 SBox_inst_XNOR_S01_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_l[33]), .B(SBox_inst_l[53]), .Z(z[13]) );
  XNOR2_X1 SBox_inst_XNOR_S02_gen_out_inv__layer0_xnor_U1 ( .A(SBox_inst_l[38]), .B(SBox_inst_l[56]), .ZN(SBox_inst_sboxOutput_5__0_) );
  XOR2_X1 SBox_inst_XNOR_S02_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_l[39]), .B(SBox_inst_l[57]), .Z(z[11]) );
  XOR2_X1 SBox_inst_XOR_S03_gen_out__layer0_xor_U1 ( .A(SBox_inst_l[12]), .B(
        SBox_inst_l[42]), .Z(SBox_inst_sboxOutput_4__0_) );
  XOR2_X1 SBox_inst_XOR_S03_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_l[13]), .B(SBox_inst_l[43]), .Z(z[9]) );
  XOR2_X1 SBox_inst_XOR_S04_gen_out__layer0_xor_U1 ( .A(SBox_inst_l[40]), .B(
        SBox_inst_l[44]), .Z(SBox_inst_sboxOutput_3__0_) );
  XOR2_X1 SBox_inst_XOR_S04_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_l[41]), .B(SBox_inst_l[45]), .Z(z[7]) );
  XOR2_X1 SBox_inst_XOR_S05_gen_out__layer0_xor_U1 ( .A(SBox_inst_l[50]), .B(
        SBox_inst_l[58]), .Z(SBox_inst_sboxOutput_2__0_) );
  XOR2_X1 SBox_inst_XOR_S05_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_l[51]), .B(SBox_inst_l[59]), .Z(z[5]) );
  XNOR2_X1 SBox_inst_XNOR_S06_gen_out_inv__layer0_xnor_U1 ( .A(SBox_inst_l[26]), .B(SBox_inst_l[54]), .ZN(SBox_inst_sboxOutput_1__0_) );
  XOR2_X1 SBox_inst_XNOR_S06_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_l[27]), .B(SBox_inst_l[55]), .Z(z[3]) );
  XNOR2_X1 SBox_inst_XNOR_S07_gen_out_inv__layer0_xnor_U1 ( .A(SBox_inst_l[12]), .B(SBox_inst_l[46]), .ZN(SBox_inst_sboxOutput_0__0_) );
  XOR2_X1 SBox_inst_XNOR_S07_loop_gen_layer__1__xor_inst_U1 ( .A(
        SBox_inst_l[13]), .B(SBox_inst_l[47]), .Z(z[1]) );
endmodule

