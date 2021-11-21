ungroup -all -flatten
change_names -hierarchy -rules verilog
write_sdf ../netlist/FIR_unfolded.sdf
write -f verilog -hierarchy -output ../netlist/FIR_unfolded.v
write_sdc ../netlist/FIR_unfolded.sdc
exit
