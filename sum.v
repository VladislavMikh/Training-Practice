
// 4-разрядный сумматор с последовательным переносом. Всё-таки добавил отображение переноса (5ый светодиод на выход)

`timescale 1ns/ 100ps
module sum 

	#(parameter WIDTH = 8)
	
	((* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"",     chip_pin = "88,89,90,91" *)
	input [WIDTH-1:0]data_a,
	
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"",     chip_pin = "49,46,25,24" *)
	input [WIDTH-1:0]data_b,
	
	(* altera_attribute = "-name IO_STANDARD \"2.5V\"", useioff = 1, chip_pin = "68" *)
	output c_out,
	
	(* altera_attribute = "-name IO_STANDARD \"2.5V\"", useioff = 1, chip_pin = "69,70,71,72" *)
	output [WIDTH-1:0]sum);
	
	wire c0,c1,c2;

full_adder digit_0(.sum(sum[0]), .c_out(c0), .a(data_a[0]), .b(data_b[0]), .c_in(1'b0));
full_adder digit_1(.sum(sum[1]), .c_out(c1), .a(data_a[1]), .b(data_b[1]), .c_in(c0));	
full_adder digit_2(.sum(sum[2]), .c_out(c2), .a(data_a[2]), .b(data_b[2]), .c_in(c1));	
full_adder digit_3(.sum(sum[3]), .c_out(c_out), .a(data_a[3]), .b(data_b[3]), .c_in(c2));

endmodule


`timescale 1ns/ 100ps
module full_adder

	(input a,
	input b,
	input c_in,
	output c_out,
	output sum);
	
	wire s0,s1,s2;
	
xor (s0,a,b);
and (s1,c_in,s0);
and (s2,a,b);
xor (sum,s0,c_in);
xor (c_out,s1,s2);

endmodule

	