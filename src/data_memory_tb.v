module data_memory_tb();
  reg clk, d_mem_write_en, d_mem_read;
 
  reg [15:0] d_mem_addr, d_mem_write_data;

  wire [15:0] d_mem_read_data;
  
data_memory DUT(clk, d_mem_write_en, d_mem_read,d_mem_addr, d_mem_write_data, d_mem_read_data);

always begin
  #5 clk = ~clk;
end

initial begin
  clk <= 0;
  d_mem_write_en <= 0;
  d_mem_read <= 1;
  d_mem_addr <= 3; //it should read the value at at RAM[3] which is 3
  #10
  d_mem_read <= 0;
  d_mem_write_data <= 0;
  d_mem_addr <= 7;
  d_mem_write_en <= 1;   //it should change write 0 at RAM[5]. RAM[5] changed from 5 to 0
  #10
  
  $stop;
end

endmodule