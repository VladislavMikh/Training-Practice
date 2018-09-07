
`timescale 1ns/ 100ps
module tb2f_mux();
	
	reg button;
	reg [7:0] channels;
	reg [8:0] easyRead;
	wire [3:0] actual;
	integer i;
	reg [8:0] input_mem [0:7];
	reg [3:0] expected_mem [0:7];
	
mux DUT (.sw(channels), .pba(button), .led(actual));

initial begin: read_dataFile
	$display("**UNIT TEST STARTED**");
	$readmemb("input_mux.dat", input_mem);
	$readmemb("exp_mux.dat", expected_mem);
end

initial begin: test_work
	for (i=0; i<8; i=i+1) begin
		easyRead = input_mem[i];
		button = easyRead[8];
		channels = easyRead[7:0];
		#10;
		$display("Now testing with inputs: %b %b, Expected result: %b Actual result: %b", button, channels, expected_mem[i], actual);
		if (actual != expected_mem [i]) begin
			$display("ERROR: expected %b, but got %b. Inputs were: %b %b", expected_mem[i], actual, button, channels);
			$display("**ERROR: UNIT DOES NOT WORK PROPERLY**");
			$stop;
		end
	end
	$display("**ALL TESTS PASSED**");
	$stop;
end
endmodule 