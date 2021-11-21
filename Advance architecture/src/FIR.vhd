library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIR is
  port (
    din:in std_logic_vector(7 downto 0);
    din1:in std_logic_vector(7 downto 0);
    din2:in std_logic_vector(7 downto 0);
    vin:in std_logic;
    rst:in std_logic;
    clk:in std_logic;
--    clk3:in std_logic;
    dout:out std_logic_vector(7 downto 0);
    dout1:out std_logic_vector(7 downto 0);
    dout2:out std_logic_vector(7 downto 0);
    vout:out std_logic
     );
end FIR;

architecture behavioral of FIR is

	  type coefficients is array (8 downto 0) of integer;
	  constant coef : coefficients := (-1,-2,6,34,51,34,6,-2,-1);

component oneD is
	port (
		D: in integer;
		clk: in std_logic;
		Q: out integer
	);
end component;

component twoD is
	port (
		D: in integer;
		clk: in std_logic;
		Q: out integer
	);
end component;

component mul is
	port (
		A: in integer;
		B: in integer;
		P: out integer
	);
end component;

component adder is
	port (
		A: in integer;
		B: in integer;
		S: out integer
	);
end component;
------------------------------ 
--signals
signal D0,D1,D2,P00,P01,P02,P03,P04,P05,P06,P07,P08
			   ,P10,P11,P12,P13,P14,P15,P16,P17,P18
			   ,P20,P21,P22,P23,P24,P25,P26,P27,P28,
				Q00,Q01,Q02,Q03,Q04,Q05,Q06,Q07,Q08
			   ,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18
			   ,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,
				S00,S01,S02,S03,S04,S05,S06,S07,S08
			   ,S10,S11,S12,S13,S14,S15,S16,S17,S18
			   ,S20,S21,S22,S23,S24,S25,S26,S27,S28,
				SQ00,SQ01,SQ02,SQ03,SQ04,SQ05,SQ06,SQ07
			   ,SQ10,SQ11,SQ12,SQ13,SQ14,SQ15,SQ16,SQ17
			   ,SQ20,SQ21,SQ22,SQ23,SQ24,SQ25,SQ26,SQ27,PQ00,PQ10,PQ20
				: integer:=0;
signal dout_temp : std_logic_vector(7 downto 0):=("00000000");
signal SQ27_temp,SQ17_temp,SQ07_temp : std_logic_vector(7 downto 0):=("00000000");
signal SQ27_temp1,SQ17_temp1,SQ07_temp1 : std_logic_vector(22 downto 0):=("00000000000000000000000");
signal SQ27_temp2,SQ17_temp2,SQ07_temp2 : std_logic_vector(15 downto 0):=("0000000000000000");
signal vout_temp: std_logic;
signal SQ27_temp3,SQ17_temp3,SQ07_temp3: integer:=0;
------------------------------
begin

--U1 : splitter port map(din,clk3,rst,vin,dout1_temp,dout2_temp,dout3_temp);

D0 <= to_integer(signed(din));
D1 <= to_integer(signed(din1));
D2 <= to_integer(signed(din2));
Q00 <= D0;
Q10 <= D1;
Q20 <= D2;
U5 : mul port map(Q00,coef(0),P00);
U6 : mul port map(Q10,coef(0),P10);
U7 : mul port map(Q20,coef(0),P20);

U10 : oneD port map(Q20,clk,Q21);

U11 : mul port map(Q00,coef(1),P01);
U12 : mul port map(Q10,coef(1),P11);
U13 : mul port map(Q21,coef(1),P21);

U15 : oneD port map(Q10,clk,Q11);

U17 : mul port map(Q00,coef(2),P02);
U18 : mul port map(Q11,coef(2),P12);
U19 : mul port map(Q21,coef(2),P22);

U20 : oneD port map(Q00,clk,Q01);

U23 : mul port map(Q01,coef(3),P03);
U24 : mul port map(Q11,coef(3),P13);
U25 : mul port map(Q21,coef(3),P23);

U28 : oneD port map(Q21,clk,Q22);

U29 : mul port map(Q01,coef(4),P04);
U30 : mul port map(Q11,coef(4),P14);
U31 : mul port map(Q22,coef(4),P24);

U33 : oneD port map(Q11,clk,Q12);

U35 : mul port map(Q01,coef(5),P05);
U36 : mul port map(Q12,coef(5),P15);
U37 : mul port map(Q22,coef(5),P25);

U38 : oneD port map(Q01,clk,Q02);

U41 : mul port map(Q02,coef(6),P06);
U42 : mul port map(Q12,coef(6),P16);
U43 : mul port map(Q22,coef(6),P26);

U46 : oneD port map(Q22,clk,Q23);

U47 : mul port map(Q02,coef(7),P07);
U48 : mul port map(Q12,coef(7),P17);
U49 : mul port map(Q23,coef(7),P27);

U51 : oneD port map(Q12,clk,Q13);

U53 : mul port map(Q02,coef(8),P08);
U54 : mul port map(Q13,coef(8),P18);
U55 : mul port map(Q23,coef(8),P28);

-------------------------------------------
--continue for additions

U69 : adder port map(P00,P21,S00);

U71 : adder port map(S00,P12,S01);

U73 : adder port map(S01,P03,S02);

U75 : adder port map(S02,P24,S03);

U77 : adder port map(S03,P15,S04);

U79 : adder port map(S04,P06,S05);

U81 : adder port map(S05,P27,S06);

U83 : adder port map(S06,P18,S07);



U90 : adder port map(P10,P01,S10);

U92 : adder port map(S10,P22,S11);

U94 : adder port map(S11,P13,S12);

U96 : adder port map(S12,P04,S13);

U98 : adder port map(S13,P25,S14);

U100 : adder port map(S14,P16,S15);

U102 : adder port map(S15,P07,S16);

U104 : adder port map(S16,P28,S17);




U111 : adder port map(P20,P11,S20);

U113 : adder port map(S20,P02,S21);

U115 : adder port map(S21,P23,S22);

U117 : adder port map(S22,P14,S23);

U119 : adder port map(S23,P05,S24);

U121 : adder port map(S24,P26,S25);

U123 : adder port map(S25,P17,S26);

U125 : adder port map(S26,P08,S27);





--SQ27_temp1<=std_logic_vector(to_signed(S27,23));
--SQ17_temp1<=std_logic_vector(to_signed(S17,23));
--SQ07_temp1<=std_logic_vector(to_signed(S07,23));

--SQ27_temp2 <= SQ27_temp1(22 downto 7);
--SQ17_temp2 <= SQ17_temp1(22 downto 7);
--SQ07_temp2 <= SQ07_temp1(22 downto 7);

--SQ27_temp3 <= to_integer(signed(SQ27_temp2));
--SQ17_temp3 <= to_integer(signed(SQ17_temp2));
--SQ07_temp3 <= to_integer(signed(SQ07_temp2));

--SQ27_temp<=std_logic_vector(to_signed(SQ27_temp3,8));
--SQ17_temp<=std_logic_vector(to_signed(SQ17_temp3,8));
--SQ07_temp<=std_logic_vector(to_signed(SQ07_temp3,8));

SQ27_temp<=std_logic_vector(to_signed(S27,8));
SQ17_temp<=std_logic_vector(to_signed(S17,8));
SQ07_temp<=std_logic_vector(to_signed(S07,8));


vout<='1';
dout<= SQ07_temp;
dout1<= SQ17_temp;
dout2<= SQ27_temp;

end behavioral;


