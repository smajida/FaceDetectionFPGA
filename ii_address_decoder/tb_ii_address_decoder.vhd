library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_ii_address_decoder is
end tb_ii_address_decoder;

architecture behavior of tb_ii_address_decoder is
	signal reset: std_logic:='1';
	signal clk: std_logic:='0';
	signal en: std_logic:='0';
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
		reset: in std_logic;
		clk: in std_logic;
		en: in std_logic;
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
	port map (reset=>reset, clk=>clk,
				en=>en, p_offset=>p_offset,
				x_rect0=>x_rect0, x_rect1=>x_rect1, x_rect2=>x_rect2,
				y_rect0=>y_rect0, y_rect1=>y_rect1, y_rect2=>y_rect2,
				w_rect0=>w_rect0, w_rect1=>w_rect1, w_rect2=>w_rect2,
				h_rect0=>h_rect0, h_rect1=>h_rect1, h_rect2=>h_rect2,
				ii_address=>ii_address);

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

	reset <= '1';	-- reset, not enabled
	en <= '0';
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
	
	reset <= '0';	-- not enabled
	en <= '0';
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
	
	reset <= '0';	-- enabled
	en <= '1';
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
	
	reset <= '0';	-- enabled
	en <= '1';
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
	
	reset <= '0';	-- enabled
	en <= '1';
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
	
	reset <= '0';	-- enabled
	en <= '1';
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
