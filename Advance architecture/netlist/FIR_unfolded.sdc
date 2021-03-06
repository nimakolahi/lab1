###################################################################

# Created by write_sdc on Sun Nov 21 05:18:55 2021

###################################################################
set sdc_version 2.1

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
set_load -pin_load 3.40189 [get_ports {dout[7]}]
set_load -pin_load 3.40189 [get_ports {dout[6]}]
set_load -pin_load 3.40189 [get_ports {dout[5]}]
set_load -pin_load 3.40189 [get_ports {dout[4]}]
set_load -pin_load 3.40189 [get_ports {dout[3]}]
set_load -pin_load 3.40189 [get_ports {dout[2]}]
set_load -pin_load 3.40189 [get_ports {dout[1]}]
set_load -pin_load 3.40189 [get_ports {dout[0]}]
set_load -pin_load 3.40189 [get_ports {dout1[7]}]
set_load -pin_load 3.40189 [get_ports {dout1[6]}]
set_load -pin_load 3.40189 [get_ports {dout1[5]}]
set_load -pin_load 3.40189 [get_ports {dout1[4]}]
set_load -pin_load 3.40189 [get_ports {dout1[3]}]
set_load -pin_load 3.40189 [get_ports {dout1[2]}]
set_load -pin_load 3.40189 [get_ports {dout1[1]}]
set_load -pin_load 3.40189 [get_ports {dout1[0]}]
set_load -pin_load 3.40189 [get_ports {dout2[7]}]
set_load -pin_load 3.40189 [get_ports {dout2[6]}]
set_load -pin_load 3.40189 [get_ports {dout2[5]}]
set_load -pin_load 3.40189 [get_ports {dout2[4]}]
set_load -pin_load 3.40189 [get_ports {dout2[3]}]
set_load -pin_load 3.40189 [get_ports {dout2[2]}]
set_load -pin_load 3.40189 [get_ports {dout2[1]}]
set_load -pin_load 3.40189 [get_ports {dout2[0]}]
set_load -pin_load 3.40189 [get_ports vout]
create_clock [get_ports clk]  -name MY_CLK  -period 6.6  -waveform {0 3.3}
set_clock_uncertainty 0.07  [get_clocks MY_CLK]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports end_sim_i]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[7]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[6]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[5]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[4]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[3]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[2]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[1]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[0]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din1[7]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din1[6]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din1[5]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din1[4]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din1[3]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din1[2]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din1[1]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din1[0]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din2[7]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din2[6]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din2[5]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din2[4]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din2[3]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din2[2]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din2[1]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din2[0]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports vin]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports rst]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout[7]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout[6]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout[5]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout[4]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout[3]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout[2]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout[1]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout[0]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout1[7]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout1[6]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout1[5]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout1[4]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout1[3]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout1[2]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout1[1]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout1[0]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout2[7]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout2[6]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout2[5]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout2[4]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout2[3]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout2[2]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout2[1]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports {dout2[0]}]
set_output_delay -clock MY_CLK  -max 0.5  [get_ports vout]
