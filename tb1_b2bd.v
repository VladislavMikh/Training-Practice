
`timescale 1ns/ 100ps
module tb1_b2bd();

		reg [3:0] datain;
		wire [7:0] dataout;
		
b2bd DUT (.sw(datain), .led(dataout));	
	
initial begin
	datain = 4'd1;
	#10;
	datain = 4'd8;
	#10;
	datain = 4'd12;
	#10;
	datain = 4'd15;
	#10;
end
endmodule 	