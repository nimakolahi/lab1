library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIR_unfolded is
  port (
	end_sim_i:in std_logic;
    din:in std_logic_vector(7 downto 0);
    din1:in std_logic_vector(7 downto 0);
    din2:in std_logic_vector(7 downto 0);
    vin:in std_logic;
    rst:in std_logic;
    clk:in std_logic;

    dout:out std_logic_vector(7 downto 0);
    dout1:out std_logic_vector(7 downto 0);
    dout2:out std_logic_vector(7 downto 0);
    vout:out std_logic
     );
end FIR_unfolded;

architecture behavioral of FIR_unfolded is

	  type coefficients is array (8 downto 0) of integer;
	  constant coef : coefficients := (-1,-2,6,34,51,34,6,-2,-1);
--Components
component fourD is
	port (
		D: in integer;
		clk: in std_logic;
		Q: out integer
	);
end component;

component threeD is
	port (
		D: in integer;
		clk: in std_logic;
		Q: out integer
	);
end component;

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
			   ,SQ20,SQ21,SQ22,SQ23,SQ24,SQ25,SQ26,SQ27,PQ00
				: integer:=0;

signal vout_temp: std_logic;

------------------------------
--assignings

begin

--receiving inputs
D0 <= to_integer(signed(din));
D1 <= to_integer(signed(din1));
D2 <= to_integer(signed(din2));
--multiplying part
U2 : oneD port map(D0,clk,Q00);
U3 : oneD port map(D1,clk,Q10);
U4 : oneD port map(D2,clk,Q20);

U5 : mul port map(Q00,coef(0),P00);
U6 : mul port map(Q10,coef(0),P10);
U7 : mul port map(Q20,coef(0),P20);

U10 : twoD port map(Q20,clk,Q21);

U11 : mul port map(Q00,coef(1),P01);
U12 : mul port map(Q10,coef(1),P11);
U13 : mul port map(Q21,coef(1),P21);

U14 : oneD port map(Q00,clk,Q01);
U15 : threeD port map(Q10,clk,Q11);
U16 : twoD port map(Q21,clk,Q22);

U17 : mul port map(Q01,coef(2),P02);
U18 : mul port map(Q11,coef(2),P12);
U19 : mul port map(Q22,coef(2),P22);

U20 : threeD port map(Q01,clk,Q02);
U21 : twoD port map(Q11,clk,Q12);
U22 : twoD port map(Q22,clk,Q23);

U23 : mul port map(Q02,coef(3),P03);
U24 : mul port map(Q12,coef(3),P13);
U25 : mul port map(Q23,coef(3),P23);

U26 : twoD port map(Q02,clk,Q03);
U27 : twoD port map(Q12,clk,Q13);
U28 : threeD port map(Q23,clk,Q24);

U29 : mul port map(Q03,coef(4),P04);
U30 : mul port map(Q13,coef(4),P14);
U31 : mul port map(Q24,coef(4),P24);

U32 : twoD port map(Q03,clk,Q04);
U33 : threeD port map(Q13,clk,Q14);
U34 : twoD port map(Q24,clk,Q25);

U35 : mul port map(Q04,coef(5),P05);
U36 : mul port map(Q14,coef(5),P15);
U37 : mul port map(Q25,coef(5),P25);

U38 : threeD port map(Q04,clk,Q05);
U39 : twoD port map(Q14,clk,Q15);
U40 : twoD port map(Q25,clk,Q26);

U41 : mul port map(Q05,coef(6),P06);
U42 : mul port map(Q15,coef(6),P16);
U43 : mul port map(Q26,coef(6),P26);

U44 : twoD port map(Q05,clk,Q06);
U45 : twoD port map(Q15,clk,Q16);
U46 : threeD port map(Q26,clk,Q27);

U47 : mul port map(Q06,coef(7),P07);
U48 : mul port map(Q16,coef(7),P17);
U49 : mul port map(Q27,coef(7),P27);

U50 : twoD port map(Q06,clk,Q07);
U51 : threeD port map(Q16,clk,Q17);
U52 : oneD port map(Q27,clk,Q28);

U53 : mul port map(Q07,coef(8),P08);
U54 : mul port map(Q17,coef(8),P18);
U55 : mul port map(Q28,coef(8),P28);

-------------------------------------------
--accumulations
U68 : oneD port map(P00,clk,PQ00);
U69 : adder port map(PQ00,P21,S00);
U70 : oneD port map(S00,clk,SQ00);
U71 : adder port map(SQ00,P12,S01);
U72 : oneD port map(S01,clk,SQ01);
U73 : adder port map(SQ01,P03,S02);
U74 : fourD port map(S02,clk,SQ02);
U75 : adder port map(SQ02,P24,S03);
U76 : oneD port map(S03,clk,SQ03);
U77 : adder port map(SQ03,P15,S04);
U78 : oneD port map(S04,clk,SQ04);
U79 : adder port map(SQ04,P06,S05);
U80 : fourD port map(S05,clk,SQ05);
U81 : adder port map(SQ05,P27,S06);
U82 : oneD port map(S06,clk,SQ06);
U83 : adder port map(SQ06,P18,S07);
U84 : oneD port map(S07,clk,SQ07);


U90 : adder port map(P10,P01,S10);
U91 : threeD port map(S10,clk,SQ10);
U92 : adder port map(SQ10,P22,S11);
U93 : oneD port map(S11,clk,SQ11);
U94 : adder port map(SQ11,P13,S12);
U95 : oneD port map(S12,clk,SQ12);
U96 : adder port map(SQ12,P04,S13);
U97 : fourD port map(S13,clk,SQ13);
U98 : adder port map(SQ13,P25,S14);
U99 : oneD port map(S14,clk,SQ14);
U100 : adder port map(SQ14,P16,S15);
U101 : oneD port map(S15,clk,SQ15);
U102 : adder port map(SQ15,P07,S16);
U103 : threeD port map(S16,clk,SQ16);
U104 : adder port map(SQ16,P28,S17);
U105 : oneD port map(S17,clk,SQ17);


U111 : adder port map(P20,P11,S20);
U112 : oneD port map(S20,clk,SQ20);
U113 : adder port map(SQ20,P02,S21);
U114 : fourD port map(S21,clk,SQ21);
U115 : adder port map(SQ21,P23,S22);
U116 : oneD port map(S22,clk,SQ22);
U117 : adder port map(SQ22,P14,S23);
U118 : oneD port map(S23,clk,SQ23);
U119 : adder port map(SQ23,P05,S24);
U120 : fourD port map(S24,clk,SQ24);
U121 : adder port map(SQ24,P26,S25);
U122 : oneD port map(S25,clk,SQ25);
U123 : adder port map(SQ25,P17,S26);
U124 : oneD port map(S26,clk,SQ26);
U125 : adder port map(SQ26,P08,S27);
U126 : twoD port map(S27,clk,SQ27);


dout2<=std_logic_vector(to_signed(SQ27,8));
dout1<=std_logic_vector(to_signed(SQ17,8));
dout<=std_logic_vector(to_signed(SQ07,8));

process (clk,rst)
begin
	if rst='1' then
		vout_temp <= '0';
		if end_sim_i='0' then
			vout_temp<='1';
		end if;
	end if;
end process;
vout <=vout_temp;
end behavioral;


