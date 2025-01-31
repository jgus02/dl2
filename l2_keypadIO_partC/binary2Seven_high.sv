module binary2Seven_high (
	input [3:0] BIN, //declare inputs
	output logic [6:0] SEV
); //declare outputs
	always_comb //check for input change
		case ({BIN[3:0]}) //convert binary to seven segment
			4'b0000: {SEV[6:0]} = 7'b0111111;//0
			4'b0001: {SEV[6:0]} = 7'b0000110;//1
			4'b0010: {SEV[6:0]} = 7'b1011011;//2
			4'b0011: {SEV[6:0]} = 7'b1001111;//3
			4'b0100: {SEV[6:0]} = 7'b1100110;//4
			4'b0101: {SEV[6:0]} = 7'b1101101;//5
			4'b0110: {SEV[6:0]} = 7'b1111101;//6
			4'b0111: {SEV[6:0]} = 7'b0000111;//7
			4'b1000: {SEV[6:0]} = 7'b1111111;//8
			4'b1001: {SEV[6:0]} = 7'b1100111;//9
			4'b1010: {SEV[6:0]} = 7'b1110111;//A
			4'b1011: {SEV[6:0]} = 7'b1111100;//b
			4'b1100: {SEV[6:0]} = 7'b0111001;//C
			4'b1101: {SEV[6:0]} = 7'b1011110;//d
			4'b1110: {SEV[6:0]} = 7'b1111001;//E
			4'b1111: {SEV[6:0]} = 7'b1110001;//F
		endcase
endmodule
