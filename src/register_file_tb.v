module reg_file_tb();
  reg clk, RW_en;
  reg [2:0] RW_dest, RR_addr_1, RR_addr_2;
  reg [15:0] RW_data;
  wire [15:0] RR_data_1, RR_data_2;
  reg_file DUT(clk, RW_en, RW_dest, RR_addr_1, RR_addr_2, RW_data, RR_data_1, RR_data_2);
  
  always begin
    #5 clk = ~clk;  
  end
  
  initial begin
    clk <= 0;
    RW_en <= 1;
    RW_dest <= 4;  //Write data to the rf[4]
    RW_data <= 8; //The new data is 31 at rf[4]
    #10
    RW_en <= 0;
    RR_addr_1 <= 6; //Reading the rf[6] data, which is 6
    RR_addr_2 <= 4; //Reading the rf[4] data, which is 8
    #10
    $stop;
  end
  
endmodule