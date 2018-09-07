
`timescale 1ns/ 100ps
module tb1_sum ();
	reg [3:0]term1;
	reg [3:0]term2;
sum #(.WIDTH(4)) DUT (.data_a(term1), .data_b(term2));

initial begin
	term1 = 4'd15; term2 = 4'd15;
	#10;
	term1 = 4'd0; term2 = 4'd0;
	#10;
	term1 = 4'd6; term2 = 4'd5;
	#10;
	term1 = 4'd8; term2 = 4'd4;
	#10;
	term1 = 4'd15; term2 = 4'd1;
	#10;
	term1 = 4'd15; term2 = 4'd0;
	#10;
end 
endmodule 