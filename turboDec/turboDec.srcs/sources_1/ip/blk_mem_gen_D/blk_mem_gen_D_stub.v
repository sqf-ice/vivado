// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
// Date        : Thu Nov 17 16:29:02 2016
// Host        : DESKTOP-I4NLUVV running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               f:/projects/vivado/turboDec/turboDec.srcs/sources_1/ip/blk_mem_gen_D/blk_mem_gen_D_stub.v
// Design      : blk_mem_gen_D
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_2,Vivado 2015.2" *)
module blk_mem_gen_D(clka, ena, wea, addra, dina, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[10:0],dina[63:0],clkb,enb,addrb[10:0],doutb[63:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [10:0]addra;
  input [63:0]dina;
  input clkb;
  input enb;
  input [10:0]addrb;
  output [63:0]doutb;
endmodule
