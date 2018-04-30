
module ALU (input [15:0] In1, In2, 
			input [2:0] ALU_control, 
			output zero,
			output reg [15:0] ALUout 
			);
			
  always @ (*) begin
   case (ALU_control) 
    3'b000 : ALUout = In1 + In2;		//ADD
    3'b001 : ALUout = In1 - In2;		//SUB
    3'b010 : ALUout = ~In1;				//NOT
    3'b011 : ALUout = In1 << In2;		//Shift Left
    3'b100 : ALUout = In1 >> In2;		//Shift Right
    3'b101 : ALUout = In1 & In2;			//AND
	3'b110 : ALUout = In1 | In2;			//OR
	3'b111 : ALUout = (In1 < In2) ? 16'd1 : 16'd0;	//SLT
	default: ALUout = In1 + In2;
   endcase
  end    
  assign zero = (ALUout == 16'd0) ? 1'b1: 1'b0 ;
   
 endmodule
