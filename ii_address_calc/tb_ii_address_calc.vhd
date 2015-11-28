library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_ii_address_calc is
end tb_ii_address_calc;

architecture behavior of tb_ii_address_calc is
	signal x_pos_point: std_logic_vector(4 downto 0); -- unsigned
	signal y_pos_point: std_logic_vector(4 downto 0); -- unsigned
	signal width_subwin: std_logic_vector(4 downto 0); -- unsigned
	signal p_offset: std_logic_vector(16 downto 0); -- unsigned
	signal ii_address: std_logic_vector(16 downto 0); -- unsigned
	
component ii_address_calc
	port(
		x_pos_point: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
		y_pos_point: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
		width_subwin: in std_logic_vector(4 downto 0); -- 5bit unsigned ... const24
		p_offset: in std_logic_vector(16 downto 0); -- 16bit unsigned ... range(0 to 76799)
		ii_address: out std_logic_vector(16 downto 0) -- 17bit unsigned ... range(0 to 76799)
	);
end component;
	
begin
	
test_ii_address_calc: ii_address_calc
	port map (x_pos_point=>x_pos_point, y_pos_point=>y_pos_point,
				width_subwin=>width_subwin, p_offset=>p_offset, ii_address=>ii_address);
	
dataSim: process
begin

	x_pos_point<=std_logic_vector(to_unsigned(0, 5)); -- (integer value, bit width)
	y_pos_point<=std_logic_vector(to_unsigned(0, 5)); -- (integer value, bit width)
	width_subwin<=std_logic_vector(to_unsigned(24, 5)); -- (integer value, bit width) -- constant 24
	p_offset<=std_logic_vector(to_unsigned(320, 17)); -- (integer value, bit width)
	wait for 1 us;
	
	x_pos_point<=std_logic_vector(to_unsigned(0, 5)); -- (integer value, bit width)
	y_pos_point<=std_logic_vector(to_unsigned(1, 5)); -- (integer value, bit width)
	width_subwin<=std_logic_vector(to_unsigned(24, 5)); -- (integer value, bit width) -- constant 24
	p_offset<=std_logic_vector(to_unsigned(320, 17)); -- (integer value, bit width)
	wait for 1 us;
	
	x_pos_point<=std_logic_vector(to_unsigned(0, 5)); -- (integer value, bit width)
	y_pos_point<=std_logic_vector(to_unsigned(0, 5)); -- (integer value, bit width)
	width_subwin<=std_logic_vector(to_unsigned(24, 5)); -- (integer value, bit width) -- constant 24
	p_offset<=std_logic_vector(to_unsigned(76799, 17)); -- (integer value, bit width)
	wait for 1 us;
	
	x_pos_point<=std_logic_vector(to_unsigned(23, 5)); -- (integer value, bit width)
	y_pos_point<=std_logic_vector(to_unsigned(23, 5)); -- (integer value, bit width)
	width_subwin<=std_logic_vector(to_unsigned(24, 5)); -- (integer value, bit width) -- constant 24
	p_offset<=std_logic_vector(to_unsigned(0, 17)); -- (integer value, bit width)
	wait for 1 us;
	
end process;
	
end behavior;
