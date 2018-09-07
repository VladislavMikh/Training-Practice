
`timescale 1ns/ 100ps
module mux
	((* altera_attribute = "-name IO_STANDARD \"2.5V\"",              chip_pin = "64" *)
	input pba,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"",     chip_pin = "88,89,90,91,49,46,25,24" *)
	input [7:0]sw,
	(* altera_attribute = "-name IO_STANDARD \"2.5V\"", useioff = 1, chip_pin = "65,66,67,68,69,70,71,72" *)
	output [3:0]led);
	
	wire[3:0] s0,s1,s2;
	
	// assign led = ({4{pba}} & sw[7:4]) | ({4{~pba}} & sw[3:0]);
	
	not inverter [3:0] (s0,pba);
	
	and first  [3:0] (s1,sw[7:4],pba);
	and second [3:0] (s2,sw[3:0],s0);
	
	or chooser [3:0] (led,s1,s2);
	
	endmodule 