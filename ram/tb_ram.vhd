library ieee, altera;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_ram is
end tb_ram;

architecture testbench of tb_ram is

signal data: std_logic_vector(17 DOWNTO 0);
signal rdaddress: std_logic_vector(9 DOWNTO 0);
signal rdclock: std_logic:= '0';
signal wraddress: std_logic_vector(9 DOWNTO 0);
signal wrclock: std_logic:= '0';
signal we: std_logic:= '0';
signal re: std_logic:= '0';
signal q: std_logic_vector(17 DOWNTO 0);

component top_ram
generic (
	ADDR_WIDTH					: integer := 10;        
	DATA_WIDTH					: integer := 18;
	MAX_PRELOAD_ADDRESS		: integer := 575;
	MEM_FILE_NAME	: string :="fileName.txt");
port(
	data: IN std_logic_vector ((DATA_WIDTH-1) DOWNTO 0);
	rdaddress: IN STD_logic_vector((ADDR_WIDTH-1) downto 0);
	rdclock: IN STD_LOGIC;
	wraddress: IN STD_logic_vector((ADDR_WIDTH-1) downto 0);
	wrclock: IN STD_LOGIC;
	we: IN STD_LOGIC;
	re: IN STD_LOGIC;
	q: OUT std_logic_vector ((DATA_WIDTH-1) DOWNTO 0));
end component;

begin

test_ram: top_ram 
generic map (ADDR_WIDTH=>10,DATA_WIDTH=>18,
				MAX_PRELOAD_ADDRESS=>575)--,MEM_FILE_NAME=>"fileName.txt")
port map (data=>data,rdaddress=>rdaddress,
			rdclock=>rdclock,wraddress=>wraddress,
			wrclock=>wrclock,we=>we,re=>re,q=>q);

memWriteClock: process
begin
wrclock <= '0';
wait for 10 us;
wrclock <= '1';
wait for 10 us;
end process;
			
memReadClock: process
begin
rdclock <= '0';
wait for 100 ns;
rdclock <= '1';
wait for 100 ns;
end process;

rdaddress <= wraddress;--

dataWrite: process
begin

wait for 5 us;

------------------we='0' re='1'
data <= "000000000000000001";
wraddress <= "0000000001";
we <= '0';
re <= '1';
wait for 20 us;

data <= "000000000000000010";
wraddress <= "0000000010";
we <= '0';
re <= '1';
wait for 20 us;

data <= "000000000000000011";
wraddress <= "0000000011";
we <= '0';
re <= '1';
wait for 20 us;

data <= "000000000000000100";
wraddress <= "0000000100";
we <= '0';
re <= '1';
wait for 20 us;

data <= "000000000000000101";
wraddress <= "0000000101";
we <= '0';
re <= '1';
wait for 20 us;

---------------------we='1' re = '0'
data <= "000000000000000001";
wraddress <= "0000000001";
we <= '1';
re <= '0';
wait for 20 us;

data <= "000000000000000010";
wraddress <= "0000000010";
we <= '1';
re <= '0';
wait for 20 us;

data <= "000000000000000011";
wraddress <= "0000000011";
we <= '1';
re <= '0';
wait for 20 us;

data <= "000000000000000100";
wraddress <= "0000000100";
we <= '1';
re <= '0';
wait for 20 us;

data <= "000000000000000101";
wraddress <= "0000000101";
we <= '1';
re <= '0';
wait for 20 us;
---------------------we='0' re = '1'
data <= "000000000000000001";
wraddress <= "0000000001";
we <= '0';
re <= '1';
wait for 20 us;

data <= "000000000000000010";
wraddress <= "0000000010";
we <= '0';
re <= '1';
wait for 20 us;

data <= "000000000000000011";
wraddress <= "0000000011";
we <= '0';
re <= '1';
wait for 20 us;

data <= "000000000000000100";
wraddress <= "0000000100";
we <= '0';
re <= '1';
wait for 20 us;

data <= "000000000000000101";
wraddress <= "0000000101";
we <= '0';
re <= '1';
wait for 20 us;
---------------------we='1' re = '1'
data <= "001111000000000001";
wraddress <= "0000000001";
we <= '1';
re <= '1';
wait for 20 us;

data <= "001111000000000010";
wraddress <= "0000000010";
we <= '1';
re <= '1';
wait for 20 us;

data <= "001111000000000011";
wraddress <= "0000000011";
we <= '1';
re <= '1';
wait for 20 us;

data <= "001111000000000100";
wraddress <= "0000000100";
we <= '1';
re <= '1';
wait for 20 us;

data <= "001111000000000101";
wraddress <= "0000000101";
we <= '1';
re <= '1';
wait for 20 us;

wait for 15 us;

end process;

end testbench;
