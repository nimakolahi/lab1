library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity oneD is
	port (
		D: in integer;
		clk: in std_logic;
		Q: out integer
	);
end oneD;

architecture behavioral of oneD is
signal D_temp : integer :=0;
begin
	D_temp<= D;
	process(clk)
		begin
			if rising_edge(clk) then
				Q<=D_temp;
			end if;
	end process;
end behavioral;
