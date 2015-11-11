library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench_register_file is
end testbench_register_file;

architecture behavior of testbench_register_file is

	signal clk: std_logic:= '0';
	signal write_en: std_logic:= '1';
	signal write_reg_addr: std_logic_vector(3 downto 0):= (others=>'0');
	signal write_data: std_logic_vector(17 downto 0):= (others=>'0');
	signal q0: std_logic_vector(17 downto 0);
	signal q1: std_logic_vector(17 downto 0);
	signal q2: std_logic_vector(17 downto 0);
	signal q3: std_logic_vector(17 downto 0);
	signal q4: std_logic_vector(17 downto 0);
	signal q5: std_logic_vector(17 downto 0);
	signal q6: std_logic_vector(17 downto 0);
	signal q7: std_logic_vector(17 downto 0);
	signal q8: std_logic_vector(17 downto 0);
	signal q9: std_logic_vector(17 downto 0);
	signal q10: std_logic_vector(17 downto 0);
	signal q11: std_logic_vector(17 downto 0);
	
	component register_file
	generic (
		ADDR_WIDTH	: integer := 4;
		DATA_WIDTH	: integer := 18
	);
	port(
		clk: in std_logic;
		write_en: in std_logic;
		write_reg_addr: in std_logic_vector((ADDR_WIDTH-1) downto 0);
		write_data: in std_logic_vector((DATA_WIDTH-1) downto 0);
		q0: out std_logic_vector((DATA_WIDTH-1) downto 0);
		q1: out std_logic_vector((DATA_WIDTH-1) downto 0);
		q2: out std_logic_vector((DATA_WIDTH-1) downto 0);
		q3: out std_logic_vector((DATA_WIDTH-1) downto 0);
		q4: out std_logic_vector((DATA_WIDTH-1) downto 0);
		q5: out std_logic_vector((DATA_WIDTH-1) downto 0);
		q6: out std_logic_vector((DATA_WIDTH-1) downto 0);
		q7: out std_logic_vector((DATA_WIDTH-1) downto 0);
		q8: out std_logic_vector((DATA_WIDTH-1) downto 0);
		q9: out std_logic_vector((DATA_WIDTH-1) downto 0);
		q10: out std_logic_vector((DATA_WIDTH-1) downto 0);
		q11: out std_logic_vector((DATA_WIDTH-1) downto 0)
	);
	end component;
	
begin
	
	test_register_file: register_file
		generic map (ADDR_WIDTH=>4,DATA_WIDTH=>18)
		port map(clk=>clk,write_en=>write_en,write_reg_addr=>write_reg_addr,write_data=>write_data,
					q0=>q0,q1=>q1,q2=>q2,q3=>q3,q4=>q4,q5=>q5,
					q6=>q6,q7=>q7,q8=>q8,q9=>q9,q10=>q10,q11=>q11);
	
	dataSim: process
	begin
	
	--test1 ... write reg0
	write_en <= '1';
	write_reg_addr<= "0000";
	write_data<= "000000000000001111";
	wait for 5 us;
	clk <= '1';
	wait for 10 us;
	clk <= '0';
	wait for 5 us;
	
	--test2 ... write reg5
	write_en <= '1';
	write_reg_addr<= "0101";
	write_data<= "000000000011110000";
	wait for 5 us;
	clk <= '1';
	wait for 10 us;
	clk <= '0';
	wait for 5 us;
	
	--test3 ... write reg11
	write_en <= '1';
	write_reg_addr<= "1011";
	write_data<= "000000111100000000";
	wait for 5 us;
	clk <= '1';
	wait for 10 us;
	clk <= '0';
	wait for 5 us;
	
	end process;
	
end behavior;
