library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_ii_address_decoder is
end tb_ii_address_decoder;

architecture behavior of tb_ii_address_decoder is
	signal ii_reg_index: std_logic_vector(3 downto 0); -- 4bit unsigned ... range 0 to 11
	signal width_scale_img: std_logic_vector (8 downto 0); -- 9bit unsigned ... range(0 to 320)
	signal p_offset: std_logic_vector(16 downto 0); -- 17bit unsigned ... range(0 to 76799)
	signal x_rect0: std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
	signal x_rect1: std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
	signal x_rect2: std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
	signal y_rect0: std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
	signal y_rect1: std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
	signal y_rect2: std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
	signal w_rect0: std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 24)
	signal w_rect1: std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 24)
	signal w_rect2: std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 24)
	signal h_rect0: std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 24)
	signal h_rect1: std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 24)
	signal h_rect2: std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 24)
	signal ii_address: std_logic_vector(16 downto 0); -- 17bit unsigned ... range(0 to 76799)
	
component ii_address_decoder
	port(
		ii_reg_index: in std_logic_vector(3 downto 0); -- 4bit unsigned ... range 0 to 11
		width_scale_img: in std_logic_vector (8 downto 0); -- 9bit unsigned ... range(0 to 320)
		p_offset: in std_logic_vector(16 downto 0); -- 17bit unsigned ... range(0 to 76799)
		x_rect0: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
		x_rect1: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
		x_rect2: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
		y_rect0: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
		y_rect1: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
		y_rect2: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
		w_rect0: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 24)
		w_rect1: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 24)
		w_rect2: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 24)
		h_rect0: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 24)
		h_rect1: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 24)
		h_rect2: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 24)
		ii_address: out std_logic_vector(16 downto 0) -- 17bit unsigned ... range(0 to 76799)
	);
end component;
	
begin
	
test_ii_address_decoder: ii_address_decoder
	port map (
				ii_reg_index=>ii_reg_index,
				width_scale_img=>width_scale_img,
				p_offset=>p_offset,
				x_rect0=>x_rect0, x_rect1=>x_rect1, x_rect2=>x_rect2,
				y_rect0=>y_rect0, y_rect1=>y_rect1, y_rect2=>y_rect2,
				w_rect0=>w_rect0, w_rect1=>w_rect1, w_rect2=>w_rect2,
				h_rect0=>h_rect0, h_rect1=>h_rect1, h_rect2=>h_rect2,
				ii_address=>ii_address);
				
dataSim: process
begin

	ii_reg_index <= std_logic_vector(to_unsigned(0, 4));
	width_scale_img <= std_logic_vector(to_unsigned(320, 9));
	p_offset <= std_logic_vector(to_unsigned(20, 17)); -- (integer value, bit width)
	x_rect0 <= std_logic_vector(to_unsigned(1, 5));
	x_rect1 <= std_logic_vector(to_unsigned(2, 5));
	x_rect2 <= std_logic_vector(to_unsigned(3, 5));
	y_rect0 <= std_logic_vector(to_unsigned(4, 5));
	y_rect1 <= std_logic_vector(to_unsigned(5, 5));
	y_rect2 <= std_logic_vector(to_unsigned(6, 5));
	w_rect0 <= std_logic_vector(to_unsigned(7, 5));
	w_rect1 <= std_logic_vector(to_unsigned(8, 5));
	w_rect2 <= std_logic_vector(to_unsigned(9, 5));
	h_rect0 <= std_logic_vector(to_unsigned(10, 5));
	h_rect1 <= std_logic_vector(to_unsigned(11, 5));
	h_rect2 <= std_logic_vector(to_unsigned(12, 5));
	wait for 1 us;
	
	ii_reg_index <= std_logic_vector(to_unsigned(1, 4));
	width_scale_img <= std_logic_vector(to_unsigned(320, 9));
	p_offset <= std_logic_vector(to_unsigned(20, 17)); -- (integer value, bit width)
	x_rect0 <= std_logic_vector(to_unsigned(1, 5));
	x_rect1 <= std_logic_vector(to_unsigned(2, 5));
	x_rect2 <= std_logic_vector(to_unsigned(3, 5));
	y_rect0 <= std_logic_vector(to_unsigned(4, 5));
	y_rect1 <= std_logic_vector(to_unsigned(5, 5));
	y_rect2 <= std_logic_vector(to_unsigned(6, 5));
	w_rect0 <= std_logic_vector(to_unsigned(7, 5));
	w_rect1 <= std_logic_vector(to_unsigned(8, 5));
	w_rect2 <= std_logic_vector(to_unsigned(9, 5));
	h_rect0 <= std_logic_vector(to_unsigned(10, 5));
	h_rect1 <= std_logic_vector(to_unsigned(11, 5));
	h_rect2 <= std_logic_vector(to_unsigned(12, 5));
	wait for 1 us;
	
	ii_reg_index <= std_logic_vector(to_unsigned(2, 4));
	width_scale_img <= std_logic_vector(to_unsigned(320, 9));
	p_offset <= std_logic_vector(to_unsigned(20, 17)); -- (integer value, bit width)
	x_rect0 <= std_logic_vector(to_unsigned(1, 5));
	x_rect1 <= std_logic_vector(to_unsigned(2, 5));
	x_rect2 <= std_logic_vector(to_unsigned(3, 5));
	y_rect0 <= std_logic_vector(to_unsigned(4, 5));
	y_rect1 <= std_logic_vector(to_unsigned(5, 5));
	y_rect2 <= std_logic_vector(to_unsigned(6, 5));
	w_rect0 <= std_logic_vector(to_unsigned(7, 5));
	w_rect1 <= std_logic_vector(to_unsigned(8, 5));
	w_rect2 <= std_logic_vector(to_unsigned(9, 5));
	h_rect0 <= std_logic_vector(to_unsigned(10, 5));
	h_rect1 <= std_logic_vector(to_unsigned(11, 5));
	h_rect2 <= std_logic_vector(to_unsigned(12, 5));
	wait for 1 us;
	
	ii_reg_index <= std_logic_vector(to_unsigned(3, 4));
	width_scale_img <= std_logic_vector(to_unsigned(320, 9));
	p_offset <= std_logic_vector(to_unsigned(20, 17)); -- (integer value, bit width)
	x_rect0 <= std_logic_vector(to_unsigned(1, 5));
	x_rect1 <= std_logic_vector(to_unsigned(2, 5));
	x_rect2 <= std_logic_vector(to_unsigned(3, 5));
	y_rect0 <= std_logic_vector(to_unsigned(4, 5));
	y_rect1 <= std_logic_vector(to_unsigned(5, 5));
	y_rect2 <= std_logic_vector(to_unsigned(6, 5));
	w_rect0 <= std_logic_vector(to_unsigned(7, 5));
	w_rect1 <= std_logic_vector(to_unsigned(8, 5));
	w_rect2 <= std_logic_vector(to_unsigned(9, 5));
	h_rect0 <= std_logic_vector(to_unsigned(10, 5));
	h_rect1 <= std_logic_vector(to_unsigned(11, 5));
	h_rect2 <= std_logic_vector(to_unsigned(12, 5));
	wait for 1 us;
	
	ii_reg_index <= std_logic_vector(to_unsigned(4, 4));
	width_scale_img <= std_logic_vector(to_unsigned(320, 9));
	p_offset <= std_logic_vector(to_unsigned(20, 17)); -- (integer value, bit width)
	x_rect0 <= std_logic_vector(to_unsigned(1, 5));
	x_rect1 <= std_logic_vector(to_unsigned(2, 5));
	x_rect2 <= std_logic_vector(to_unsigned(3, 5));
	y_rect0 <= std_logic_vector(to_unsigned(4, 5));
	y_rect1 <= std_logic_vector(to_unsigned(5, 5));
	y_rect2 <= std_logic_vector(to_unsigned(6, 5));
	w_rect0 <= std_logic_vector(to_unsigned(7, 5));
	w_rect1 <= std_logic_vector(to_unsigned(8, 5));
	w_rect2 <= std_logic_vector(to_unsigned(9, 5));
	h_rect0 <= std_logic_vector(to_unsigned(10, 5));
	h_rect1 <= std_logic_vector(to_unsigned(11, 5));
	h_rect2 <= std_logic_vector(to_unsigned(12, 5));
	wait for 1 us;
	
	ii_reg_index <= std_logic_vector(to_unsigned(11, 4));
	width_scale_img <= std_logic_vector(to_unsigned(320, 9));
	p_offset <= std_logic_vector(to_unsigned(20, 17)); -- (integer value, bit width)
	x_rect0 <= std_logic_vector(to_unsigned(1, 5));
	x_rect1 <= std_logic_vector(to_unsigned(2, 5));
	x_rect2 <= std_logic_vector(to_unsigned(3, 5));
	y_rect0 <= std_logic_vector(to_unsigned(4, 5));
	y_rect1 <= std_logic_vector(to_unsigned(5, 5));
	y_rect2 <= std_logic_vector(to_unsigned(6, 5));
	w_rect0 <= std_logic_vector(to_unsigned(7, 5));
	w_rect1 <= std_logic_vector(to_unsigned(8, 5));
	w_rect2 <= std_logic_vector(to_unsigned(9, 5));
	h_rect0 <= std_logic_vector(to_unsigned(10, 5));
	h_rect1 <= std_logic_vector(to_unsigned(11, 5));
	h_rect2 <= std_logic_vector(to_unsigned(12, 5));
	wait for 1 us;
	
end process;
	
end behavior;
