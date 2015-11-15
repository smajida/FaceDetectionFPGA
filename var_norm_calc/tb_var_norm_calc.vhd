library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_var_norm_calc is
end tb_var_norm_calc;

architecture behavior of tb_var_norm_calc is
	signal p0: std_logic_vector(24 downto 0); -- unsigned
	signal p1: std_logic_vector(24 downto 0); -- unsigned
	signal p2: std_logic_vector(24 downto 0); -- unsigned
	signal p3: std_logic_vector(24 downto 0); -- unsigned
	signal ssp0: std_logic_vector(32 downto 0); -- unsigned
	signal ssp1: std_logic_vector(32 downto 0); -- unsigned
	signal ssp2: std_logic_vector(32 downto 0); -- unsigned
	signal ssp3: std_logic_vector(32 downto 0); -- unsigned
	signal var_norm_factor: std_logic_vector(26 downto 0); -- signed??
	
component var_norm_calc
	port(
		p0: in std_logic_vector(24 downto 0); -- unsigned
		p1: in std_logic_vector(24 downto 0); -- unsigned
		p2: in std_logic_vector(24 downto 0); -- unsigned
		p3: in std_logic_vector(24 downto 0); -- unsigned
		ssp0: in std_logic_vector(32 downto 0); -- unsigned
		ssp1: in std_logic_vector(32 downto 0); -- unsigned
		ssp2: in std_logic_vector(32 downto 0); -- unsigned
		ssp3: in std_logic_vector(32 downto 0); -- unsigned
		var_norm_factor: out std_logic_vector(26 downto 0) -- signed??
	);
end component;
	
begin
	
test_var_norm_calc: var_norm_calc
	port map (p0=>p0, p1=>p1, p2=>p2, p3=>p3,
				ssp0=>ssp0, ssp1=>ssp1, ssp2=>ssp2, ssp3=>ssp3,
				var_norm_factor=>var_norm_factor);
	
dataSim: process
begin

	p0<=std_logic_vector(to_unsigned(48, 25)); -- (integer value, bit width)
	p1<=std_logic_vector(to_unsigned(1132, 25)); -- (integer value, bit width)
	p2<=std_logic_vector(to_unsigned(1198, 25)); -- (integer value, bit width)
	p3<=std_logic_vector(to_unsigned(27343, 25)); -- (integer value, bit width)
	ssp0<=std_logic_vector(to_unsigned(2304, 33)); -- (integer value, bit width)
	ssp1<=std_logic_vector(to_unsigned(53982, 33)); -- (integer value, bit width)
	ssp2<=std_logic_vector(to_unsigned(60436, 33)); -- (integer value, bit width)
	ssp3<=std_logic_vector(to_unsigned(1312875, 33)); -- (integer value, bit width)
	wait for 1 us;
	
end process;
	
end behavior;
