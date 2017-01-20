# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7vx690tffg1157-2

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/Xiaoshi/Documents/Graduate/PCIe/Turbo/pcie_turbo_debug/pcie_turbo.cache/wt [current_project]
set_property parent.project_path C:/Users/Xiaoshi/Documents/Graduate/PCIe/Turbo/pcie_turbo_debug/pcie_turbo.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_ip C:/Users/Xiaoshi/Documents/Graduate/PCIe/Turbo/pcie_turbo_debug/pcie_turbo.srcs/sources_1/ip/PCIeGen2x8If128_1/PCIeGen2x8If128.xci
set_property used_in_implementation false [get_files -all c:/Users/Xiaoshi/Documents/Graduate/PCIe/Turbo/pcie_turbo_debug/pcie_turbo.srcs/sources_1/ip/PCIeGen2x8If128_1/PCIeGen2x8If128.dcp]
set_property is_locked true [get_files C:/Users/Xiaoshi/Documents/Graduate/PCIe/Turbo/pcie_turbo_debug/pcie_turbo.srcs/sources_1/ip/PCIeGen2x8If128_1/PCIeGen2x8If128.xci]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
synth_design -top PCIeGen2x8If128 -part xc7vx690tffg1157-2 -mode out_of_context
rename_ref -prefix_all PCIeGen2x8If128_
write_checkpoint -noxdef PCIeGen2x8If128.dcp
catch { report_utilization -file PCIeGen2x8If128_utilization_synth.rpt -pb PCIeGen2x8If128_utilization_synth.pb }
if { [catch {
  file copy -force C:/Users/Xiaoshi/Documents/Graduate/PCIe/Turbo/pcie_turbo_debug/pcie_turbo.runs/PCIeGen2x8If128_synth_1/PCIeGen2x8If128.dcp C:/Users/Xiaoshi/Documents/Graduate/PCIe/Turbo/pcie_turbo_debug/pcie_turbo.srcs/sources_1/ip/PCIeGen2x8If128_1/PCIeGen2x8If128.dcp
} _RESULT ] } { 
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}
if { [catch {
  write_verilog -force -mode synth_stub C:/Users/Xiaoshi/Documents/Graduate/PCIe/Turbo/pcie_turbo_debug/pcie_turbo.srcs/sources_1/ip/PCIeGen2x8If128_1/PCIeGen2x8If128_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}
if { [catch {
  write_vhdl -force -mode synth_stub C:/Users/Xiaoshi/Documents/Graduate/PCIe/Turbo/pcie_turbo_debug/pcie_turbo.srcs/sources_1/ip/PCIeGen2x8If128_1/PCIeGen2x8If128_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}
if { [catch {
  write_verilog -force -mode funcsim C:/Users/Xiaoshi/Documents/Graduate/PCIe/Turbo/pcie_turbo_debug/pcie_turbo.srcs/sources_1/ip/PCIeGen2x8If128_1/PCIeGen2x8If128_funcsim.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}
if { [catch {
  write_vhdl -force -mode funcsim C:/Users/Xiaoshi/Documents/Graduate/PCIe/Turbo/pcie_turbo_debug/pcie_turbo.srcs/sources_1/ip/PCIeGen2x8If128_1/PCIeGen2x8If128_funcsim.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}
