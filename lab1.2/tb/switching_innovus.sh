source /software/scripts/init_msim6.2g
vcom -93 -work ./work ./data_sink.vhd
vcom -93 -work ./work ./clk_gen.vhd
vcom -93 -work ./work ./data_maker_new.vhd
vlog -work ./work ../innovus/FIR.v
vlog -work ./work ./tb_fir.v
vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp /tb_fir/UUT=../innovus/FIR.sdf work.tb_fir
#vcd file ../vcd/FIR_syn_routed_fm_over4.vcd
#vcd add /tb_fir/UUT/*
#run 2.4 us
#vcd2saif -input ../vcd/FIR_syn_routed_fm_over4.vcd -output ../saif/FIR_syn_routed_fm_over4.saif
