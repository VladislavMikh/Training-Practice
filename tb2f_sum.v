
`timescale 1ns/100ps
module tb2f_sum();
	reg [3:0]term1;
	reg [3:0]term2;
	wire [4:0]actual;
	integer i;
	reg [4:0] input_mem [0:9];
	reg [4:0] expected_mem [0:4];
	
sum #(.WIDTH(4)) DUT	(.data_a(term1), .data_b(term2), .c_out(actual[4]), .sum(actual[3:0]));

initial begin: read_dataFile
	$display("**UNIT TEST STARTED**");
	$readmemb("input_sum.dat", input_mem);
	$readmemb("exp_sum.dat", expected_mem);
end

initial begin: test_work
	for (i=0; i<=4; i=i+1) begin
		term1 = input_mem[2*i];
		term2 = input_mem[2*i+1];
		#10;
		$display("Now testing with inputs: %b %b, Expected result: %b Actual result: %b",term1,term2,expected_mem[i],actual);
		if (actual != expected_mem[i]) begin
			$display("ERROR: Expected %b, but got %b. Inputs were: %b and %b", expected_mem[i], actual, term1, term2);
			$display("**ERROR: UNIT DOES NOT WORK PROPERLY**");
			$stop;
		end 
	end
	$display("**ALL TESTS PASSED**");
	$stop;
end

endmodule  