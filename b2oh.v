
/* преобразователь N-х разрядного двоичного кода в позиционный код
 значение по умолчанию N=8
*/

`timescale 1 ns/ 100 ps
module b2oh 

	#(parameter WIDTH = 8)
	
	((* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"",     chip_pin = "88,89,90,91,49,46,25,24" *)
	input [WIDTH-1:0] datain,
	
	(* altera_attribute = "-name IO_STANDARD \"2.5V\"", useioff = 1, chip_pin = "65,66,67,68,69,70,71,72" *)
	output reg [7:0] dataout);
	
always @*
	dataout = {{WIDTH-1{1'b0}}, 1'b1} << datain;
	
endmodule
