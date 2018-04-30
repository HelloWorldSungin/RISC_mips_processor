library verilog;
use verilog.vl_types.all;
entity data_memory is
    port(
        clk             : in     vl_logic;
        d_mem_write_en  : in     vl_logic;
        d_mem_read      : in     vl_logic;
        d_mem_addr      : in     vl_logic_vector(15 downto 0);
        d_mem_write_data: in     vl_logic_vector(15 downto 0);
        d_mem_read_data : out    vl_logic_vector(15 downto 0)
    );
end data_memory;
