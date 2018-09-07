
`timescale 1ns/ 100ps
module tb2f_b2bd();
	
	reg [3:0]datain;
	reg [7:0]expected;
	wire [7:0]dataout;
	reg [3:0]tetrad;
	integer i;
	reg [3:0] input_mem [0:5];
	reg [7:0] expected_mem [0:5];
	
b2bd DUT (.sw(datain), .led(dataout));
	
initial begin: read_dataFile
	$display("**UNIT TEST STARTED**");
	$readmemb("input_b2bd.dat", input_mem);
	$readmemb("exp_b2bd.dat", expected_mem);
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