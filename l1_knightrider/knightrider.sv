module knightrider (
	input clk50M,
	input onOff,
	input rateToggle,
	
	output [9:0] LEDR,
	output [6:0] HEX0
) ;
	
	reg enable;
	wire raw_rate;
	wire rate = raw_rate & (~enable);
	wire [3:0] count;
	reg countUp;

		
	divToggle dt_inst (
		.clk50M(clk50M & (~enable)),
		.clr(1'b1),
		.toggle(rateToggle),
		
		.rate(raw_rate)
	) ;
	
	always_ff @ (negedge rate)
	begin
		if(count[3:0] == 4'd9 || count[3:0] == 4'd0) countUp <= ~countUp;
	end
	
	binaryUpDown bud_inst (
		.CLK(rate),
		.CLEAR(1'b1),
		.UP(countUp),
		
		.COUNT(count),
		.SHIFT(LEDR[9:0])
	) ;
	
	onOffToggle oot_inst (
		.onOff(onOff),
		
		.OUT(enable)
	) ;
	
	binary2Seven b2s (
		.BIN(count), //declare inputs
		.SEV(HEX0[6:0]) //declare outputs
	) ;
	
 endmodule
