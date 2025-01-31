module divToggle (
	input toggle,
	input clk50M,
	input clr,
	
	output rate
) ;

	wire clk50k;
	wire clk50;
	wire clk25;
	wire clk12o5;
	wire clk6o25;
	
	divideXN #( .N(1000), .M(10) ) div1000_a (
		.CLK(clk50M),
		.CLEAR(clr),
		.OUT(clk50k)
	) ;
	
	divideXN #( .N(1000), .M(10) ) div1000_b (
		.CLK(clk50k),
		.CLEAR(clr),
		.OUT(clk50)
	) ;
	
	divideXN #( .N(2), .M(2) ) div2_a (
		.CLK(clk50),
		.CLEAR(clr),
		.OUT(clk25)
	) ;
	
	divideXN #( .N(2), .M(2) ) div2_b (
		.CLK(clk25),
		.CLEAR(clr),
		.OUT(clk12o5)
	) ;
	
	divideXN #( .N(4), .M(4) ) div2_c (
		.CLK(clk12o5),
		.CLEAR(clr),
		.OUT(clk6o25)
	) ;
	
	reg [1:0] state;
	reg [1:0] nextstate;
	
	parameter SPD0=2'b00,SPD1=2'b01,SPD2=2'b10,SPD3=2'b11;
	
	always_ff @ (negedge toggle)
		state <= nextstate;

	always_comb
		case(state)
			SPD0: nextstate <= SPD1; 
			SPD1: nextstate <= SPD2;
			SPD2: nextstate <= SPD3;
			SPD3: nextstate <= SPD0;
		endcase
		
	assign rate = ((state == SPD0)*clk6o25 
			     + (state == SPD1)*clk12o5 
			  	 + (state == SPD2)*clk25
				 + (state == SPD3)*clk50);
endmodule
		
