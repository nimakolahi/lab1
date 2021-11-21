source /software/scripts/init_msim6.2g
vlib work
vcom -93 -work ./work ./data_sink.vhd
vcom -93 -work ./work ./clk_gen.vhd
vcom -93 -work ./work ./data_maker_new.vhd

#vcom -93 -work ./work ./FIR.vhd
vlog -work ./work ./tb_fir.v

#vsim work.tb_fir &
#vsim &
