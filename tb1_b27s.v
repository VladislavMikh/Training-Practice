
`timescale 1ns/ 100ps
module tb1_b27s();
	reg [3:0] datain;
	wire [6:0] dataout;
	
b27s DUT (.sw(datain), .led(dataout));

initial begin 
	datain = 4'd0;
	#10;
	datain = 4'd7;
	#10;
	datain = 4'd12;
	#10;
	datain = 4'd3;
	#10;
	datain = 4'd10;
	#10;
	datain = 4'd15;
	#10;
end 
endmodule 