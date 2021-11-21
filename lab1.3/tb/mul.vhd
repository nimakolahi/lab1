library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mul is
	port (
		A: in integer;
		B: in integer;
		P: out integer
	);
end mul;

architecture behavioral of mul is
signal P1:std_logic_vector(15 downto 0);
signal P2:std_logic_vector(8 downto 0); 
signal P_temp:integer:=0;
begin

P_temp<=A*B;

P1<=std_logic_vector(to_signed(P_temp,16));
P2<=P1(15 downto 7);
P<=to_integer(signed(P2));

end behavioral;
