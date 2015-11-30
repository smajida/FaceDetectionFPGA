library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pixel_offset is
	port(
		x_pos_subwin: in std_logic_vector(8 downto 0); -- 9bit unsigned ... range(0 to 319)
		y_pos_subwin: in std_logic_vector(7 downto 0); -- 8bit unsigned ... range(0 to 239)
		width_scale_img: in std_logic_vector(8 downto 0); -- 9bit unsigned ... range(0 to 320)
		p_offset: out std_logic_vector(16 downto 0) -- 17bit unsigned ... range(0 to 76799)
	);
end pixel_offset;

architecture behavior of pixel_offset is

component lpm_mult_unsign8bit_unsign9bit_to_unsign17bit
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (16 DOWNTO 0)
	);
end component;

component lpm_add_unsign17bit_to_unsign17bit
	port
	(
		dataa		: IN STD_LOGIC_VECTOR (16 DOWNTO 0);
		datab		: IN STD_LOGIC_VECTOR (16 DOWNTO 0);
		result		: OUT STD_LOGIC_VECTOR (16 DOWNTO 0)
	);
end component;

signal x_pos_subwin_extend: std_logic_vector(16 downto 0); -- 17bit unsigned
signal result_mult0: std_logic_vector(16 downto 0); -- 17bit unsigned

begin

mult0: lpm_mult_unsign8bit_unsign9bit_to_unsign17bit
	port map
	(
		dataa => y_pos_subwin,
		datab => width_scale_img,
		result => result_mult0
	);

x_pos_subwin_extend(16 downto 9) <= (others=>'0'); -- unsigned always positive
x_pos_subwin_extend(8 downto 0) <= x_pos_subwin;
	
add0: lpm_add_unsign17bit_to_unsign17bit
	port map
	(
		dataa => result_mult0,
		datab => x_pos_subwin_extend,
		result => p_offset
	);

end behavior;
