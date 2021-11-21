library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity threeD is
	port (
		D: in integer;
		clk: in std_logic;
		Q: out integer
	);
end threeD;

architecture behavioral of threeD is

component oneD is
	port (
		D: in integer;
		clk: in std_logic;
		Q: out integer
	);
end component;

signal Q1,Q2: integer := 0;

begin

DFF1: oneD port map(D,clk,Q1);
DFF2: oneD port map(Q1,clk,Q2);
DFF3: oneD port map(Q2,clk,Q);

end behavioral;
