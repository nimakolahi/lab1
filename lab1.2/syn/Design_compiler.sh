mkdir WORK
source /software/scripts/init_synopsys_64.18
dc_shell-xg-t -f Commands.tcl
#dc_shell-xg-t -f switching_activity.tcl
#read_verilog -netlist ../netlist/FIR.v
#read_saif -input ../saif/FIR_syn_fm_over4.saif -instance tb_fir/UUT -unit ns -scale 1
#create_clock -name MY_CLK clk
#report_power > power.txt
