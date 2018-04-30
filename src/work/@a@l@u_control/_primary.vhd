library verilog;
use verilog.vl_types.all;
entity ALU_control is
    port(
        ALUOp           : in     vl_logic_vector(1 downto 0);
        Opcode          : in     vl_logic_vector(3 downto 0);
        ALU_Cnt         : out    vl_logic_vector(2 downto 0)
    );
end ALU_control;
