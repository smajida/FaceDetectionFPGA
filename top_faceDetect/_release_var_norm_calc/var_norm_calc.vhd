library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity var_norm_calc is
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
end var_norm_calc;

architecture behavior of var_norm_calc is

signal result_add0: std_logic_vector(25 downto 0); -- MSbit is carry from add0
signal result_add1: std_logic_vector(25 downto 0); -- MSbit is carry from add1
signal result_sub0: std_logic_vector(25 downto 0);
signal result_mult0: std_logic_vector(51 downto 0);
signal result_mult0_extend: std_logic_vector(52 downto 0);

signal result_add2: std_logic_vector(33 downto 0); -- MSbit is carry from add0
signal result_add3: std_logic_vector(33 downto 0); -- MSbit is carry from add1
signal result_sub1: std_logic_vector(33 downto 0);

signal result_divide0: std_logic_vector(33 downto 0);
signal result_divide0_extend: std_logic_vector(52 downto 0);
signal result_divide0_remainder: std_logic_vector(9 downto 0);

signal result_sub2: std_logic_vector(53 downto 0); --MSB is ...
signal result_sub2_cout: std_logic; --

signal result_sqrt0: std_logic_vector(26 downto 0);
signal result_sqrt0_remainder: std_logic_vector(27 downto 0);

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

component lpm_mult_unsign26bit_unsign26bit_to_unsign52bit
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (25 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (25 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (51 DOWNTO 0)
	);
end component;

component lpm_add_unsign33bit_to_unsign33bitWithCarry
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (32 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (32 DOWNTO 0);
		cout		: OUT STD_LOGIC ;
		result		: OUT STD_LOGIC_VECTOR (32 DOWNTO 0)
	);
end component;

component lpm_sub_unsign34bit_to_unsign34bit
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (33 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (33 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (33 DOWNTO 0)
	);
end component;

component lpm_divide_unsign34bit_unsign10bit_to_unsign34bit
	port
	(
		denom		: IN STD_LOGIC_VECTOR (9 DOWNTO 0);
		numer		: IN STD_LOGIC_VECTOR (33 DOWNTO 0);
		quotient		: OUT STD_LOGIC_VECTOR (33 DOWNTO 0);
		remain		: OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
	);
end component;

component lpm_sub_sign53bit_to_sign53bitWithBorrow
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (52 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (52 DOWNTO 0);
		cout		: OUT STD_LOGIC ;
		result		: OUT STD_LOGIC_VECTOR (52 DOWNTO 0)
	);
end component;

component altsqrt_unsign54bit_to_usign54bit
	port
	(
		radical		: IN STD_LOGIC_VECTOR (53 DOWNTO 0);
		q		: OUT STD_LOGIC_VECTOR (26 DOWNTO 0);
		remainder		: OUT STD_LOGIC_VECTOR (27 DOWNTO 0)
	);
end component;

begin

-------------- m -----------------------------

add0: lpm_add_unsign25bit_to_unsign25bitWithCarry
	port map
	(
		dataa => p0,
		datab => p3,
		cout => result_add0(25),
		result => result_add0(24 downto 0)
	);
	
add1: lpm_add_unsign25bit_to_unsign25bitWithCarry
	port map
	(
		dataa => p1,
		datab => p2,
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
	
-------------- m^2 ---------------------------

mult0: lpm_mult_unsign26bit_unsign26bit_to_unsign52bit
	port map
	(
		dataa => result_sub0,
		datab => result_sub0,
		result => result_mult0
	);
	
result_mult0_extend(52) <= '0'; -- always positive
result_mult0_extend(51 downto 0) <= result_mult0;

-------------- sum(x^2) ----------------------

add2: lpm_add_unsign33bit_to_unsign33bitWithCarry
	port map
	(
		dataa => ssp0,
		datab => ssp3,
		cout => result_add2(33),
		result => result_add2(32 downto 0)
	);

add3: lpm_add_unsign33bit_to_unsign33bitWithCarry
	port map
	(
		dataa => ssp1,
		datab => ssp2,
		cout => result_add3(33),
		result => result_add3(32 downto 0)
	);
	
sub1: lpm_sub_unsign34bit_to_unsign34bit
	port map
	(
		dataa => result_add2,
		datab => result_add3,
		result => result_sub1
	);
	
-------------- sum(x^2)/n --------------------

divide0: lpm_divide_unsign34bit_unsign10bit_to_unsign34bit
	port map
	(
		denom => std_logic_vector(to_unsigned(24*24, 10)), -- (integer value, bit width)
		numer => result_sub1,
		quotient => result_divide0,
		remain => result_divide0_remainder
	);

-- extend result_divide0 -- always positive ... extended bits are all zero for signed vale
result_divide0_extend(52 downto 34) <= std_logic_vector(to_unsigned(0, 52-33)); -- (integer value, bit width)
result_divide0_extend(33 downto 0) <= result_divide0;

-------------- m^2 - sum(x^2)/n --------------
	
sub2: lpm_sub_sign53bit_to_sign53bitWithBorrow
	port map
	(
		dataa => result_mult0_extend,
		datab => result_divide0_extend,
		cout => result_sub2_cout,
		result => result_sub2(52 downto 0)
	); -- if cout==borrow=='1' then borrow has occured, which means dataa<datab ... negative result	

-------------- sqrt(m^2 - sum(x^2)/n) --------

sqrt0: altsqrt_unsign54bit_to_usign54bit
	port map
	(
		radical => result_sub2,
		q => result_sqrt0,
		remainder => result_sqrt0_remainder
	);

-------------- sqrt mux --------------

result_sub2(53) <= '0'; -- should always be positive ???

result_mux: process (result_sub2(52), result_sqrt0)
begin
	if ( result_sub2(52) = '0') then
		var_norm_factor <= result_sqrt0;
	else
		var_norm_factor <= std_logic_vector(to_unsigned(1, 27)); -- (integer value, bit width)
	end if;
end process;
	
end behavior;
