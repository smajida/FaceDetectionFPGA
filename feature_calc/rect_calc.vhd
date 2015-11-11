library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rect_calc is
	generic (
	WEIGHT_WIDTH			: integer := 16;--TBD
	RECT_II_DATA_WIDTH	: integer := 18
	);
	port(
	weight: in std_logic_vector((WEIGHT_WIDTH-1) downto 0);--signed input
	a: in std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);--signed input
	b: in std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);--signed input
	c: in std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);--signed input
	d: in std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);--signed input
	--maximum signed multiplier output requires a bit width of (multiplier_bit_width+multplicand_bit_width)
	result: out std_logic_vector((WEIGHT_WIDTH+RECT_II_DATA_WIDTH-1) downto 0)
	);
end rect_calc;

architecture behavior of rect_calc is

--rect0 calc
--weight*([r0+r3]-[r1+r2])

--rect adder0 ... a+d ... result is signed to facilitate signed multiplicaiton
--rect adder1 ... b+c ... result is signedto facilitate signed multiplicaiton
--rect adder2(subtractor) ... adder0_result-adder1_result ... always a positive number since (r0+r3)>(r1+r2) always ... result is signed to facilitate signed multiplicaiton
--rect multiplier (SLL) ... weight determines a scalar and a sign ... result is a signed

component adder_nbit
	generic(
	N_BITS	: integer := 8
	);
	port(
	a: in std_logic_vector((N_BITS-1) downto 0);
	b: in std_logic_vector((N_BITS-1) downto 0);
	c_in: in std_logic;
	c_out: out std_logic;
	sum: out std_logic_vector((N_BITS-1) downto 0)
	);
end component;

signal not_sum1: std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);

signal c_out0: std_logic;
signal c_out1: std_logic;
signal c_out2: std_logic;
signal sum0: std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);
signal sum1: std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);
signal sum2: std_logic_vector((RECT_II_DATA_WIDTH-1) downto 0);

begin
	--signed inputs
	adder0: adder_nbit
		generic map (N_BITS=>RECT_II_DATA_WIDTH)
		port map (a=>a,b=>d,c_in=>'0',c_out=>c_out0,sum=>sum0);
	
	--signed inputs
	adder1: adder_nbit
		generic map (N_BITS=>RECT_II_DATA_WIDTH)
		port map (a=>b,b=>c,c_in=>'0',c_out=>c_out1,sum=>sum1);
	
	not_sum1 <= not sum1;
	
	--input sum0 ... signed, always positive
	--input sum1 ... signed, always positive
	--output sum2 ... signed w/ same bit width since overflow will never occur
	adder2: adder_nbit
		generic map (N_BITS=>RECT_II_DATA_WIDTH)
		port map (a=>sum0,b=> not_sum1,c_in=>'1',c_out=>c_out2,sum=>sum2);--carry in is constant '1', input b=inv(sum1)
	
	--multiplier
	--https://en.wikibooks.org/wiki/VHDL_for_FPGA_Design/4-Bit_Multiplier
	result <= std_logic_vector(signed(sum2) * signed(weight));--signed result
	
end behavior;
