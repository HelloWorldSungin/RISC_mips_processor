library verilog;
use verilog.vl_types.all;
entity reg_file is
    port(
        clk             : in     vl_logic;
        RW_en           : in     vl_logic;
        RW_dest         : in     vl_logic_vector(2 downto 0);
        RR_addr_1       : in     vl_logic_vector(2 downto 0);
        RR_addr_2       : in     vl_logic_vector(2 downto 0);
        RW_data         : in     vl_logic_vector(15 downto 0);
        RR_data_1       : out    vl_logic_vector(15 downto 0);
        RR_data_2       : out    vl_logic_vector(15 downto 0)
    );
end reg_file;
