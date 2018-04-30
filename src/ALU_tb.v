module ALU_tb();
reg [15:0] In1;
reg [15:0] In2;
reg clk;
wire zero;
reg [2:0] ALU_control;
wire [15:0] ALUout;
ALU DUT(In1, In2, ALU_control, zero, ALUout);


always begin
  #5 clk = ~clk;
end

initial begin
  clk <= 0;
  In1 = 16'd5; //5
  In2 = 16'd10; //10
  ALU_control = 3'b000; //ADD   ALUout = 15;
  #20
  ALU_control = 3'b001; //SUB    ALUout = -5
  #20
  In2 = 16'd1; //1
  ALU_control = 3'b010; //NOT   ALUout = 1010 = -6
  #20
  ALU_control = 3'b011; //Shift Left  ALUout = 1010  = 10
  #20
  ALU_control = 3'b100; //Shift Right   ALUout = 0010 = 2
  #20
  ALU_control = 3'b101; //AND   ALUout = 0001 = 1
  #20
  ALU_control = 3'b110; //OR   ALUout = 0101 = 5
  #20
  ALU_control = 3'b111; //SLT ALUout = 0
  $stop;
end

endmodule