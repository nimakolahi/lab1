library verilog;
use verilog.vl_types.all;
entity FIR_unfolded is
    port(
        end_sim_i       : in     vl_logic;
        din             : in     vl_logic_vector(7 downto 0);
        din1            : in     vl_logic_vector(7 downto 0);
        din2            : in     vl_logic_vector(7 downto 0);
        vin             : in     vl_logic;
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        dout            : out    vl_logic_vector(7 downto 0);
        dout1           : out    vl_logic_vector(7 downto 0);
        dout2           : out    vl_logic_vector(7 downto 0);
        vout            : out    vl_logic
    );
end FIR_unfolded;
