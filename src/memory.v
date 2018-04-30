module inst_memory (
	input [15:0] pc,
	output [15:0] instruction
);
	reg [15:0] IMEM[14:0];	//instruction memory is 16 bits instruction memory -> [15:0]
							//number of instruction is 15 ->[14:0]
	wire [3:0] i_address = pc [5:2];  //modified here from pc[4:1] -> pc[5:2]
	initial $readmemh("memfile.dat", IMEM);
	
	assign instruction = IMEM[i_address];
endmodule


module data_memory (
	input clk, d_mem_write_en, d_mem_read,
	input [15:0] d_mem_addr, d_mem_write_data,
  output [15:0] d_mem_read_data
);
	reg [15:0] DMEM[7:0];	//data memory is 16 bits data memory -> [15:0]
							           //number of data memory is 8 -> [7:0]
	wire [2:0] d_address = d_mem_addr [2:0];
	reg [3:0] i;
  initial begin             //set values to DMEM just for testbench
  for( i = 0; i < 8; i = i + 1) 
      DMEM[i] = i;
  end
	always @ (posedge clk) begin
		if (d_mem_write_en) DMEM[d_mem_addr] <= d_mem_write_data;
	end//always
	assign d_mem_read_data = (d_mem_read == 1) ? DMEM[d_address] : 0; 
endmodule
