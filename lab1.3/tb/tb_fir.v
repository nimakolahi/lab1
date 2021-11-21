//`timescale 1ns


module tb_fir ();

   wire CLK_i;
   wire RST_n_i;
   wire [7:0] DIN_i;
   wire [7:0] DIN_j;
   wire [7:0] DIN_k;
   wire VIN_i;
   wire [7:0] DOUT_i;
   wire [7:0] DOUT_j;
   wire [7:0] DOUT_k;
   wire VOUT_i;
   wire END_SIM_i;

   data_sink DS(.CLK(CLK_i),
		.RST_n(RST_n_i),
		.VIN(VOUT_i),
		.DIN(DOUT_i),
		.DIN1(DOUT_j),
		.DIN2(DOUT_k));   

   clk_gen CG(.END_SIM(END_SIM_i),
  	      .CLK(CLK_i),
	      .RST_n(RST_n_i));

   data_maker SM(.CLK(CLK_i),
	         .RST_n(RST_n_i),
		 .VOUT(VIN_i),
		 .DOUT(DIN_i),
		 .DOUT1(DIN_j),
		 .DOUT2(DIN_k),
		 .END_SIM(END_SIM_i));

   FIR_unfolded UUT(.end_sim_i(END_SIM_i),
			.din(DIN_i),
			 .din1(DIN_j),
			 .din2(DIN_k),
           .vin(VIN_i),
			 .rst(RST_n_i),
			 .clk(CLK_i),
           .dout(DOUT_i),
           .dout1(DOUT_j),
           .dout2(DOUT_k),
           .vout(VOUT_i));


always @(posedge END_SIM_i) begin
$finish;
end
endmodule

		   
