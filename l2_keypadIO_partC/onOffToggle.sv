module onOffToggle (
	input onOff,CLK,
	output OUT
);

	reg state,nextstate;
	parameter ON=1'b1,OFF=1'b0;
	always_ff @ (negedge onOff)
		state <= nextstate;

	always_ff @ (posedge CLK)
  begin
		case(state)
			OFF: nextstate = ON; //Pushing onOff turns the switch on.
			ON: nextstate = OFF; //Pushing onOff turns the switch off.
		endcase
  end

	assign OUT = state;
endmodule