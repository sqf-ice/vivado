set_property SRC_FILE_INFO {cfile:c:/Graduate/PCIe/Turbo/pcie_turbo_debug/pcie_turbo.srcs/sources_1/ip/clk_wiz_250_100/clk_wiz_250_100.xdc rfile:../../../pcie_turbo.srcs/sources_1/ip/clk_wiz_250_100/clk_wiz_250_100.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.04
