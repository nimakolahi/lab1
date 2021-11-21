source /software/scripts/init_msim6.2g
vcom -93 -work ./work ./data_sink.vhd
vcom -93 -work ./work ./clk_gen.vhd
vcom -93 -work ./work ./data_maker_new.vhd
vcom -93 -work ./work ./oneD.vhd
vcom -93 -work ./work ./twoD.vhd
vcom -93 -work ./work ./threeD.vhd
vcom -93 -work ./work ./fourD.vhd
vcom -93 -work ./work ./sum.vhd
vcom -93 -work ./work ./mul.vhd
vlog -work ./work ../innovus/FIR_unfolded.v
vlog -work ./work ./tb_fir.v
#vsim -L /software/dk/nangate45/verilog/msim6.2g
vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp /tb_fir/UUT=../innovus/FIR_unfolded.sdf work.tb_fir
#vcd file ../vcd/FIR_unfolded_routed_quarter_fm.vcd
#vcd add /tb_fir/UUT/*
#run 0.8 us
#vcd2saif -input ../vcd/FIR_unfolded_routed_quarter_fm.vcd -output ../saif/FIR_unfolded_syn_quarter_fm.saif
