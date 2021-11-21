library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity FIR is
  port (
    din:in std_logic_vector(7 downto 0);
    vin:in std_logic;
    rst:in std_logic;
    clk:in std_logic;
    
    dout:out std_logic_vector(7 downto 0);
    vout:out std_logic
     );
end FIR;

architecture behavioral of FIR is
  type registers is array (7 downto 0) of integer;
  type coefficients is array (8 downto 0) of integer;
  signal reg: registers;
  constant coef : coefficients := (-1,-2,6,34,51,34,6,-2,-1);
  signal din_temp : integer :=0;

begin
  din_temp<= to_integer(signed(din));
  process (clk,rst)
  variable prod_temp : std_logic_vector (15 downto 0);
  variable prod_shift : std_logic_vector (8 downto 0);
  variable acc,prod: integer :=0;
  variable vout_temp : std_logic := '0';
    begin
      if (rst= '0') then

        for i in 5 downto 0 loop
          reg(i)<= 0;
		  dout<= "00000000";
        end loop;
      elsif (clk'event and clk='1') then
          if (vin='1') then
			acc:=0;
 		  for i in 7 downto 1 loop
		  reg(i) <= reg(i-1);
		  end loop;
		  prod := coef(0)*din_temp;
		  prod_temp := std_logic_vector(to_signed(prod,16));
		  prod_shift := prod_temp(15 downto 7);
		  prod := to_integer(signed(prod_shift));
		  acc := acc + prod;

          prod := 0;
		  for i in 1 to 8 loop
            prod := coef(i)*reg(i-1);
		    prod_temp := std_logic_vector(to_signed(prod,16));
	   	    prod_shift := prod_temp(15 downto 7);
		    prod := to_integer(signed(prod_shift));
            acc := acc + prod;
			prod := 0;
		  end loop;          
			vout_temp:='1';
			reg(0) <= din_temp;
        if (vout_temp='1') then
        dout <= std_logic_vector(to_signed(acc,8));
		vout_temp :='0';
        end if;
      end if;
	  end if;
		vout<= vout_temp;
     end process;
   end behavioral;
