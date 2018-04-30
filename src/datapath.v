/*
 * file: datapath.v
 */

module datapath (
	input clk,
	input jump, beq, mem_read, mem_write, alu_src, reg_dst, mem_to_reg, RW_en, bne,
	input [1:0] alu_op,
	output [3:0] opcode
);
 reg  [15:0] pc_current;
 wire [15:0] pc_next,pc2;
 wire [15:0] instr;
 wire [2:0] RW_dest;
 wire [15:0] RW_data;
 wire [2:0] RR_addr_1;
 wire [15:0] RR_data_1;
 wire [2:0] RR_addr_2;
 wire [15:0] RR_data_2;
 wire [15:0] ext_im,read_data2;
 wire [2:0] ALU_Control;
 wire [15:0] ALU_out;
 wire zero_flag;
 wire [15:0] PC_j, PC_beq, PC_2beq,PC_2bne,PC_bne;
 wire beq_control;
 wire [12:0] jump_shift;
 wire [15:0] mem_read_data;

 initial pc_current <= 16'd0;
 
 always@(posedge clk)	pc_current <= pc_next;
 
 assign pc2 = pc_current + 16'd4;
 //instruction memory
 inst_memory im (pc_current, instr);
 //jump
 assign jump_shift = {instr[11:0], 1'b0};
 //Mul regDest
 assign RW_dest = (reg_dst == 1'b1) ? instr[5:3] : instr[8:6];
 //reg_file
 assign RR_addr_1 = instr[11:9];
 assign RR_addr_2 = instr[8:6];
 
 reg_file GPRs(clk, RW_en, RW_dest, RR_addr_1, RR_addr_2, RW_data, RR_data_1, RR_data_2);
 
 
 
endmodule
