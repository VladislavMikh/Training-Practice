
`timescale 1ns/ 100ps
module dmux
	((* altera_attribute = "-name IO_STANDARD \"2.5V\"",             chip_pin = "64" *)
	input pba,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"",      chip_pin = "49,46,25,24" *)
	input [3:0]sw,
	(* altera_attribute = "-name IO_STANDARD \"2.5V\"", useioff = 1, chip_pin = "65,66,67,68,69,70,71,72" *)
	output [7:0]led);
	
	wire [3:0] s0;
	
	// assign led[7:4] = {4{pba}} & sw[3:0];
	// assign led[3:0] = {4{~pba}} & sw[3:0];
	
	not inverter [3:0] (s0,pba);
	and first [7:4] (led[7:4],sw,pba);
	and second [3:0] (led[3:0],sw,s0);
	endmodule 