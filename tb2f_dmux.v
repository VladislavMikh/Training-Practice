
`timescale 1ns/ 100ps
module tb2f_dmux();
	reg button;
	reg [3:0]datain;
	reg [4:0]easyRead;
	wire [7:0]actual;
	integer i;
	reg [4:0] input_mem [0:7];
	reg [7:0] expected_mem [0:7];
	
dmux DUT (.pba(button), .sw(datain), .led(actual));

initial begin: read_dataFile
	$display("**UNIT TEST STARTED**");
	$readmemb("input_dmux.dat", input_mem);
	$readmemb("exp_dmux.dat", expected_mem);
end 

initial begin: test_work
	for (i=0; i<=7; i=i+1) begin
		easyRead = input_mem[i];
		button = easyRead[4];
		datain = easyRead[3:0];
		#10;
		$display("Now testing with inputs: %b %b, Expected result: %b Actual result: %b", button, datain, expected_mem[i], actual);
		if (actual != expected_mem[i]) begin
			$display("ERROR: Expected %b, but got %b. Inputs were: %b and %b", expected_mem[i], actual, button, datain);
			$display("**ERROR: UNIT DOES NOT WORK PROPERLY**");
			$stop;
		end
	end
	$display("**ALL TESTS PASSED**");
	$stop;
end

endmodule 