library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_signed.all;
--use ieee.numeric_std.all;
--use std.textio.all;

entity tb is
  end tb;

architecture behavior of tb is
  component combiner is
  port (
    dout:out std_logic_vector(9 downto 0);
    clk:in std_logic;
    rst:in std_logic;
	vout:in std_logic;

    din1:in std_logic_vector(9 downto 0);
    din2:in std_logic_vector(9 downto 0);
    din3:in std_logic_vector(9 downto 0)
     );
end component;

signal dout : std_logic_vector(9 downto 0) := (others=> '0');
signal clk : std_logic := '0';
signal rst : std_logic := '0';
signal vout : std_logic := '0';

signal din1 : std_logic_vector(9 downto 0) := (others=> '0');
signal din2 : std_logic_vector(9 downto 0) := (others=> '0');
signal din3 : std_logic_vector(9 downto 0) := (others=> '0');

begin
  uut: combiner port map (dout,clk,rst,vout,din1,din2,din3);
  clk <= not clk after 1 ns;
  rst <= '0' after 0 ns , '1' after 1 ns;
  din1 <= "0000000001" after 0 ns , "0000001000" after 6 ns;
  din2 <=  "0000000010" after 2 ns, "0000010000" after 8 ns;
  din3 <= "0000000100" after 4 ns, "0000100000" after 10 ns;
  vout <= '1' after 0 ns;
end;
