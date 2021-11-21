source /software/scripts/init_msim6.2g
vlib work
vcom -93 -work ./work ./data_sink.vhd
vcom -93 -work ./work ./clk_gen.vhd
vcom -93 -work ./work ./data_maker_new.vhd
#vcom -93 -work ./work ./combiner.vhd
#vcom -93 -work ./work ./splitter.vhd
vcom -93 -work ./work ./oneD.vhd
vcom -93 -work ./work ./twoD.vhd
vcom -93 -work ./work ./threeD.vhd
vcom -93 -work ./work ./fourD.vhd
vcom -93 -work ./work ./mul.vhd
vcom -93 -work ./work ./sum.vhd

vcom -93 -work ./work ./FIR_unfolded.vhd
#vcom -93 -work ./work ./FIR.vhd
vlog -work ./work ./tb_fir.v

#vsim work.tb_fir &
#vsim &
