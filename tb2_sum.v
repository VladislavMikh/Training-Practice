
`timescale 1ns/100ps
module tb2_sum();
	reg [3:0]term1;
	reg [3:0]term2;
	reg [4:0]expected;
	wire [4:0]actual;
	integer i,j;
sum #(.WIDTH(4)) DUT	(.data_a(term1), .data_b(term2), .c_out(actual[4]), .sum(actual[3:0]));

initial begin: make_data
	$display("**UNIT TEST STARTED**");
	term1 = 4'd0;
	for (i=0;i<=15;i=i+1) begin
		term2 = 4'd0;
		for (j=0;j<=15;j=j+1) begin
			expected = term1 + term2;
			#10;
			check_data(expected,actual);
			term2 = term2 + 1'd1;
			end
		term1 = term1 + 1'd1;	
		end 
	$display("**ALL TESTS PASSED**");
	$stop;
end 

task check_data;
		input [4:0]expected;
		input [4:0]actual;
begin
	$display("Now testing with inputs: %b %b, Expected result: %b Actual result: %b", term1, term2, expected, actual);
	if(expected != actual) begin
		$display("ERROR: expected %b, but got %b. Inputs were: %b and %b.", expected, actual, term1, term2);
		$display("**ERROR: UNIT DOES NOT WORK PROPERLY**");
		$stop;
	end
end	
endtask
endmodule  