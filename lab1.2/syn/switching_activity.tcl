ungroup -all -flatten
change_names -hierarchy -rules verilog
write_sdf ../netlist/FIR.sdf
write -f verilog -hierarchy -output ../netlist/FIR.v
write_sdc ../netlist/FIR.sdc
exit
