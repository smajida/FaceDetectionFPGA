library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_top_faceDetect is
end tb_top_faceDetect;

architecture behavior of tb_top_faceDetect is
	signal reset: std_logic:='1';
	signal clk: std_logic:='0';
	signal clk_memRead: std_logic:='0';
	signal face_detected: std_logic:='0';
	
component top_faceDetect
	port(
		reset: in std_logic; -- reset asserted logic '1'
		clk: in std_logic; -- ______ MHz 
		clk_memRead: in std_logic; -- ______ MHz
		face_detected: out std_logic -- face detection asserts logic '1'
	);
end component;
	
begin
	
test_top_faceDetect: top_faceDetect
	port map (reset => reset,
				clk => clk,
				clk_memRead => clk_memRead,
				face_detected => face_detected);
clkSim: process
begin
	-- 50MHz/4 ... 20ns*4 period
	clk <= '0';
	wait for 10*4 ns;
	clk <= '1';
	wait for 10*4 ns;
end process;

clk_memReadSim: process
begin
	-- 50MHz ... 20ns period
	clk_memRead <= '0';
	wait for 10 ns;
	clk_memRead <= '1';
	wait for 10 ns;
end process;

dataSim: process
begin
	
	--init reset
	reset <= '1';
	wait for 1 us;
	reset <= '0';
	wait;
	
end process;
	
end behavior;
