//-----------------------------------------------------------------------------
//
// (c) Copyright 2012-2012 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
//-----------------------------------------------------------------------------
//
// Project    : Virtex-7 FPGA Gen3 Integrated Block for PCI Express
// File       : PCIeGen2x8If128_pcie_tlp_tph_tbl_7vx.v
// Version    : 4.0
//----------------------------------------------------------------------------//
// Project      : Virtex-7 FPGA Gen3 Integrated Block for PCI Express         //
// Filename     : PCIeGen2x8If128_pcie_tlp_tph_tbl_7vx.v                                      //
// Description  : Implements the TLP TPH Processing Hints Table for the       //
//                Virtex-7 FPGA Gen3 Integrated Block for PCI Express         //
//---------- PIPE Wrapper Hierarchy ------------------------------------------//
//  pcie_tlp_tph_tbl_7vx.v                                                    //
//----------------------------------------------------------------------------//

`timescale 1ps/1ps

module PCIeGen2x8If128_pcie_tlp_tph_tbl_7vx #
(
  parameter TCQ =  100
) (
  input         user_clk,                       // User Clock
  input         reset_n,                        // Warm, Hot Reset, active low

  input   [4:0] cfg_tph_stt_address_i,          // Address
  input   [2:0] cfg_tph_function_num_i,         // Function #
  input  [31:0] cfg_tph_stt_write_data_i,	      // Write Data
  input         cfg_tph_stt_write_enable_i,	    // Write Data Enable
  input   [3:0] cfg_tph_stt_write_byte_valid_i, // WBE
  output [31:0] cfg_tph_stt_read_data_o,        // Read Data
  input         cfg_tph_stt_read_enable_i,      // Read Data Enable
  output        cfg_tph_stt_read_data_valid_o,	// Read Data Valid

  input   [4:0] user_tph_stt_address_i,         // Address
  input   [2:0] user_tph_function_num_i,        // Function #
  input         user_tph_stt_read_enable_i,     // Read Enable
  output [31:0] user_tph_stt_read_data_o,       // Read Data
  output        user_tph_stt_read_data_valid_o  // Read Data Valid

);



  // Local Registers

  reg                 reg_cfg_tph_stt_read_data_valid_o;
  reg                 reg_user_tph_stt_read_data_valid_o;
  reg [7:0]           reg_count;
  reg                 reg_state = 1'b0; // on cold reset
  reg                 reg_next_state = 1'b0; // on cold reset
  reg                 reg_web;
  reg                 reg_cfg_tph_stt_read_enable_i;
  reg                 reg_user_tph_stt_read_enable_i;

  // Local Wires

  wire                N0, N1;
  wire  [3:0]         wea;
  wire                web;
  wire  [7:0]         addra, addrb;
  wire [31:0]         dina;
  wire [31:0]         dinb;
  wire  [7:0]         count_w;
  wire                ram_scrub_in_process_w;
  wire                state_w;
  wire                next_state_w;
  wire [31:0]         douta;
  wire [31:0]         doutb;

  // cfg_tph_stt_read_data_valid_o generation
  always @ (posedge user_clk or negedge reset_n) begin

    if (!reset_n) begin
      reg_cfg_tph_stt_read_data_valid_o   <= #TCQ 1'b0;
      reg_cfg_tph_stt_read_enable_i       <= #TCQ 1'b0;
    end else begin
      if (cfg_tph_stt_read_enable_i && reg_cfg_tph_stt_read_enable_i &&
          !reg_cfg_tph_stt_read_data_valid_o && !ram_scrub_in_process_w) begin
        reg_cfg_tph_stt_read_data_valid_o <= #TCQ 1'b1;
      end else begin
        reg_cfg_tph_stt_read_data_valid_o <= #TCQ 1'b0;
      end
      reg_cfg_tph_stt_read_enable_i       <= #TCQ cfg_tph_stt_read_enable_i;
    end
  end

  // user_tph_stt_read_data_valid_o generation
  always @ (posedge user_clk or negedge reset_n) begin

    if (!reset_n) begin
      reg_user_tph_stt_read_data_valid_o    <= #TCQ 1'b0;
      reg_user_tph_stt_read_enable_i       <= #TCQ 1'b0;
    end else begin
      if (user_tph_stt_read_enable_i && reg_user_tph_stt_read_enable_i &&
          !reg_user_tph_stt_read_data_valid_o && !ram_scrub_in_process_w) begin
        reg_user_tph_stt_read_data_valid_o <= #TCQ 1'b1;
      end else begin
        reg_user_tph_stt_read_data_valid_o <= #TCQ 1'b0;
      end
      reg_user_tph_stt_read_enable_i       <= #TCQ user_tph_stt_read_enable_i;
    end
  end

  // RAM scrub

  always @ (posedge user_clk) begin

    reg_state <= #(TCQ) next_state_w;

    if (state_w) begin
      reg_count <= #(TCQ) count_w + 1'b1;
    end else begin
      reg_count <= #(TCQ) 8'b0;
    end
  end

  always @ ( * ) begin

    case(state_w)

      1'b0 :
      begin
        if (!reset_n) begin
          reg_next_state = 1'b1;
        end else begin
          reg_next_state = 1'b0;
        end
      end

      1'b1 :
      begin
        if (count_w == 8'hFF) begin
          reg_next_state = 1'b0;
        end else begin
          reg_next_state = 1'b1;
        end
      end
    endcase
  end

  RAMB36E1 #(
    .DOA_REG ( 1 ),
    .DOB_REG ( 0 ),
    .EN_ECC_READ ( "FALSE" ),
    .EN_ECC_WRITE ( "FALSE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_08 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_09 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_0F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_10 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_11 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_12 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_13 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_14 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_15 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_16 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_17 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_18 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_19 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_1F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_20 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_21 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_22 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_23 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_24 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_25 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_26 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_27 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_28 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_29 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_30 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_31 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_32 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_33 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_34 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_35 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_36 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_37 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_38 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_39 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_40 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_41 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_42 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_43 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_44 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_45 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_46 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_47 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_48 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_49 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_4F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_50 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_51 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_52 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_53 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_54 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_55 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_56 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_57 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_58 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_59 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_5F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_60 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_61 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_62 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_63 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_64 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_65 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_66 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_67 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_68 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_69 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_6F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_70 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_71 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_72 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_73 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_74 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_75 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_76 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_77 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_78 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_79 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_7F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INIT_FILE ( "NONE" ),
    .RAM_EXTENSION_A ( "NONE" ),
    .RAM_EXTENSION_B ( "NONE" ),
    .RAM_MODE ( "TDP" ),
    .RDADDR_COLLISION_HWCONFIG ( "DELAYED_WRITE" ),
    .READ_WIDTH_A ( 36 ),
    .READ_WIDTH_B ( 36 ),
    .RSTREG_PRIORITY_A ( "REGCE" ),
    .RSTREG_PRIORITY_B ( "REGCE" ),
    .SIM_COLLISION_CHECK ( "GENERATE_X_ONLY" ),
    .SIM_DEVICE ( "7SERIES" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ),
    .WRITE_WIDTH_A ( 36 ),
    .WRITE_WIDTH_B ( 36 ))
  u_ram  (
    .CASCADEINA(N1),
    .CASCADEINB(N1),
    .CASCADEOUTA () ,
    .CASCADEOUTB () ,
    .CLKARDCLK(user_clk),
    .CLKBWRCLK(user_clk),
    .DBITERR ( ) ,
    .ENARDEN(N0),
    .ENBWREN(N0),
    .INJECTDBITERR(N1),
    .INJECTSBITERR(N1),
    .REGCEAREGCE(N0),
    .REGCEB(N1),
    .RSTRAMARSTRAM(N1),
    .RSTRAMB(N1),
    .RSTREGARSTREG(N1),
    .RSTREGB(N1),
    .SBITERR ( ) ,
    .ADDRARDADDR({N0, N1, N1, addra[7:0], N1, N1, N1, N1, N1}),
    .ADDRBWRADDR({N0, N1, N1, addrb[7:0], N1, N1, N1, N1, N1}),
    .DIADI({dina[31:0]}),
    .DIBDI({dinb[31:0]}),
    .DIPADIP({N1, N1, N1, N1}),
    .DIPBDIP({N1, N1, N1, N1}),
    .DOADO({douta[31:0]}),
    .DOBDO({doutb[31:0]}),
    .DOPADOP(),
    .DOPBDOP(),
    .ECCPARITY(),
    .RDADDRECC(),
    .WEA(wea[3:0]),
    .WEBWE({N1, N1, N1, N1, web, web, web, web})
  );

  assign addra                          = {cfg_tph_function_num_i, cfg_tph_stt_address_i};
  assign dina                           = cfg_tph_stt_write_data_i;
  assign wea[3]                         = cfg_tph_stt_write_enable_i && cfg_tph_stt_write_byte_valid_i[3];
  assign wea[2]                         = cfg_tph_stt_write_enable_i && cfg_tph_stt_write_byte_valid_i[2];
  assign wea[1]                         = cfg_tph_stt_write_enable_i && cfg_tph_stt_write_byte_valid_i[1];
  assign wea[0]                         = cfg_tph_stt_write_enable_i && cfg_tph_stt_write_byte_valid_i[0];
  assign cfg_tph_stt_read_data_o        = douta;
  assign cfg_tph_stt_read_data_valid_o  = reg_cfg_tph_stt_read_data_valid_o;
  assign N0                             = 1'b1;
  assign N1                             = 1'b0;
  assign ram_scrub_in_process_w         = state_w;
  assign count_w                        = reg_count;
  assign state_w                        = reg_state;
  assign next_state_w                   = reg_next_state;
  assign dinb                           = 32'b0;
  assign web                            = reg_next_state;
  assign user_tph_stt_read_data_o       = doutb;
  assign user_tph_stt_read_data_valid_o = reg_user_tph_stt_read_data_valid_o;
  assign addrb                          = ram_scrub_in_process_w ? count_w : {user_tph_function_num_i, user_tph_stt_address_i};

endmodule // pcie_tlp_tph_tbl_7vx
