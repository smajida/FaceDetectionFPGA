library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_feature_calc is
end tb_feature_calc;

architecture behavior of tb_feature_calc is
	signal w0: std_logic_vector(14 downto 0);
	signal w1: std_logic_vector(14 downto 0);
	signal w2: std_logic_vector(14 downto 0);
	signal r0: std_logic_vector(24 downto 0);
	signal r1: std_logic_vector(24 downto 0);
	signal r2: std_logic_vector(24 downto 0);
	signal r3: std_logic_vector(24 downto 0);
	signal r4: std_logic_vector(24 downto 0);
	signal r5: std_logic_vector(24 downto 0);
	signal r6: std_logic_vector(24 downto 0);
	signal r7: std_logic_vector(24 downto 0);
	signal r8: std_logic_vector(24 downto 0);
	signal r9: std_logic_vector(24 downto 0);
	signal r10: std_logic_vector(24 downto 0);
	signal r11: std_logic_vector(24 downto 0);
	signal result_feature: std_logic_vector(43 downto 0);
	
component feature_calc
	port(
		w0: in std_logic_vector(14 downto 0); -- signed
		w1: in std_logic_vector(14 downto 0); -- signed
		w2: in std_logic_vector(14 downto 0); -- signed
		r0: in std_logic_vector(24 downto 0); -- unsigned
		r1: in std_logic_vector(24 downto 0); -- unsigned
		r2: in std_logic_vector(24 downto 0); -- unsigned
		r3: in std_logic_vector(24 downto 0); -- unsigned
		r4: in std_logic_vector(24 downto 0); -- unsigned
		r5: in std_logic_vector(24 downto 0); -- unsigned
		r6: in std_logic_vector(24 downto 0); -- unsigned
		r7: in std_logic_vector(24 downto 0); -- unsigned
		r8: in std_logic_vector(24 downto 0); -- unsigned
		r9: in std_logic_vector(24 downto 0); -- unsigned
		r10: in std_logic_vector(24 downto 0); -- unsigned
		r11: in std_logic_vector(24 downto 0); -- unsigned
		result_feature: out std_logic_vector(43 downto 0) -- signed
	);
end component;
	
begin
	
test_feature_calc: feature_calc
	port map (w0=>w0, w1=>w1, w2=>w2,
				r0=>r0, r1=>r1, r2=>r2, r3=>r3,
				r4=>r4, r5=>r5, r6=>r6, r7=>r7,
				r8=>r8, r9=>r9, r10=>r10, r11=>r11,
				result_feature=>result_feature);
	
dataSim: process
begin
	w0<=std_logic_vector(to_unsigned(1, 15));-- (integer value, bit width)
	w1<=std_logic_vector(to_unsigned(1, 15));-- (integer value, bit width)
	w2<=std_logic_vector(to_unsigned(1, 15));-- (integer value, bit width)
	r0<="0000000000000000000000001";
	r1<="0000000000000000000000011";
	r2<="0000000000000000000000011";
	r3<="0000000000000000000000111";
	r4<="0000000000000000000000001";
	r5<="0000000000000000000000011";
	r6<="0000000000000000000000011";
	r7<="0000000000000000000000111";
	r8<="0000000000000000000000001";
	r9<="0000000000000000000000011";
	r10<="0000000000000000000000011";
	r11<="0000000000000000000000111";
	wait for 1 us;
	
	w0<=std_logic_vector(to_unsigned(1, 15));-- (integer value, bit width)
	w1<=std_logic_vector(to_unsigned(1, 15));-- (integer value, bit width)
	w2<=std_logic_vector(to_unsigned(1, 15));-- (integer value, bit width)
	r0<="0000000000000000000000001";
	r1<="0000000000000000000000011";
	r2<="0000000000000000000000011";
	r3<="0000000000000000000000111";
	r4<="0000000000000000000000011";
	r5<="0000000000000000000000111";
	r6<="0000000000000000000000111";
	r7<="0000000000000000000001111";
	r8<="0000000000000000000000111";
	r9<="0000000000000000000001111";
	r10<="0000000000000000000001111";
	r11<="0000000000000000000011111";
	wait for 1 us;
	
	w0<=std_logic_vector(to_unsigned(2, 15));-- (integer value, bit width)
	w1<=std_logic_vector(to_unsigned(3, 15));-- (integer value, bit width)
	w2<=std_logic_vector(to_unsigned(4, 15));-- (integer value, bit width)
	r0<="0000000000000000000000001";
	r1<="0000000000000000000000011";
	r2<="0000000000000000000000011";
	r3<="0000000000000000000000111";
	r4<="0000000000000000000000011";
	r5<="0000000000000000000000111";
	r6<="0000000000000000000000111";
	r7<="0000000000000000000001111";
	r8<="0000000000000000000000111";
	r9<="0000000000000000000001111";
	r10<="0000000000000000000001111";
	r11<="0000000000000000000011111";
	wait for 1 us;
	
	w0<=std_logic_vector(to_signed(-4096, 15));-- (integer value, bit width)
	w1<=std_logic_vector(to_signed(12288, 15));-- (integer value, bit width)
	w2<=std_logic_vector(to_signed(8192, 15));-- (integer value, bit width)
	r0<=std_logic_vector(to_unsigned(1, 25));
	r1<=std_logic_vector(to_unsigned(3, 25));
	r2<=std_logic_vector(to_unsigned(3, 25));
	r3<=std_logic_vector(to_unsigned(7, 25));
	r4<=std_logic_vector(to_unsigned(3, 25));
	r5<=std_logic_vector(to_unsigned(7, 25));
	r6<=std_logic_vector(to_unsigned(7, 25));
	r7<=std_logic_vector(to_unsigned(15, 25));
	r8<=std_logic_vector(to_unsigned(7, 25));
	r9<=std_logic_vector(to_unsigned(15, 25));
	r10<=std_logic_vector(to_unsigned(15, 25));
	r11<=std_logic_vector(to_unsigned(31, 25));
	wait for 1 us;
end process;
	
end behavior;
