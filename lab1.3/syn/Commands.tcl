analyze -f vhdl -lib WORK ./oneD.vhd
analyze -f vhdl -lib WORK ./twoD.vhd
analyze -f vhdl -lib WORK ./threeD.vhd
analyze -f vhdl -lib WORK ./fourD.vhd
analyze -f vhdl -lib WORK ./mul.vhd
analyze -f vhdl -lib WORK ./sum.vhd
analyze -f vhdl -lib WORK ./FIR_unfolded.vhd
set power_preserve_rtl_hier_names true
elaborate FIR_unfolded -arch behavioral -lib WORK
create_clock -name MY_CLK -period 6.6 clk
set_clock_uncertainty 0.07 [get_clocks MY_CLK]
set_input_delay 0.5 -max -clock MY_CLK [remove_from_collection [all_inputs] clk]
set_output_delay 0.5 -max -clock MY_CLK [all_outputs]
set OLOAD [load_of NangateOpenCellLibrary/BUF_X4/A]
set_load $OLOAD [all_outputs]
compile
report_timing > timing_quarter_fm.txt
report_area > area_quarter_fm.txt
