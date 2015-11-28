library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ii_address_decoder is
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
end ii_address_decoder;

architecture behavior of ii_address_decoder is

component rect_mux
	port(
		sel: in std_logic_vector(1 downto 0); -- 2bit unsigned select
		a: in std_logic_vector(4 downto 0); -- 5bit unsigned
		b: in std_logic_vector(4 downto 0); -- 5bit unsigned
		c: in std_logic_vector(4 downto 0); -- 5bit unsigned
		q: out std_logic_vector(4 downto 0) -- 5bit unsigned
	);
end component;

component lpm_add_unsign5bit_to_unsign5bit
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
	);
end component;

component ii_address_calc
	port(
		x_pos_point: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
		y_pos_point: in std_logic_vector(4 downto 0); -- 5bit unsigned ... range(0 to 23)
		width_scale_img: in std_logic_vector(8 downto 0); -- 9bit unsigned ... range(0 to 230)
		p_offset: in std_logic_vector(16 downto 0); -- 16bit unsigned ... range(0 to 76799)
		ii_address: out std_logic_vector(16 downto 0) -- 17bit unsigned ... range(0 to 76799)
	);
end component;

component ii_address_mux
	port(
		sel: in std_logic_vector(1 downto 0); -- 2bit unsigned select
		a: in std_logic_vector(16 downto 0); -- 17bit unsigned
		b: in std_logic_vector(16 downto 0); -- 17bit unsigned
		c: in std_logic_vector(16 downto 0); -- 17bit unsigned
		d: in std_logic_vector(16 downto 0); -- 17bit unsigned
		q: out std_logic_vector(16 downto 0) -- 17bit unsigned
	);
end component;

signal rect_mux_sel: std_logic_vector(1 downto 0);
signal x_rect: std_logic_vector(4 downto 0);
signal y_rect: std_logic_vector(4 downto 0);
signal w_rect: std_logic_vector(4 downto 0);
signal h_rect: std_logic_vector(4 downto 0);

signal x_rect_plus_w_rect: std_logic_vector(4 downto 0);
signal y_rect_plus_h_rect: std_logic_vector(4 downto 0);

signal ii_address_mux_sel: std_logic_vector(1 downto 0);
signal ii_address0: std_logic_vector(16 downto 0);
signal ii_address1: std_logic_vector(16 downto 0);
signal ii_address2: std_logic_vector(16 downto 0);
signal ii_address3: std_logic_vector(16 downto 0);

begin

------------ x_rect mux ---------------

x_rect_mux: rect_mux
	port map
	(
		sel => rect_mux_sel,
		a => x_rect0,
		b => x_rect1,
		c => x_rect2,
		q => x_rect
	);

------------ y_rect mux ---------------

y_rect_mux: rect_mux
	port map
	(
		sel => rect_mux_sel,
		a => y_rect0,
		b => y_rect1,
		c => y_rect2,
		q => y_rect
	);

------------ w_rect mux ---------------

w_rect_mux: rect_mux
	port map
	(
		sel => rect_mux_sel,
		a => w_rect0,
		b => w_rect1,
		c => w_rect2,
		q => w_rect
	);

------------ h_rect mux ---------------

h_rect_mux: rect_mux
	port map
	(
		sel => rect_mux_sel,
		a => h_rect0,
		b => h_rect1,
		c => h_rect2,
		q => h_rect
	);

------------ x_rect + w_rect ----------

add0: lpm_add_unsign5bit_to_unsign5bit
	port map
	(
		dataa => x_rect,
		datab => w_rect,
		result => x_rect_plus_w_rect
	);

------------ y_rect + h_rect ----------

add1: lpm_add_unsign5bit_to_unsign5bit
	port map
	(
		dataa => y_rect,
		datab => h_rect,
		result => y_rect_plus_h_rect
	);

------------ ii_address0 --------------

ii_addr0: ii_address_calc
	port map
	(
		x_pos_point => x_rect,
		y_pos_point => y_rect,
		width_scale_img => width_scale_img,
		p_offset => p_offset,
		ii_address => ii_address0
	);

------------ ii_address1 --------------

ii_addr1: ii_address_calc
	port map
	(
		x_pos_point => x_rect_plus_w_rect,
		y_pos_point => y_rect,
		width_scale_img => width_scale_img,
		p_offset => p_offset,
		ii_address => ii_address1
	);

------------ ii_address2 --------------

ii_addr2: ii_address_calc
	port map
	(
		x_pos_point => x_rect,
		y_pos_point => y_rect_plus_h_rect,
		width_scale_img => width_scale_img,
		p_offset => p_offset,
		ii_address => ii_address2
	);

------------ ii_address3 --------------

ii_addr3: ii_address_calc
	port map
	(
		x_pos_point => x_rect_plus_w_rect,
		y_pos_point => y_rect_plus_h_rect,
		width_scale_img => width_scale_img,
		p_offset => p_offset,
		ii_address => ii_address3
	);

------------ ii_address mux -----------

ii_addr_mux: ii_address_mux
	port map
	(
		sel => ii_address_mux_sel,
		a => ii_address0,
		b => ii_address1,
		c => ii_address2,
		d => ii_address3,
		q => ii_address
	);
	
------------ mux control --------------

mux_control: process (ii_reg_index)
begin
	case ii_reg_index is
		when X"0" =>
			rect_mux_sel <= "00";
			ii_address_mux_sel <= "00";
		when X"1" =>
			rect_mux_sel <= "00";
			ii_address_mux_sel <= "01";
		when X"2" =>
			rect_mux_sel <= "00";
			ii_address_mux_sel <= "10";
		when X"3" =>
			rect_mux_sel <= "00";
			ii_address_mux_sel <= "11";
		when X"4" =>
			rect_mux_sel <= "01";
			ii_address_mux_sel <= "00";
		when X"5" =>
			rect_mux_sel <= "01";
			ii_address_mux_sel <= "01";
		when X"6" =>
			rect_mux_sel <= "01";
			ii_address_mux_sel <= "10";
		when X"7" =>
			rect_mux_sel <= "01";
			ii_address_mux_sel <= "11";
		when X"8" =>
			rect_mux_sel <= "10";
			ii_address_mux_sel <= "00";
		when X"9" =>
			rect_mux_sel <= "10";
			ii_address_mux_sel <= "01";
		when X"A" =>
			rect_mux_sel <= "10";
			ii_address_mux_sel <= "10";
		when X"B" =>
			rect_mux_sel <= "10";
			ii_address_mux_sel <= "11";
		when others =>
			rect_mux_sel <= "00";
			ii_address_mux_sel <= "00";
	end case;
end process;

end behavior;
