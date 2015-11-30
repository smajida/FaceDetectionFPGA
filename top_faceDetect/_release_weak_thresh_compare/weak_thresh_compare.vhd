library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity weak_thresh_compare is
	port(
		result_feature: in std_logic_vector(43 downto 0); -- 44 bit signed
		var_norm_weak_thresh: in std_logic_vector(39 downto 0); -- 40 bit signed
		q: out std_logic -- assert '1' for strong_accumulator_result > strong_thresh
	);
end weak_thresh_compare;

architecture behavior of weak_thresh_compare is

component lpm_compare_sign44bit_a_ge_b
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (43 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (43 DOWNTO 0);
		aeb		: OUT STD_LOGIC ;
		ageb		: OUT STD_LOGIC 
	);
end component;

signal var_norm_weak_thresh_extend: std_logic_vector(43 downto 0); -- 44 bit signed
signal aeb_dumby: std_logic; -- assigned to comparitor0 output that is not used

begin

---- sign extend var_norm_weak_thresh ----
var_norm_weak_thresh_extend(39 downto 0) <= var_norm_weak_thresh;
var_norm_weak_thresh_extend(43 downto 40) <= (others=>var_norm_weak_thresh(39));

---- compare result_feature >= var_norm_weak_thresh_extend ----
compare0: lpm_compare_sign44bit_a_ge_b
	port map(dataa => result_feature,
				datab => var_norm_weak_thresh_extend,
				aeb => aeb_dumby,
				ageb => q);

end behavior;
