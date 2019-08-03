module Principal(clock, reset, UP, DOWN, segmentos, saida_estado);
	input clock, reset, UP, DOWN;
	output wire [0:6] segmentos;
	output wire [0:3] saida_estado;
	wire novo_clock;

	DivisorFrequencias df(clock, novo_clock);	
	MaquinaMealy mq(novo_clock, reset, UP, DOWN, saida_estado);
	Decodificador d(saida_estado, segmentos);
		
endmodule
