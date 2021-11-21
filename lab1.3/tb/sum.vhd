library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity adder is
	port (
		A: in integer;
		B: in integer;
		S: out integer
	);
end adder;

architecture behavioral of adder is

begin



S <= A+B;




end behavioral;
