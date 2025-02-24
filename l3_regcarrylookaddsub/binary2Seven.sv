module binary2Seven (
	input [3:0] BIN, //declare inputs
	output logic [6:0] SEV
); //declare outputs
	always_comb //check for input change
		case ({BIN[3:0]}) //convert binary to seven segment
			4'b0000: {SEV[6:0]} = 7'b1000000;//0
			4'b0001: {SEV[6:0]} = 7'b1111001;//1
			4'b0010: {SEV[6:0]} = 7'b0100100;//2
			4'b0011: {SEV[6:0]} = 7'b0110000;//3
			4'b0100: {SEV[6:0]} = 7'b0011001;//4
			4'b0101: {SEV[6:0]} = 7'b0010010;//5
			4'b0110: {SEV[6:0]} = 7'b0000010;//6
			4'b0111: {SEV[6:0]} = 7'b1111000;//7
			4'b1000: {SEV[6:0]} = 7'b0000000;//8
			4'b1001: {SEV[6:0]} = 7'b0011000;//9
			4'b1010: {SEV[6:0]} = 7'b0001000;//A
			4'b1011: {SEV[6:0]} = 7'b0000011;//b
			4'b1100: {SEV[6:0]} = 7'b1000110;//C
			4'b1101: {SEV[6:0]} = 7'b0100001;//d
			4'b1110: {SEV[6:0]} = 7'b0000110;//E
			4'b1111: {SEV[6:0]} = 7'b0001110;//F
		endcase
endmodule
