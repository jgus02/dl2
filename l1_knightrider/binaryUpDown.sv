module binaryUpDown #(parameter N = 4)
(
	input CLK, CLEAR, UP,
	output logic [N-1:0] COUNT, //COUNT is defined as an N-bit register
	output [9:0] SHIFT
);
	reg [9:0] shift_reg = 10'b0000000001;
	assign SHIFT = shift_reg;
	
	always_ff @ (posedge CLK, negedge CLEAR) //trigger on clock or clear
		if (CLEAR==0)
		begin 
			COUNT <= 0; //COUNT is loaded with binary all 0's
			shift_reg <= 10'b0000000001;
		end
		else
			if (UP==0) //count up or down?
			begin
				COUNT <= COUNT + 1'b1; //count up
				if(shift_reg != 10'b1000000000) shift_reg[9:0] <= (shift_reg[9:0] << 1);
			end
			else
			begin
				COUNT <= COUNT - 1'b1; //count down
				if(shift_reg != 10'b0000000001) shift_reg[9:0] <= shift_reg[9:0] >> 1;
			end
endmodule
