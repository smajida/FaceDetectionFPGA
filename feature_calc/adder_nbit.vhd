library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_nbit is
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
end adder_nbit;

architecture behavior of adder_nbit is

signal carry: std_logic_vector(N_BITS downto 0);

component adder_fullBit
	port(
	a: in std_logic;
	b: in std_logic;
	c_in: in std_logic;
	c_out: out std_logic;
	sum: out std_logic
	);
end component;

begin

--how to create a generic nbit adder from fullBit
--http://www.alvie.com/zpuino/vhdl4.html
adders: for N in 0 to (N_BITS-1) generate
	adders_fullBit: adder_fullBit
		port map(
		a=>a(N),
		b=>b(N),
		c_in=>carry(N),
		c_out=>carry(N+1),
		sum=>sum(N)
		);
end generate;

carry(0)<=c_in;
	
c_out<=carry(N_BITS);

end behavior;