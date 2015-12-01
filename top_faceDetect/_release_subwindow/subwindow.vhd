library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subwindow is
	port(
		reset: in std_logic; -- reset asserted logic '1' -- this resets the accumulator
		clk: in std_logic; -- latch strong accumulator
		en_strongAccum: in std_logic; -- enable strong accumulator latch
		left_tree: in std_logic_vector(13 downto 0); -- 14 bit signed
		right_tree: in std_logic_vector(13 downto 0); -- 14 bit signed
		weak_thresh: in std_logic_vector(12 downto 0); -- 13 bit signed
		strong_thresh: in std_logic_vector(11 downto 0); -- 12 bit signed
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
		p0: in std_logic_vector(24 downto 0); -- unsigned
		p1: in std_logic_vector(24 downto 0); -- unsigned
		p2: in std_logic_vector(24 downto 0); -- unsigned
		p3: in std_logic_vector(24 downto 0); -- unsigned
		ssp0: in std_logic_vector(32 downto 0); -- unsigned
		ssp1: in std_logic_vector(32 downto 0); -- unsigned
		ssp2: in std_logic_vector(32 downto 0); -- unsigned
		ssp3: in std_logic_vector(32 downto 0); -- unsigned
		detection: out std_logic -- assert '1' for detection
	);
end subwindow;

architecture behavior of subwindow is

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

component var_norm_calc
	port(
		p0: in std_logic_vector(24 downto 0); -- unsigned
		p1: in std_logic_vector(24 downto 0); -- unsigned
		p2: in std_logic_vector(24 downto 0); -- unsigned
		p3: in std_logic_vector(24 downto 0); -- unsigned
		ssp0: in std_logic_vector(32 downto 0); -- unsigned
		ssp1: in std_logic_vector(32 downto 0); -- unsigned
		ssp2: in std_logic_vector(32 downto 0); -- unsigned
		ssp3: in std_logic_vector(32 downto 0); -- unsigned
		var_norm_factor: out std_logic_vector(26 downto 0) -- signed??
	);
end component;

component lpm_mult_sign13bit_sign27bit_to_sign40bit
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (12 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (26 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (39 DOWNTO 0)
	);
end component;

component weak_thresh_compare
	port(
		result_feature: in std_logic_vector(43 downto 0); -- 44 bit signed
		var_norm_weak_thresh: in std_logic_vector(39 downto 0); -- 40 bit signed
		q: out std_logic -- assert '1' for strong_accumulator_result > strong_thresh
	);
end component;

component left_right_tree_mux
	port(
		sel: in std_logic; -- 1bit unsigned select
		left_val: in std_logic_vector(13 downto 0); -- 14bit signed
		right_val: in std_logic_vector(13 downto 0); -- 14bit signed
		q: out std_logic_vector(13 downto 0) -- 14bit signed
	);
end component;

component strong_accumulator
	port(
		reset: in std_logic; -- async reset
		en: std_logic;
		clk: in std_logic; -- 
		din: in std_logic_vector(13 downto 0); -- 14bit signed
		dout: out std_logic_vector(21 downto 0) -- 22bit signed
	);
end component;

component strong_thresh_compare
	port(
		strong_accumulator_result: in std_logic_vector(21 downto 0); -- 22 bit signed
		strong_thresh: in std_logic_vector(11 downto 0); -- 12 bit signed
		q: out std_logic -- assert '1' for strong_accumulator_result > strong_thresh
	);
end component;

signal result_feature: std_logic_vector(43 downto 0); -- signed
signal var_norm_factor: std_logic_vector(26 downto 0); -- signed??
signal var_norm_weak_thresh: std_logic_vector(39 downto 0); --signed
signal tree_mux_sel: std_logic;
signal tree_mux_result: std_logic_vector(13 downto 0); -- signed
signal strong_accumulator_result: std_logic_vector(21 downto 0); -- signed
signal stage_detection: std_logic;
	
begin

---- feature calc ----
feature_calc0: feature_calc
	port map (w0=>w0, w1=>w1, w2=>w2,
				r0=>r0, r1=>r1, r2=>r2, r3=>r3,
				r4=>r4, r5=>r5, r6=>r6, r7=>r7,
				r8=>r8, r9=>r9, r10=>r10, r11=>r11,
				result_feature=>result_feature);
				
---- variance normalization calc ----
var_norm_calc0: var_norm_calc
	port map (p0=>p0, p1=>p1, p2=>p2, p3=>p3,
				ssp0=>ssp0, ssp1=>ssp1, ssp2=>ssp2, ssp3=>ssp3,
				var_norm_factor=>var_norm_factor);
				
---- weak threshold normalization ----
weak_thresh_norm_mult0: lpm_mult_sign13bit_sign27bit_to_sign40bit
	port map (dataa => weak_thresh,
				datab => var_norm_factor,
				result => var_norm_weak_thresh);
				
---- weak threshold comparator----
weak_thresh_compare0: weak_thresh_compare
	port map(result_feature => result_feature,
				var_norm_weak_thresh => var_norm_weak_thresh,
				q => tree_mux_sel);

---- mux left and right weak tree values ----
left_right_tree_mux0: left_right_tree_mux
	port map (sel=>tree_mux_sel, left_val=>left_tree,
				right_val=>right_tree, q=>tree_mux_result);
				
---- strong accumulator ----
strong_accumulator0: strong_accumulator
	port map (reset=>reset,
				en=>en_strongAccum,
				clk=>clk,
				din=>tree_mux_result, 
				dout=>strong_accumulator_result);
				
---- strong threshold comparator ----
strong_thresh_compare0: strong_thresh_compare
	port map (strong_accumulator_result=> strong_accumulator_result,
				strong_thresh=> strong_thresh,
				q=> stage_detection);

---- detection output ----
	detection <= stage_detection;

end behavior;
