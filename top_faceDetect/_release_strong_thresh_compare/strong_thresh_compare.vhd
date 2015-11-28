library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity strong_thresh_compare is
	port(
		strong_accumulator_result: in std_logic_vector(21 downto 0); -- 22 bit signed
		strong_thresh: in std_logic_vector(11 downto 0); -- 12 bit signed
		q: out std_logic -- assert '1' for strong_accumulator_result > strong_thresh
	);
end strong_thresh_compare;

architecture behavior of strong_thresh_compare is

-- vj_cpp calculates by:
-- if (stage_sum < 0.4*stage_thresh_array[i])
-- {return -i} //this breaks the classifier cascade

-- our vhdl implementation will avoid fraction multiplicaiton
-- ... achieved by multiplying inputs by constant decimal values
-- ... since 0.4=4/10 ... compare(strong_accumulator_result*10 > strong_thresh*4)
-- ... compare result true = '1', else '0'

component lpm_mult_sign22bit_sign5bit_to_sign27bit
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (21 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (26 DOWNTO 0)
	);
end component;

component lpm_mult_sign12bit_sign4bit_to_sign16bit
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (11 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
end component;

component lpm_compare_sign27bit_a_gtr_b
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (26 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (26 DOWNTO 0);
		aeb		: OUT STD_LOGIC ;
		agb		: OUT STD_LOGIC 
	);
end component;

signal result_mult0: std_logic_vector(26 downto 0); -- 27 bit signed
signal result_mult1: std_logic_vector(15 downto 0); -- 16 bit signed
signal result_mult1_extend: std_logic_vector(26 downto 0); -- 27 bit signed
signal aeb_dumby: std_logic; -- assigned to comparitor0 output that is not used

begin

---- scale strong_accumulator_result ----
mult0: lpm_mult_sign22bit_sign5bit_to_sign27bit
	port map(dataa => strong_accumulator_result,
				datab => std_logic_vector(to_signed(6, 5)), -- const 10(dec) ... 5 bit signed, ... original=10
				result => result_mult0);
	

---- scale strong_thresh ----
mult1: lpm_mult_sign12bit_sign4bit_to_sign16bit
	port map(dataa => strong_thresh,
				datab => std_logic_vector(to_signed(7, 4)), -- const 4(dec) ... 4 bit signed, ... original=4
				result => result_mult1);

---- sign extend scaled strong_thresh ----
result_mult1_extend(15 downto 0) <= result_mult1;
result_mult1_extend(26 downto 16) <= (others=>result_mult1(15));

---- compare scaled strong_accumulator_result to sign extend scaled strong_thresh ----
compare0: lpm_compare_sign27bit_a_gtr_b
	port map(dataa => result_mult0,
				datab => result_mult1_extend,
				aeb => aeb_dumby,
				agb => q);

end behavior;
