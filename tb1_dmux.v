
`timescale 1ns/ 100ps
module tb1_dmux();

	reg button;
	reg [3:0]datain;
	wire [7:0]actual;
	
dmux DUT (.pba(button), .sw(datain), .led(actual));

initial begin
	button = 1'b0; datain = 4'b1111;
	#10;
	button = 1'b1; datain = 4'b1111;
	#10;
	button = 1'b0; datain = 4'b1010;
	#10;
	button = 1'b1; datain = 4'b1010;
	#10;
	button = 1'b0; datain = 4'b0101;
	#10;
	button = 1'b1; datain = 4'b0101;
	#10;
end

endmodule 