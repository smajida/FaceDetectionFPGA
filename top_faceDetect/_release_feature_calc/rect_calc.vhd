library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rect_calc is
	port(
		weight: in std_logic_vector(14 downto 0);--signed input
		a: in std_logic_vector(24 downto 0);--unsigned input
		b: in std_logic_vector(24 downto 0);--unsigned input
		c: in std_logic_vector(24 downto 0);--unsigned input
		d: in std_logic_vector(24 downto 0);--unsigned input
		--maximum signed multiplier output requires a bit width of (multiplier_bit_width+multplicand_bit_width)
		result: out std_logic_vector(41 downto 0)--signed result
	);
end rect_calc;

architecture behavior of rect_calc is

--rect0 calc
--weight*([r0+r3]-[r1+r2])

--rect adder0 ... a+d ... result is signed to facilitate signed multiplicaiton
--rect adder1 ... b+c ... result is signedto facilitate signed multiplicaiton
--rect adder2(subtractor) ... adder0_result-adder1_result ... always a positive number since (r0+r3)>(r1+r2) always ... result is signed to facilitate signed multiplicaiton
--rect multiplier (SLL) ... weight determines a scalar and a sign ... result is a signed

signal result_add0: std_logic_vector(25 downto 0); -- MSbit is carry from add0
signal result_add1: std_logic_vector(25 downto 0); -- MSbit is carry from add1
signal result_sub0: std_logic_vector(25 downto 0);
signal result_sub0_extend: std_logic_vector(26 downto 0);

component lpm_add_unsign25bit_to_unsign25bitWithCarry
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (24 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (24 DOWNTO 0);
		cout		: OUT STD_LOGIC ;
		result		: OUT STD_LOGIC_VECTOR (24 DOWNTO 0)
	);
end component;

component lpm_sub_unsign26bit_to_unsign26bit
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (25 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (25 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (25 DOWNTO 0)
	);
end component;

component lpm_mult_sign27bit_sign15bit_to_sign42bit
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (26 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (14 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (41 DOWNTO 0)
	);
end component;

begin

add0: lpm_add_unsign25bit_to_unsign25bitWithCarry
	port map
	(
		dataa => a,
		datab => d,
		cout => result_add0(25),
		result => result_add0(24 downto 0)
	);
	
add1: lpm_add_unsign25bit_to_unsign25bitWithCarry
	port map
	(
		dataa => b,
		datab => c,
		cout => result_add1(25),
		result => result_add1(24 downto 0)
	);

sub0: lpm_sub_unsign26bit_to_unsign26bit
	port map
	(
		dataa => result_add0,
		datab => result_add1,
		result => result_sub0
	);

-- must extend the unsigned sub0 result to a signed result
result_sub0_extend(26) <= '0'; -- MSbit is always positive
result_sub0_extend(25 downto 0) <= result_sub0;

mult0: lpm_mult_sign27bit_sign15bit_to_sign42bit
	port map
	(
		dataa => result_sub0_extend,
		datab => weight,
		result => result
	);
	
end behavior;
