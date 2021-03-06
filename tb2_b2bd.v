
`timescale 1ns/ 100ps
module tb2_b2bd();
	
	reg [3:0]datain;
	reg [7:0]expected;
	wire [7:0]dataout;
	reg [3:0]tetrad;
	integer i;
	
b2bd DUT (.sw(datain), .led(dataout));
 
initial begin: make_data
	$display("**UNIT TEST STARTED**");
	datain = 4'b0000;
	for (i= 0; i<=9; i=i+1) begin
		expected = {4'b0000,datain};
		#10;
		check_data(dataout, expected);
		datain = datain + 1'b1;
	end
	
	// костыль, зато без перевода в 2 -> 10   10 -> 2-10
	tetrad = 4'b0000;
	for (i= 0; i<=5; i=i+1) begin
		expected = {4'b0001,tetrad};
		#10;
		check_data(dataout, expected);
		tetrad = tetrad + 1'b1;
		datain = datain + 1'b1;
	end
	$display("**ALL TESTS PASSED**");
	$stop;
end	

task check_data;
		input [7:0]dataout;
		input [7:0]expected;
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