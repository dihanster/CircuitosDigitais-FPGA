
module MaquinaDeMealy(clock, reset, UP, DOWN, z);
	input clock, reset, UP, DOWN;
	output reg [3:0] z;
	reg [3:0] estado, prox_estado;	
	
	parameter 
		A = 4'b0000,
      B = 4'b0001,
		C = 4'b0010,
		D = 4'b0011,
		E = 4'b0100,
		F = 4'b0101,
		G = 4'b0110,
		H = 4'b0111,
		I = 4'b1000,
		Blank = 4'b1001;

	always@(estado or UP or DOWN)	
		begin	
			case(estado) 
				A: if(UP  ==  1 && DOWN == 0)
					prox_estado = B;
					else if(UP == 0 && DOWN == 0)
					prox_estado = A;
					else if(UP == 0 && DOWN == 1)
					prox_estado = I;
					else if(UP == 1 && DOWN == 1)
					prox_estado = Blank;
				B: if(UP == 1 && DOWN == 0)
					prox_estado = C;
					else if(UP == 0 && DOWN == 0)
					prox_estado = B;
					else if(UP == 0 && DOWN == 1)
					prox_estado = A;
					else if(UP == 1 && DOWN == 1)
					prox_estado = Blank;
				C: if(UP == 1 && DOWN == 0)
					prox_estado = D;
					else if(UP == 0 && DOWN == 0)
					prox_estado = C;
					else if(UP == 0 && DOWN == 1)
					prox_estado = B;
					else if(UP == 1 && DOWN == 1)
					prox_estado = Blank;
				D: if(UP == 1 && DOWN == 0)
					prox_estado = E;
					else if(UP == 0 && DOWN == 0)
					prox_estado = D;
					else if(UP == 0 && DOWN == 1)
					prox_estado = C;
					else if(UP == 1 && DOWN == 1)
					prox_estado = Blank;
				E: if(UP == 1 && DOWN == 0)
					prox_estado = F;
					else if(UP == 0 && DOWN == 0)
					prox_estado = E;
					else if(UP == 0 && DOWN == 1)
					prox_estado = D;
					else if(UP == 1 && DOWN == 1)
					prox_estado = Blank;
				F: if(UP == 1 && DOWN == 0)
					prox_estado = G;
					else if(UP == 0 && DOWN == 0)
					prox_estado = F;
					else if(UP == 0 && DOWN == 1)
					prox_estado = E;
					else if(UP == 1 && DOWN == 1)
					prox_estado = Blank;
				G: if(UP == 1 && DOWN == 0)
					prox_estado = H;
					else if(UP == 0 && DOWN == 0)
					prox_estado = G;
					else if(UP == 0 && DOWN == 1)
					prox_estado = F;
					else if(UP == 1 && DOWN == 1)
					prox_estado = Blank;
				H: if(UP == 1 && DOWN == 0)
					prox_estado = I;
					else if(UP == 0 && DOWN == 0)
					prox_estado = H;
					else if(UP == 0 && DOWN == 1)
					prox_estado = G;
					else if(UP == 1 && DOWN == 1)
					prox_estado = Blank;	
				I: if(UP == 1 && DOWN == 0)
					prox_estado= A;
					else if(UP == 0 && DOWN == 0)
					prox_estado = I;
					else if(UP == 0 && DOWN == 1)
					prox_estado = H;
					else if(UP == 1 && DOWN == 1)
					prox_estado = Blank;		
				Blank: if(UP == 1 && DOWN == 0)
					prox_estado = A;
					else if(UP == 0 && DOWN == 0)
					prox_estado = Blank;
					else if(UP == 0 && DOWN == 1)
					prox_estado = I;
					else if(UP == 1 && DOWN == 1)
					prox_estado = Blank;	
				default prox_estado = 4'bxxxx;	  
			endcase
		end
		
	always@(estado or UP or DOWN)
		begin
			z = 4'b0000;
			case(estado)
	         A: z = 4'd6;
				B: z = 4'd9;
				C: z = 4'd0;
				D: z = 4'd2;
				E: z = 4'd4;
				F: z = 4'd6;
				G: z = 4'd5;
				H: z = 4'd3;
				I: z = 4'd8;
				Blank: z = 4'd15;
				default z = 4'bxxxx;
			endcase
		end
		
	always@(posedge clock or posedge reset)
		begin 
			if(reset)
				estado <= A;
			else 
				estado <= prox_estado;
		end

endmodule