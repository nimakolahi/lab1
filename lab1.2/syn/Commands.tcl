analyze -f vhdl -lib WORK ../tb/FIR.vhd
set power_preserve_rtl_hier_names true
elaborate FIR -arch behavioral -lib WORK
create_clock -name MY_CLK -period 1.75 clk
set_clock_uncertainty 0.07 [get_clocks MY_CLK]
set_input_delay 0.5 -max -clock MY_CLK [remove_from_collection [all_inputs] clk]
set_output_delay 0.5 -max -clock MY_CLK [all_outputs]
set OLOAD [load_of NangateOpenCellLibrary/BUF_X4/A]
set_load $OLOAD [all_outputs]
compile
report_timing > timing_fm.txt
report_area > area_fm.txt
