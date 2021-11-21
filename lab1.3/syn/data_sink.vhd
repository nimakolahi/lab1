library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity data_sink is
  port (
    CLK   : in std_logic;
    RST_n : in std_logic;
    VIN   : in std_logic;
    DIN   : in std_logic_vector(7 downto 0);
    DIN1  : in std_logic_vector(7 downto 0);
    DIN2  : in std_logic_vector(7 downto 0);
	END_SIM : in std_logic);
end data_sink;

architecture beh of data_sink is

begin  -- beh

  process (CLK, RST_n)
    file res_fp : text open WRITE_MODE is "./results.txt";
    variable line_out : line;    
  begin  -- process
    if RST_n = '0' then                 -- asynchronous reset (active low)
      null;
    elsif CLK'event and CLK = '1' then  -- rising clock edge
      if (VIN = '1') then
        write(line_out, to_integer(signed(DIN)));
        writeline(res_fp, line_out);
        write(line_out, to_integer(signed(DIN1)));
        writeline(res_fp, line_out);
        write(line_out, to_integer(signed(DIN2)));
        writeline(res_fp, line_out);
		if 	(END_SIM = '1') then
			file_close(res_fp);
		end if;
      end if;
    end if;
  end process;

end beh;
