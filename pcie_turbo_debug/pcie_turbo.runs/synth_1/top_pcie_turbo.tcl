# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7vx690tffg1157-2

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir F:/projects/vivado/pcie_turbo_debug/pcie_turbo.cache/wt [current_project]
set_property parent.project_path F:/projects/vivado/pcie_turbo_debug/pcie_turbo.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
add_files -quiet F:/projects/vivado/pcie_turbo_debug/pcie_turbo.runs/PCIeGen2x8If128_synth_1/PCIeGen2x8If128.dcp
set_property used_in_implementation false [get_files F:/projects/vivado/pcie_turbo_debug/pcie_turbo.runs/PCIeGen2x8If128_synth_1/PCIeGen2x8If128.dcp]
add_files -quiet F:/projects/vivado/pcie_turbo_debug/pcie_turbo.runs/crc_blk_mem_1w_8w_synth_1/crc_blk_mem_1w_8w.dcp
set_property used_in_implementation false [get_files F:/projects/vivado/pcie_turbo_debug/pcie_turbo.runs/crc_blk_mem_1w_8w_synth_1/crc_blk_mem_1w_8w.dcp]
add_files -quiet F:/projects/vivado/pcie_turbo_debug/pcie_turbo.runs/clk_wiz_250_100_synth_1/clk_wiz_250_100.dcp
set_property used_in_implementation false [get_files F:/projects/vivado/pcie_turbo_debug/pcie_turbo.runs/clk_wiz_250_100_synth_1/clk_wiz_250_100.dcp]
add_files -quiet F:/projects/vivado/pcie_turbo_debug/pcie_turbo.runs/blk_mem_gen_synth_1/blk_mem_gen.dcp
set_property used_in_implementation false [get_files F:/projects/vivado/pcie_turbo_debug/pcie_turbo.runs/blk_mem_gen_synth_1/blk_mem_gen.dcp]
add_files -quiet F:/projects/vivado/pcie_turbo_debug/pcie_turbo.runs/blk_mem_gen_tail_synth_1/blk_mem_gen_tail.dcp
set_property used_in_implementation false [get_files F:/projects/vivado/pcie_turbo_debug/pcie_turbo.runs/blk_mem_gen_tail_synth_1/blk_mem_gen_tail.dcp]
add_files -quiet F:/projects/vivado/pcie_turbo_debug/pcie_turbo.runs/ila_turbo_wrapper_synth_1/ila_turbo_wrapper.dcp
set_property used_in_implementation false [get_files F:/projects/vivado/pcie_turbo_debug/pcie_turbo.runs/ila_turbo_wrapper_synth_1/ila_turbo_wrapper.dcp]
add_files -quiet F:/projects/vivado/pcie_turbo_debug/pcie_turbo.runs/dist_mem_gen_D_synth_1/dist_mem_gen_D.dcp
set_property used_in_implementation false [get_files F:/projects/vivado/pcie_turbo_debug/pcie_turbo.runs/dist_mem_gen_D_synth_1/dist_mem_gen_D.dcp]
read_verilog {
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/functions.vh
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Input_parameters.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/widths.vh
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/trellis.vh
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/types.vh
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/schedules.vh
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/ultrascale.vh
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tlp.vh
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/riffa.vh
}
set_property file_type "Verilog Header" [get_files F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Input_parameters.v]
read_verilog -library xil_defaultlib {
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/shiftreg.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/scsdpram.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/fifo.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/ff.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_MaxFunction.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/syncff.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/rotate.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/ram_2clk_1w_1r.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/ram_1clk_1w_1r.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/pipeline.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/one_hot_mux.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/offset_to_mask.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/offset_flag_to_one_hot.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_Shift_Reg8.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_multiply_opt.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_Max8_Function.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_data_shift.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_data_fifo.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/sync_fifo.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/mux.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/cross_domain_signal.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/counter.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/async_fifo.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_sysAddLePar_Compute.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_LLR.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_Interleave.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_Deinterleave.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_Butterfly.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_AddrCal1Step.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_port_writer.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_port_monitor_64.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_port_monitor_32.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_port_monitor_128.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_port_channel_gate_64.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_port_channel_gate_32.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_port_channel_gate_128.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_port_buffer_64.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_port_buffer_32.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_port_buffer_128.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_hdr_fifo.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_data_pipeline.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_alignment_pipeline.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/sg_list_requester.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/sg_list_reader_64.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/sg_list_reader_32.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/sg_list_reader_128.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/rx_port_requester_mux.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/rx_port_reader.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/rx_port_channel_gate.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/fifo_packer_64.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/fifo_packer_32.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/fifo_packer_128.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/async_fifo_fwft.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_SelectBUF_3BUF.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_SaveLeInitWriteAddr_3BUF.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_Reorder_writeEn_1.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_Reorder_writeEn_0.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_FPU.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_Distributed_Single_RAM.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_Distributed_Dual_RAM.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_CalcReadAddr.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_CalcLeWriteAddr_3BUF.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_CalcBufA_Addr.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_CalcBufAddr_3BUF.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_BPU.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_Block_Dual_RAM.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_3BUF_w.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_port_64.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_port_32.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_port_128.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_engine_selector.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_engine.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/rx_port_64.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/rx_port_32.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/rx_port_128.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/register.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/new/parallel_crc.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_SW_MAP_3BUF.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_LeBit_RAM.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_Init_Value.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_D_RAM.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_BPU_Tail.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_Block_ROM_Para_P8.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_Block_ROM_Para_P4.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_Addr_control.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_multiplexer_64.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_multiplexer_32.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_multiplexer_128.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/txr_engine_ultrascale.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/txr_engine_classic.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/txc_engine_ultrascale.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/txc_engine_classic.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/rxr_engine_ultrascale.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/rxr_engine_classic.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/rxc_engine_ultrascale.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/rxc_engine_classic.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/reorder_queue_output.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/reorder_queue_input.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/interrupt_controller.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/demux.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/channel_64.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/channel_32.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/channel_128.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/new/Turbo_CRC24.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_Subdecoder.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/Turbo_Decoder_Verilog/Modu_InputPara.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_multiplexer.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_engine_ultrascale.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/tx_engine_classic.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/rx_engine_ultrascale.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/rx_engine_classic.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/reorder_queue.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/registers.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/recv_credit_flow_ctrl.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/interrupt.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/channel.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/new/Modu_Decoder_New_CRC.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/new/TurboDecoderWrapper.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/riffa.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/engine_layer.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/riffa_wrapper_vc709.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/new/chnl_parallel_turbo_decoder.v
  F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/sources_1/imports/riffa_hdl/VC709Gen2x8If128.v
}
read_xdc F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/constrs_1/imports/new/alpha_data.xdc
set_property used_in_implementation false [get_files F:/projects/vivado/pcie_turbo_debug/pcie_turbo.srcs/constrs_1/imports/new/alpha_data.xdc]

synth_design -top top_pcie_turbo -part xc7vx690tffg1157-2
write_checkpoint -noxdef top_pcie_turbo.dcp
catch { report_utilization -file top_pcie_turbo_utilization_synth.rpt -pb top_pcie_turbo_utilization_synth.pb }
