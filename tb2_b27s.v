
`timescale 1ns/ 100ps
module tb2_b27s();
	reg [3:0]datain;
	wire [6:0]dataout;
	reg [6:0]expected;
	integer i;
	
b27s DUT (.sw(datain), .led(dataout));

// как по-другому тестить 7сегм индикатор, не представляю
initial begin: make_data
	$display("**UNIT TEST STARTED**");
	datain = 4'd0; expected = 7'b0111111;
	#10;
	check_data(dataout, expected);
	datain = 4'd1; expected = 7'b0000110 ;
	#10;
	check_data(dataout, expected);
	datain = 4'd2; expected = 7'b1011011 ;
	#10;
	check_data(dataout, expected);
	datain = 4'd3; expected =7'b1001111 ;
	#10;
	check_data(dataout, expected);
	datain = 4'd4; expected = 7'b1100110 ;
	#10;
	check_data(dataout, expected);
	datain = 4'd5; expected = 7'b1101101;
	#10;
	check_data(dataout, expected);
	datain = 4'd6; expected = 7'b1111101;
	#10;
	check_data(dataout, expected);
	datain = 4'd7; expected = 7'b0000111;
	#10;
	check_data(dataout, expected);
	datain = 4'd8; expected = 7'b1111111;
	#10;
	check_data(dataout, expected);
	datain = 4'd9; expected = 7'b1101111;
	#10;
	check_data(dataout, expected);
	datain = 4'd10; expected = 7'b1110111;
	#10;
	check_data(dataout, expected);
	datain = 4'd11; expected = 7'b1111100;
	#10;
	check_data(dataout, expected);
	datain = 4'd12; expected = 7'b0111001;
	#10;
	check_data(dataout, expected);
	datain = 4'd13; expected = 7'b1011110;
	#10;
	check_data(dataout, expected);
	datain = 4'd14; expected = 7'b1111011;
	#10;
	check_data(dataout, expected);
	datain = 4'd15; expected = 7'b1110001;
	#10;
	check_data(dataout, expected);
	$display("**ALL TESTS PASSED**");
	$stop;
	end
	
	task check_data;
		input [6:0]dataout;
		input [6:0]expected;
	begin	
		$display("Now testing with inputs: %b, Expected result: %b Actual result: %b", datain, expected, dataout);
		if (dataout != expected) begin
			$display("ERROR: Expected %b, but got %b. Inputs were: %b", expected, dataout, datain);
			$display("**ERROR: UNIT DOES NOT WORK PROPERLY**");
			$stop;
		end
	end	
	endtask
	
	endmodule
	
	