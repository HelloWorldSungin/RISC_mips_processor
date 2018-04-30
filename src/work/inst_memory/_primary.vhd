library verilog;
use verilog.vl_types.all;
entity inst_memory is
    port(
        pc              : in     vl_logic_vector(15 downto 0);
        instruction     : out    vl_logic_vector(15 downto 0)
    );
end inst_memory;
