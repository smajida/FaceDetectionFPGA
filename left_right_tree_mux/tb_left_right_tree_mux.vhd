library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_left_right_tree_mux is
end tb_left_right_tree_mux;

architecture behavior of tb_left_right_tree_mux is
	signal sel: std_logic:='0';
	signal left_val: std_logic_vector(13 downto 0); -- 14bit signed
	signal right_val: std_logic_vector(13 downto 0); -- 14bit signed
	signal q: std_logic_vector(13 downto 0); -- 14bit signed
	
component left_right_tree_mux
	port(
		sel: in std_logic; -- 1bit unsigned select
		left_val: in std_logic_vector(13 downto 0); -- 14bit signed
		right_val: in std_logic_vector(13 downto 0); -- 14bit signed
		q: out std_logic_vector(13 downto 0) -- 14bit signed
	);
end component;
	
begin
	
test_left_right_tree_mux: left_right_tree_mux
	port map (sel=>sel, left_val=>left_val,
				right_val=>right_val, q=>q);
				
dataSim: process
begin

	sel <= '0';
	left_val <= std_logic_vector(to_signed(-2000, 14)); -- (integer value, bit width)
	right_val <= std_logic_vector(to_signed(265, 14)); -- (integer value, bit width)
	wait for 1 us;
	
	sel <= '1';
	left_val <= std_logic_vector(to_signed(-2000, 14)); -- (integer value, bit width)
	right_val <= std_logic_vector(to_signed(265, 14)); -- (integer value, bit width)
	wait for 1 us;
	
	sel <= '0';
	left_val <= std_logic_vector(to_signed(2000, 14)); -- (integer value, bit width)
	right_val <= std_logic_vector(to_signed(-265, 14)); -- (integer value, bit width)
	wait for 1 us;
	
	sel <= '1';
	left_val <= std_logic_vector(to_signed(2000, 14)); -- (integer value, bit width)
	right_val <= std_logic_vector(to_signed(-265, 14)); -- (integer value, bit width)
	wait for 1 us;
	
end process;
	
end behavior;
