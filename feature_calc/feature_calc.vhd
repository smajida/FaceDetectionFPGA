library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity feature_calc is
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
end feature_calc;

architecture behavior of feature_calc is

--rect0 calc
--w0*([r0+r3]-[r1+r2])=result_rect0 ... bit width = WEIGHT_WIDTH+RECT_II_DATA_WIDTH
--rect1 calc
--w1*([r4+r7]-[r5+r6])=result_rect1 ... bit width = WEIGHT_WIDTH+RECT_II_DATA_WIDTH
--rect2 calc
--w2*([r8+r11]-[r9+r10])=result_rect2 ... bit width = WEIGHT_WIDTH+RECT_II_DATA_WIDTH

--result_temp=result_rect0+result_rect1 ... signed + signed ... both could be positive or negative ... WEIGHT_WIDTH+RECT_II_DATA_WIDTH+1
--result_feature=result_temp+result_rect2 ... signed + signed ... both could be positive or negative ... WEIGHT_WIDTH+RECT_II_DATA_WIDTH+2

signal result_rect0: std_logic_vector((WEIGHT_WIDTH+RECT_II_DATA_WIDTH-1) downto 0);
signal result_rect1: std_logic_vector((WEIGHT_WIDTH+RECT_II_DATA_WIDTH-1) downto 0);
signal result_rect2: std_logic_vector((WEIGHT_WIDTH+RECT_II_DATA_WIDTH-1) downto 0);
signal result_rect2_extend: std_logic_vector((WEIGHT_WIDTH+RECT_II_DATA_WIDTH) downto 0);
signal result_temp: std_logic_vector((WEIGHT_WIDTH+RECT_II_DATA_WIDTH) downto 0);

signal c_out0: std_logic;
signal c_out1: std_logic;

component rect_calc
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
end component;

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

begin

rect0: rect_calc
	generic map (WEIGHT_WIDTH=>WEIGHT_WIDTH, RECT_II_DATA_WIDTH=>RECT_II_DATA_WIDTH)
	port map (weight=>w0, a=>r0, b=>r1, c=>r2, d=>r3, result=>result_rect0);

rect1: rect_calc
	generic map (WEIGHT_WIDTH=>WEIGHT_WIDTH, RECT_II_DATA_WIDTH=>RECT_II_DATA_WIDTH)
	port map (weight=>w1, a=>r4, b=>r5, c=>r6, d=>r7, result=>result_rect1);

rect2: rect_calc
	generic map (WEIGHT_WIDTH=>WEIGHT_WIDTH, RECT_II_DATA_WIDTH=>RECT_II_DATA_WIDTH)
	port map (weight=>w2, a=>r8, b=>r9, c=>r10, d=>r11, result=>result_rect2);

adder0: adder_nbit
	generic map (N_BITS=>(WEIGHT_WIDTH+RECT_II_DATA_WIDTH))
	port map (a=>result_rect0,b=>result_rect1,c_in=>'0',c_out=>c_out0,sum=>result_temp((WEIGHT_WIDTH+RECT_II_DATA_WIDTH-1) downto 0));
	result_temp(WEIGHT_WIDTH+RECT_II_DATA_WIDTH)<=c_out0;
	
--must sign extent result_rect2 to match result_temp bit width
result_rect2_extend(WEIGHT_WIDTH+RECT_II_DATA_WIDTH)<=result_rect2(WEIGHT_WIDTH+RECT_II_DATA_WIDTH-1);
result_rect2_extend((WEIGHT_WIDTH+RECT_II_DATA_WIDTH-1) downto 0)<=result_rect2;

adder1: adder_nbit 
	generic map (N_BITS=>(WEIGHT_WIDTH+RECT_II_DATA_WIDTH+1))
	port map (a=>result_rect2_extend,b=>result_temp,c_in=>'0',c_out=>c_out1,sum=>result_feature((WEIGHT_WIDTH+RECT_II_DATA_WIDTH) downto 0));
	result_feature(WEIGHT_WIDTH+RECT_II_DATA_WIDTH+1)<=c_out1;
	
--result_feature<=std_logic_vector(signed(result_rect0)+signed(result_rect1)+signed(result_rect2));--must have signed+signed+1 bit width ... 16+18+1=35

end behavior;
