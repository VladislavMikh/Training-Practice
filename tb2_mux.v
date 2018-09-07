
`timescale 1ns/ 100ps
module tb2_mux();
	
	reg button;
	reg [7:0] channels;
	reg [3:0] expected;
	wire [3:0] actual;
	integer i;
	
mux DUT (.sw(channels), .pba(button), .led(actual));

initial begin: make_data
	$display("**UNIT TEST STARTED**");
	channels = 8'b00000000;
	for (i=0; i<256; i=i+1) begin
		
		button = 1'b0; expected = {channels[3:0]};
		#100;
		check_data(expected, actual);
		button = 1'b1; expected = {channels[7:4]};
		#100;
		check_data(expected, actual);
		channels = channels + 1'b1;
		
	end
	
	$display("**ALL TESTS PASSED**");
	$stop;
	
end		
	
task check_data;
	input [3:0] expected;
	input [3:0] actual;
begin	
	$display("Now testing with inputs: %b %b, Expected result: %b Actual result: %b", button, channels, expected, actual);
	if (expected != actual) begin
		$display("ERROR: expected %b, but got %b. Inputs were: %b and %b.", expected, actual, button, channels);
		$display("**ERROR: UNIT DOES NOT WORK PROPERLY**");
		$stop;
	end
end	
endtask
endmodule 