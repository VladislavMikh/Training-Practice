
`timescale 1ns/100ps
module tb2f_b27s();
	reg [3:0]datain;
	wire [6:0]dataout;
	reg [6:0]expected;
	integer i;
	reg [3:0] input_mem [0:5];
	reg [6:0] expected_mem [0:5];
	
b27s DUT (.sw(datain), .led(dataout));

initial begin: read_dataFile
	$display("**UNIT TEST STARTED**");
	$readmemb("input_b27s.dat", input_mem);
	$readmemb("exp_b27s.dat", expected_mem);
end

initial begin: test_work
	for (i=0; i<=5; i=i+1) begin
		datain = input_mem[i];
		#10;
		$display("Now testing with inputs: %b, Expected result: %b Actual result: %b", datain, expected_mem[i], dataout);
		if (dataout != expected_mem[i]) begin
			$display("ERROR: Expected %b, but got %b. Inputs were: %b", expected_mem[i], dataout, datain);
			$display("**ERROR: UNIT DOES NOT WORK PROPERLY**");
			$stop;
		end 
	end
	$display("**ALL TESTS PASSED**");
	$stop;
end

endmodule  