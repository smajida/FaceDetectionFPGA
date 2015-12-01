library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_strong_accumulator is
end tb_strong_accumulator;

architecture behavior of tb_strong_accumulator is
	signal reset: std_logic:='1';
	signal en: std_logic;
	signal clk: std_logic:='0';
	signal din: std_logic_vector(13 downto 0); -- 14bit signed ... range(-7680 to 2560)
	signal dout: std_logic_vector(21 downto 0);
	
component strong_accumulator
	port(
		reset: in std_logic; -- async reset
		en: in std_logic;
		clk: in std_logic; -- 
		din: in std_logic_vector(13 downto 0); -- 14bit signed
		dout: out std_logic_vector(21 downto 0) -- 22bit signed
	);
end component;
	
begin
	
test_strong_accumulator: strong_accumulator
	port map (reset=>reset, 
				en => en,
				clk=>clk,
				din=>din,
				dout=>dout);

clk_gen: process
begin
	wait for 250 ns;
	clk <= '1';
	wait for 500 ns;
	clk <= '0';
	wait for 250 ns;
end process;
				
dataSim: process
begin

	reset <= '1';	-- reset
	en <= '0';
	din <= std_logic_vector(to_signed(20, 14)); -- (integer value, bit width)
	wait for 1 us;
	
	reset <= '0';	-- not reset
	en <= '0';
	din <= std_logic_vector(to_signed(-7680, 14)); -- (integer value, bit width)
	wait for 1 us;
	
	reset <= '0';	-- not reset
	en <= '1';
	din <= std_logic_vector(to_signed(2560, 14)); -- (integer value, bit width)
	wait for 1 us;
	
	reset <= '0';	-- not reset
	en <= '1';
	din <= std_logic_vector(to_signed(55, 14)); -- (integer value, bit width)
	wait for 1 us;
	
	reset <= '0';	-- not reset
	en <= '1';
	din <= std_logic_vector(to_signed(1000, 14)); -- (integer value, bit width)
	wait for 1 us;
	
	reset <= '0';	-- not reset
	en <= '1';
	din <= std_logic_vector(to_signed(-2500, 14)); -- (integer value, bit width)
	wait for 1 us;
	
	reset <= '0';	-- not reset
	en <= '1';
	din <= std_logic_vector(to_signed(111, 14)); -- (integer value, bit width)
	wait for 1 us;
	
	reset <= '0';	-- not reset
	en <= '1';
	din <= std_logic_vector(to_signed(2121, 14)); -- (integer value, bit width)
	wait for 1 us;
	
end process;
	
end behavior;
