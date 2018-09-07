
`timescale 1ns/ 100ps
module tb2_dmux();
	reg button;
	reg [3:0]datain;
	wire [7:0]actual;
	reg [7:0]expected;
	integer i;
	
dmux DUT (.pba(button), .sw(datain), .led(actual));

initial begin: make_data
	$display("**UNIT TEST STARTED**");
	datain = 4'b0000;
	for (i=0; i<=15; i=i+1) begin
		button = 1'b0; expected = {4'b0000, datain};
		#10;
		check_data(actual, expected);
		button = 1'b1; expected = {datain, 4'b0000};
		#10;
		check_data(actual, expected);
		datain = datain + 1'b1;
	end
	$display("**ALL TESTS PASSED**");
	$stop;
end		
	
	task check_data;
		input [7:0] actual;
		input [7:0] expected;
	begin	
		$display("Now testing with inputs: %b %b, Expected result: %b Actual result: %b", button, datain, expected, actual);
		if (actual != expected) begin
			$display("ERROR: Expected %b, but got %b. Inputs were: %b and %b", expected, actual, button, datain);
			$display("**ERROR: UNIT DOES NOT WORK PROPERLY**");
			$stop;
		end
	end
	endtask
endmodule 