###################################################################

# Created by write_sdc on Thu Nov 18 19:14:44 2021

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
set_load -pin_load 3.40189 [get_ports vout]
create_clock [get_ports clk]  -name MY_CLK  -period 7  -waveform {0 3.5}
set_clock_uncertainty 0.07  [get_clocks MY_CLK]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[7]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[6]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[5]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[4]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[3]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[2]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[1]}]
set_input_delay -clock MY_CLK  -max 0.5  [get_ports {din[0]}]
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
set_output_delay -clock MY_CLK  -max 0.5  [get_ports vout]
