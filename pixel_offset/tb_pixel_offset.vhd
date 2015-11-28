library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_pixel_offset is
end tb_pixel_offset;

architecture behavior of tb_pixel_offset is
	signal x_pos_subwin: std_logic_vector(8 downto 0); -- unsigned
	signal y_pos_subwin: std_logic_vector(7 downto 0); -- unsigned
	signal width_scale_img: std_logic_vector(8 downto 0); -- unsigned
	signal p_offset: std_logic_vector(16 downto 0); -- unsigned
	
component pixel_offset
	port(
		x_pos_subwin: in std_logic_vector(8 downto 0); -- 9bit unsigned ... range(0 to 319)
		y_pos_subwin: in std_logic_vector(7 downto 0); -- 8bit unsigned ... range(0 to 239)
		width_scale_img: in std_logic_vector(8 downto 0); -- 9bit unsigned ... range(0 to 320)
		p_offset: out std_logic_vector(16 downto 0) -- 14bit unsigned ... range(0 to 76799)
	);
end component;
	
begin
	
test_pixel_offset: pixel_offset
	port map (x_pos_subwin=>x_pos_subwin, y_pos_subwin=>y_pos_subwin,
				width_scale_img=>width_scale_img, p_offset=>p_offset);
	
dataSim: process
begin

	x_pos_subwin<=std_logic_vector(to_unsigned(319, 9)); -- (integer value, bit width)
	y_pos_subwin<=std_logic_vector(to_unsigned(239, 8)); -- (integer value, bit width)
	width_scale_img<=std_logic_vector(to_unsigned(320, 9)); -- (integer value, bit width)
	wait for 1 us;
	
	x_pos_subwin<=std_logic_vector(to_unsigned(1, 9)); -- (integer value, bit width)
	y_pos_subwin<=std_logic_vector(to_unsigned(1, 8)); -- (integer value, bit width)
	width_scale_img<=std_logic_vector(to_unsigned(1, 9)); -- (integer value, bit width)
	wait for 1 us;
	
	x_pos_subwin<=std_logic_vector(to_unsigned(0, 9)); -- (integer value, bit width)
	y_pos_subwin<=std_logic_vector(to_unsigned(0, 8)); -- (integer value, bit width)
	width_scale_img<=std_logic_vector(to_unsigned(320, 9)); -- (integer value, bit width)
	wait for 1 us;
	
	x_pos_subwin<=std_logic_vector(to_unsigned(0, 9)); -- (integer value, bit width)
	y_pos_subwin<=std_logic_vector(to_unsigned(1, 8)); -- (integer value, bit width)
	width_scale_img<=std_logic_vector(to_unsigned(320, 9)); -- (integer value, bit width)
	wait for 1 us;
	
end process;
	
end behavior;
