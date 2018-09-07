
`timescale 1ns/ 100ps
module tb1_mux();

	reg [7:0] channels;
	reg button;
	
mux DUT (.sw(channels), .pba(button));

initial begin
	button = 1'b1; channels = 8'b11110000;
	#10;
	button = 1'b1; channels = 8'b00001111;
	#10;
	button = 1'b0; channels = 8'b11110000;
	#10;
	button = 1'b0; channels = 8'b00001111;
	#10;
	button = 1'b1; channels = 8'b10101010;
	#10;
	button = 1'b1; channels = 8'b01010101;
	#10;
	button = 1'b0; channels = 8'b10101010;
	#10;
	button = 1'b0; channels = 8'b01010101;
	#10;
	$stop;
end

endmodule 