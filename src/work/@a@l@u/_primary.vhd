library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        In1             : in     vl_logic_vector(31 downto 0);
        In2             : in     vl_logic_vector(31 downto 0);
        Func            : in     vl_logic_vector(3 downto 0);
        ALUout          : out    vl_logic_vector(31 downto 0)
    );
end ALU;
