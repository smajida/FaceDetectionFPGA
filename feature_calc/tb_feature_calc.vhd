library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_feature_calc is
end tb_feature_calc;

architecture behavior of tb_feature_calc is
	signal w0: std_logic_vector(15 downto 0);
	signal w1: std_logic_vector(15 downto 0);
	signal w2: std_logic_vector(15 downto 0);
	signal r0: std_logic_vector(17 downto 0);
	signal r1: std_logic_vector(17 downto 0);
	signal r2: std_logic_vector(17 downto 0);
	signal r3: std_logic_vector(17 downto 0);
	signal r4: std_logic_vector(17 downto 0);
	signal r5: std_logic_vector(17 downto 0);
	signal r6: std_logic_vector(17 downto 0);
	signal r7: std_logic_vector(17 downto 0);
	signal r8: std_logic_vector(17 downto 0);
	signal r9: std_logic_vector(17 downto 0);
	signal r10: std_logic_vector(17 downto 0);
	signal r11: std_logic_vector(17 downto 0);
	signal result_feature: std_logic_vector((16+18+1) downto 0);
	
component feature_calc
	generic (
	WEIGHT_WIDTH			: integer := 16;--TBD
	RECT_II_DATA_WIDTH	: integer := 18
	);
	port(
	w0: in std_logic_vector((WEIGHT_WIDTH-1) downto 0);
	w1: in std_logic_vector((WEIGHT_WIDTH-1) downto 0);
	w2: in std_logic_vector((WEIGHT_WIDTH-1) downto 0);
	r0: in std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);
	r1: in std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);
	r2: in std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);
	r3: in std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);
	r4: in std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);
	r5: in std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);
	r6: in std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);
	r7: in std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);
	r8: in std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);
	r9: in std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);
	r10: in std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);
	r11: in std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);
	result_feature: out std_logic_vector((WEIGHT_WIDTH+RECT_II_DATA_WIDTH+1) downto 0)
	);
end component;
	
begin
	
test_feature_calc: feature_calc
	generic map (WEIGHT_WIDTH=>16, RECT_II_DATA_WIDTH=>18)
	port map (w0=>w0, w1=>w1, w2=>w2,
				r0=>r0, r1=>r1, r2=>r2, r3=>r3,
				r4=>r4, r5=>r5, r6=>r6, r7=>r7,
				r8=>r8, r9=>r9, r10=>r10, r11=>r11,
				result_feature=>result_feature);
	
dataSim: process
begin
	w0<=X"0001";
	w1<=X"0001";
	w2<=X"0001";
	r0<="000000000000000001";
	r1<="000000000000000011";
	r2<="000000000000000011";
	r3<="000000000000000111";
	r4<="000000000000000001";
	r5<="000000000000000011";
	r6<="000000000000000011";
	r7<="000000000000000111";
	r8<="000000000000000001";
	r9<="000000000000000011";
	r10<="000000000000000011";
	r11<="000000000000000111";
	wait for 1 us;
	
	w0<=X"0001";
	w1<=X"0001";
	w2<=X"0001";
	r0<="000000000000000001";
	r1<="000000000000000011";
	r2<="000000000000000011";
	r3<="000000000000000111";
	r4<="000000000000000011";
	r5<="000000000000000111";
	r6<="000000000000000111";
	r7<="000000000000001111";
	r8<="000000000000000111";
	r9<="000000000000001111";
	r10<="000000000000001111";
	r11<="000000000000011111";
	wait for 1 us;
	
	w0<=X"0002";
	w1<=X"0003";
	w2<=X"0004";
	r0<="000000000000000001";
	r1<="000000000000000011";
	r2<="000000000000000011";
	r3<="000000000000000111";
	r4<="000000000000000011";
	r5<="000000000000000111";
	r6<="000000000000000111";
	r7<="000000000000001111";
	r8<="000000000000000111";
	r9<="000000000000001111";
	r10<="000000000000001111";
	r11<="000000000000011111";
	wait for 1 us;
end process;
	
end behavior;
