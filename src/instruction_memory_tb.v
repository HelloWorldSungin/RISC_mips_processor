module inst_memory_tb();
  reg [15:0] pc;
  reg clk;
  wire [15:0] instruction;
  inst_memory DUT(pc, instruction);
  // we are using memfile_1st as the test for
  //instruction_memory
  always begin
    #5 clk = ~clk;
  end
  
  initial begin
    clk = 0;
    pc = 0;  //0400
    #10
    pc = 4;  //0441   
    #10
    pc = 8;  //2050
    #10
    pc = 12; //1280
    #10
    pc = 16; //3050
    #10
    pc = 20; //4050
    #10
    $stop;
  end
  
endmodule
