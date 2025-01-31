module onOffToggle
(
	input onOff,
	output OUT
) ;
	reg state,nextstate;
	parameter ON=1'b1,OFF=1'b0;
	always_ff @ (negedge onOff)
		state <= nextstate;

	always_comb
		case(state)
			OFF: nextstate = ON; //Pushing onOff turns the switch on.
			ON: nextstate = OFF; //Pushing onOff turns the switch off.
		endcase

	assign OUT = state;
endmodule
