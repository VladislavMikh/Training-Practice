
`timescale 1ns/ 100ps
module b2bd 

	((* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"",     chip_pin = "49,46,25,24" *)
	input [3:0]sw,
	(* altera_attribute = "-name IO_STANDARD \"2.5V\"", useioff = 1, chip_pin = "65,66,67,68,69,70,71,72" *)
	output reg [7:0]led);
	
	// можно через for 2 -> 10.  for 10 -> 2-10. Но в лоб через case никто не запрещал
always @*
begin
	case (sw)
		4'd0  : led = 8'b00000000;
		4'd1  : led = 8'b00000001;
		4'd2  : led = 8'b00000010;
		4'd3  : led = 8'b00000011;
		4'd4  : led = 8'b00000100;
		4'd5  : led = 8'b00000101;
		4'd6  : led = 8'b00000110;
		4'd7  : led = 8'b00000111;
		4'd8  : led = 8'b00001000;
		4'd9  : led = 8'b00001001;
		4'd10 : led = 8'b00010000;
		4'd11 : led = 8'b00010001;
		4'd12 : led = 8'b00010010;
		4'd13 : led = 8'b00010011;
		4'd14 : led = 8'b00010100;
		4'd15 : led = 8'b00010101;
	 default : led = 8'b11111111;
	endcase
end
endmodule 	