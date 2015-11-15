library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder_fullBit is
	port(
	a: in std_logic;
	b: in std_logic;
	c_in: in std_logic;
	c_out: out std_logic;
	sum: out std_logic
	);
end adder_fullBit;

architecture behavior of adder_fullBit is
begin
sum <= a xor b xor c_in;
c_out <= (a and b) or (a and c_in) or (b and c_in);
end behavior;
