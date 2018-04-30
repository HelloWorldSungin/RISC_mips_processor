
module reg_file (
	input clk, RW_en,
	input [2:0] RW_dest, RR_addr_1, RR_addr_2,
	input [15:0] RW_data,
	output [15:0] RR_data_1, RR_data_2);

reg [15:0] rf[7:0]; 
integer i;

initial begin             //set values to rf just for testbench
  for( i = 0; i < 8; i = i + 1) 
      rf[i] = i;
end

always@ (posedge clk) begin  
  if(RW_en)     
    rf[RW_dest] <= RW_data;
end

assign RR_data_1 = rf[RR_addr_1];
assign RR_data_2 = rf[RR_addr_2];

endmodule

