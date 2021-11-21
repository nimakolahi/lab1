//`timescale 1ns


module tb_fir ();

   wire CLK_i;
   wire RST_n_i;
   wire [7:0] DIN_i;
   wire VIN_i;
   wire [7:0] DOUT_i;
   wire VOUT_i;
   wire END_SIM_i;

   data_sink DS(.CLK(CLK_i),
		.RST_n(RST_n_i),
		.VIN(VOUT_i),
		.DIN(DOUT_i),
		.END_SIM(END_SIM_i));   

   clk_gen CG(.END_SIM(END_SIM_i),
  	      .CLK(CLK_i),
	      .RST_n(RST_n_i));

   data_maker SM(.CLK(CLK_i),
	         .RST_n(RST_n_i),
		 .VOUT(VIN_i),
		 .DOUT(DIN_i),
		 .END_SIM(END_SIM_i));

   FIR UUT(.din(DIN_i),
             .vin(VIN_i),
			 .rst(RST_n_i),
			 .clk(CLK_i),
             .dout(DOUT_i),
             .vout(VOUT_i));

always @(posedge END_SIM_i) begin
$finish;
end
endmodule

		   
