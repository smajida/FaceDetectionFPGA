library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

entity top_faceDetect is
	port(
		reset: in std_logic; -- reset asserted logic '1'
		clk: in std_logic; -- ______ MHz 
		clk_memRead: in std_logic; -- ______ MHz
		face_detected: out std_logic -- face detection asserts logic '1'
	);
end top_faceDetect;

architecture behavior of top_faceDetect is

component ram
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

component subwindow
	port(
		reset: in std_logic; -- reset asserted logic '1'
		clk: in std_logic; -- latch strong accumulator
		en_strongAccum: in std_logic; -- enable strong accumulator latch
		left_tree: in std_logic_vector(13 downto 0); -- 14 bit signed
		right_tree: in std_logic_vector(13 downto 0); -- 14 bit signed
		weak_thresh: in std_logic_vector(12 downto 0); -- 13 bit signed
		strong_thresh: in std_logic_vector(11 downto 0); -- 12 bit signed
		w0: in std_logic_vector(14 downto 0); -- signed
		w1: in std_logic_vector(14 downto 0); -- signed
		w2: in std_logic_vector(14 downto 0); -- signed
		r0: in std_logic_vector(24 downto 0); -- unsigned
		r1: in std_logic_vector(24 downto 0); -- unsigned
		r2: in std_logic_vector(24 downto 0); -- unsigned
		r3: in std_logic_vector(24 downto 0); -- unsigned
		r4: in std_logic_vector(24 downto 0); -- unsigned
		r5: in std_logic_vector(24 downto 0); -- unsigned
		r6: in std_logic_vector(24 downto 0); -- unsigned
		r7: in std_logic_vector(24 downto 0); -- unsigned
		r8: in std_logic_vector(24 downto 0); -- unsigned
		r9: in std_logic_vector(24 downto 0); -- unsigned
		r10: in std_logic_vector(24 downto 0); -- unsigned
		r11: in std_logic_vector(24 downto 0); -- unsigned
		p0: in std_logic_vector(24 downto 0); -- unsigned
		p1: in std_logic_vector(24 downto 0); -- unsigned
		p2: in std_logic_vector(24 downto 0); -- unsigned
		p3: in std_logic_vector(24 downto 0); -- unsigned
		ssp0: in std_logic_vector(32 downto 0); -- unsigned
		ssp1: in std_logic_vector(32 downto 0); -- unsigned
		ssp2: in std_logic_vector(32 downto 0); -- unsigned
		ssp3: in std_logic_vector(32 downto 0); -- unsigned
		detection: out std_logic -- assert '1' for detection
	);
end component;

component ii_address_decoder
	port(
		reset: in std_logic;
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

component pixel_offset
	port(
		x_pos_subwin: in std_logic_vector(8 downto 0); -- 9bit unsigned ... range(0 to 319)
		y_pos_subwin: in std_logic_vector(7 downto 0); -- 8bit unsigned ... range(0 to 239)
		width_scale_img: in std_logic_vector(8 downto 0); -- 9bit unsigned ... range(0 to 320)
		p_offset: out std_logic_vector(16 downto 0) -- 17bit unsigned ... range(0 to 76799)
	);
end component;

signal strongStage_count: std_logic_vector(4 downto 0); -- unsigned
signal weakNode_count: std_logic_vector(11 downto 0); -- unsigned
signal weak_stage_num: std_logic_vector(7 downto 0); --unsigned

signal r0: std_logic_vector(24 downto 0); -- unsigned
signal r1: std_logic_vector(24 downto 0); -- unsigned
signal r2: std_logic_vector(24 downto 0); -- unsigned
signal r3: std_logic_vector(24 downto 0); -- unsigned
signal r4: std_logic_vector(24 downto 0); -- unsigned
signal r5: std_logic_vector(24 downto 0); -- unsigned
signal r6: std_logic_vector(24 downto 0); -- unsigned
signal r7: std_logic_vector(24 downto 0); -- unsigned
signal r8: std_logic_vector(24 downto 0); -- unsigned
signal r9: std_logic_vector(24 downto 0); -- unsigned
signal r10: std_logic_vector(24 downto 0); -- unsigned
signal r11: std_logic_vector(24 downto 0); -- unsigned

signal p0: std_logic_vector(24 downto 0); -- unsigned
signal p1: std_logic_vector(24 downto 0); -- unsigned
signal p2: std_logic_vector(24 downto 0); -- unsigned
signal p3: std_logic_vector(24 downto 0); -- unsigned
signal ssp0: std_logic_vector(32 downto 0); --unsigned
signal ssp1: std_logic_vector(32 downto 0); --unsigned
signal ssp2: std_logic_vector(32 downto 0); --unsigned
signal ssp3: std_logic_vector(32 downto 0); --unsigned

signal weight_rect0: std_logic_vector(14 downto 0); -- signed
signal weight_rect1: std_logic_vector(14 downto 0); -- signed
signal weight_rect2: std_logic_vector(14 downto 0); -- signed

signal x_rect0: std_logic_vector(4 downto 0); -- unsigned
signal x_rect1: std_logic_vector(4 downto 0); -- unsigned
signal x_rect2: std_logic_vector(4 downto 0); -- unsigned
signal y_rect0: std_logic_vector(4 downto 0); -- unsigned
signal y_rect1: std_logic_vector(4 downto 0); -- unsigned
signal y_rect2: std_logic_vector(4 downto 0); -- unsigned
signal w_rect0: std_logic_vector(4 downto 0); -- unsigned
signal w_rect1: std_logic_vector(4 downto 0); -- unsigned
signal w_rect2: std_logic_vector(4 downto 0); -- unsigned
signal h_rect0: std_logic_vector(4 downto 0); -- unsigned
signal h_rect1: std_logic_vector(4 downto 0); -- unsigned
signal h_rect2: std_logic_vector(4 downto 0); -- unsigned

signal ii_address0: std_logic_vector(16 downto 0); -- unsigned
signal ii_data0: std_logic_vector(24 downto 0); -- unsigned

signal left_tree: std_logic_vector(13 downto 0); -- signed
signal right_tree: std_logic_vector(13 downto 0); -- signed
signal weak_thresh: std_logic_vector(12 downto 0); -- signed
signal strong_thresh: std_logic_vector(11 downto 0); -- signed

signal width_scale_img: std_logic_vector(8 downto 0); -- unsigned
signal x_pos_subwin0: std_logic_vector(8 downto 0); -- unsigned
signal y_pos_subwin0: std_logic_vector(7 downto 0); -- unsigned
signal p_offset0: std_logic_vector(16 downto 0); -- unsigned
signal en_strongAccum0: std_logic;

signal ii_address_decoder_en: std_logic;
signal ii_reg_we0: std_logic;
signal ii_reg_address: std_logic_vector(3 downto 0); -- unsigned

signal ii_reg_index: std_logic_vector(3 downto 0);
signal weak_count: std_logic_vector(7 downto 0);

signal fail: std_logic;

signal face_detected0: std_logic; -- subwindow0 face detection result

type TOP_STATE_TYPE is (s0, s1, s2, s3, s4, s5, s6, s7);
signal top_cs,top_ns   : TOP_STATE_TYPE;

signal ii_reg_address_count_en: std_logic;
signal ii_reg_address_count_reset: std_logic;
signal ii_reg_index_count_en: std_logic;
signal ii_reg_index_count_reset: std_logic;
signal weakNode_count_en: std_logic;
signal weakNode_count_reset: std_logic;
signal weak_count_en: std_logic;
signal weak_count_reset: std_logic;
signal strongStage_count_en: std_logic;
signal strongStage_count_reset: std_logic;

begin

------ counters ------

ii_reg_address_counter: process (clk, ii_reg_address_count_reset, ii_reg_address_count_en)
begin
	if (ii_reg_address_count_reset='1') then
		ii_reg_address <= (others => '0');
	elsif (rising_edge(clk) and (ii_reg_address_count_en='1')) then
		ii_reg_address <= ii_reg_address + 1;
	end if;
end process;

ii_reg_index_counter: process (clk, ii_reg_index_count_reset, ii_reg_index_count_en)
begin
	if (ii_reg_index_count_reset='1') then
		ii_reg_index <= (others => '0');
	elsif (rising_edge(clk) and (ii_reg_index_count_en='1')) then
		ii_reg_index <= ii_reg_index + 1;
	end if;
end process;

weakNode_counter: process (clk, weakNode_count_reset, weakNode_count_en)
begin
	if (weakNode_count_reset='1') then
		weakNode_count <= (others => '0');
	elsif (rising_edge(clk) and (weakNode_count_en='1')) then
		weakNode_count <= weakNode_count + 1;
	end if;
end process;

weak_counter: process (clk, weak_count_reset, weak_count_en)
begin
	if (weak_count_reset='1') then
		weak_count <= "00000001";
	elsif (rising_edge(clk) and (weak_count_en='1')) then
		weak_count <= weak_count + 1;
	end if;
end process;

strongStage_counter: process (clk, strongStage_count_reset, strongStage_count_en)
begin
	if (strongStage_count_reset='1') then
		strongStage_count <= (others => '0');
	elsif (rising_edge(clk) and (strongStage_count_en='1')) then
		strongStage_count <= strongStage_count + 1;
	end if;
end process;

---- CONFIG CONSTANTS ----
width_scale_img <= std_logic_vector(to_unsigned(320, 9)); -- 9 bit unsigned ... 320 pixel wide test image

---- Top Level Control (will change in other rev's) ----
	
	-- ii_address_decoder_en -- enable the address decoder for subwindow 0 to cycle through address calculations for subwindow 0 registers
	-- ii_reg_we0 -- write enable to latch integral image values from ii_ram
	-- ii_reg_address -- address that specifies register to latch integral image values into
	-- strongStage_count
	-- weakNode_count
	-- weak_stage_num ... control input
	-- en_strongAccum0 -- enable strong accumulator to latch in subwindow 0
	
	------------ reset state machine ------

process (clk, reset)
begin
	if (reset='1') then
		top_cs <= s0;
	elsif (rising_edge(clk)) then
		top_cs <= top_ns;
	end if;
end process;
	
	
	------------ top state machine -------

	--ii_reg_address counts from 0 to 11
	--weakNode_count counts from 0 to 2912
	--weak_count counts from 1 to weak_stage_num ... max=211
	--strongStage_count counts from 0 to 24
	
rect_SM: process (top_cs, ii_reg_address, weak_count, weak_stage_num, strongStage_count)
begin
	case top_cs is
		when s0 => -- reset
			fail <= '0';
			en_strongAccum0 <= '0';
			--ii_address_decoder_en <= '0';
			ii_reg_we0 <= '0';
			ii_reg_address_count_en <= '0';
			ii_reg_address_count_reset <= '1';
			ii_reg_index_count_en <= '0';
			ii_reg_index_count_reset <= '1';
			weakNode_count_en <= '0';
			weakNode_count_reset <= '1';
			weak_count_en <= '0';
			weak_count_reset <= '1';
			strongStage_count_en <= '0';
			strongStage_count_reset <= '1';
			top_ns <= s1;
		when s1 => -- latch ii value into regs
			en_strongAccum0 <= '0';
			--ii_address_decoder_en <= '1';
			ii_reg_we0 <= '1';
			ii_reg_address_count_en <= '0';
			ii_reg_address_count_reset <= '0';
			ii_reg_index_count_en <= '0';
			ii_reg_index_count_reset <= '0';
			weakNode_count_en <= '0';
			weakNode_count_reset <= '0';
			weak_count_en <= '0';
			weak_count_reset <= '0';
			strongStage_count_en <= '0';
			strongStage_count_reset <= '0';
			if (ii_reg_address = 11) then
				top_ns <= s3;
			else
				top_ns <= s2;
			end if;
		when s2 => -- inc ii_reg_address
			en_strongAccum0 <= '0';
			--ii_address_decoder_en <= '0';
			ii_reg_we0 <= '0';
			ii_reg_address_count_en <= '1';
			ii_reg_address_count_reset <= '0';
			ii_reg_index_count_en <= '1';
			ii_reg_index_count_reset <= '0';
			weakNode_count_en <= '0';
			weakNode_count_reset <= '0';
			weak_count_en <= '0';
			weak_count_reset <= '0';
			strongStage_count_en <= '0';
			strongStage_count_reset <= '0';
			top_ns <= s1;
		when s3 => -- setup all calcs, decide where to go
			en_strongAccum0 <= '0';
			--ii_address_decoder_en <= '0';
			ii_reg_address_count_en <= '0';
			ii_reg_address_count_reset <= '1';
			ii_reg_index_count_en <= '0';
			ii_reg_index_count_reset <= '1';
			weakNode_count_en <= '0';
			weakNode_count_reset <= '0';
			weak_count_en <= '0';
			weak_count_reset <= '0';
			strongStage_count_en <= '0';
			strongStage_count_reset <= '0';
			ii_reg_we0 <= '0';
			if (not(weak_count=weak_stage_num)) then
				top_ns <= s4;
			elsif (not(face_detected0='1') and (weak_count=weak_stage_num) and not(strongStage_count=24)) then
				top_ns <= s5;
			elsif ((face_detected0='1') and (weak_count=weak_stage_num) and not(strongStage_count=24)) then
				top_ns <= s6;
			elsif (not(face_detected0='1') and (weak_count=weak_stage_num) and (strongStage_count=24)) then
				top_ns <= s7;
			elsif ((face_detected0='1') and (weak_count=weak_stage_num) and (strongStage_count=24)) then
				top_ns <= s1;
			else
				top_ns <= s0;--should never reach this condition
			end if;
			
		when s4 => -- inc weak_count, inc weakNode_count
			en_strongAccum0 <= '0';
			--ii_address_decoder_en <= '0';
			ii_reg_we0 <= '0';
			ii_reg_address_count_en <= '0';
			ii_reg_address_count_reset <= '0';
			ii_reg_index_count_en <= '0';
			ii_reg_index_count_reset <= '0';
			weakNode_count_en <= '1';
			weakNode_count_reset <= '0';
			weak_count_en <= '1';
			weak_count_reset <= '0';
			strongStage_count_en <= '0';
			strongStage_count_reset <= '0';
			top_ns <= s1;
		when s5 => -- assert fail, reset weak_count, inc strongStage_count, inc weakNode_count
			fail <= '1';
			en_strongAccum0 <= '1';
			--ii_address_decoder_en <= '0';
			ii_reg_address_count_en <= '0';
			ii_reg_address_count_reset <= '0';
			ii_reg_index_count_en <= '0';
			ii_reg_index_count_reset <= '0';
			weakNode_count_en <= '1';
			weakNode_count_reset <= '0';
			weak_count_en <= '0';
			weak_count_reset <= '1';
			strongStage_count_en <= '1';
			strongStage_count_reset <= '0';
			top_ns <= s1;
		when s6 => -- reset weak_count, inc strongStage_count, inc weakNode_count
			en_strongAccum0 <= '1';
			--ii_address_decoder_en <= '0';
			ii_reg_we0 <= '0';
			ii_reg_address_count_en <= '0';
			ii_reg_address_count_reset <= '0';
			ii_reg_index_count_en <= '0';
			ii_reg_index_count_reset <= '0';
			weakNode_count_en <= '1';
			weakNode_count_reset <= '0';
			weak_count_en <= '0';
			weak_count_reset <= '1';
			strongStage_count_en <= '1';
			strongStage_count_reset <= '0';
			top_ns <= s1;
		when s7 => -- assert fail, goto reset state (s0)
			fail <= '1';
			en_strongAccum0 <= '0';
			--ii_address_decoder_en <= '0';
			ii_reg_we0 <= '0';
			ii_reg_address_count_en <= '0';
			ii_reg_address_count_reset <= '0';
			ii_reg_index_count_en <= '0';
			ii_reg_index_count_reset <= '0';
			weakNode_count_en <= '0';
			weakNode_count_reset <= '0';
			weak_count_en <= '0';
			weak_count_reset <= '0';
			strongStage_count_en <= '0';
			strongStage_count_reset <= '0';
			top_ns <= s0;
		when others =>
			fail <= '0';
			en_strongAccum0 <= '0';
			--ii_address_decoder_en <= '0';
			ii_reg_we0 <= '0';
			ii_reg_address_count_en <= '0';
			ii_reg_address_count_reset <= '1';
			ii_reg_index_count_en <= '0';
			ii_reg_index_count_reset <= '1';
			weakNode_count_en <= '0';
			weakNode_count_reset <= '1';
			weak_count_en <= '0';
			weak_count_reset <= '1';
			strongStage_count_en <= '0';
			strongStage_count_reset <= '1';
			top_ns <= s0; -- default reset state
	end case;
end process;
	
---- SUBWINDO 0 CONFIG ---- ... located at scaled image (0,0)
x_pos_subwin0 <= std_logic_vector(to_unsigned(0, 9)); -- 9 bit unsigned ... for 0 to 319 range
y_pos_subwin0 <= std_logic_vector(to_unsigned(0, 8)); -- 8 bit unsigned ... for 0 to 239 range

pixel_offset0: pixel_offset
	port map(
		x_pos_subwin => x_pos_subwin0,
		y_pos_subwin => y_pos_subwin0,
		width_scale_img => width_scale_img,
		p_offset => p_offset0);

---- Integral Image Address Decoder ----
ii_address_decoder0: ii_address_decoder
	port map(
		reset => reset,
		ii_reg_index => ii_reg_index,
		width_scale_img => width_scale_img,
		p_offset => p_offset0,
		x_rect0 => x_rect0,
		x_rect1 => x_rect1,
		x_rect2 => x_rect2,
		y_rect0 => y_rect0,
		y_rect1 => y_rect1,
		y_rect2 => y_rect2,
		w_rect0 => w_rect0,
		w_rect1 => w_rect1,
		w_rect2 => w_rect2,
		h_rect0 => h_rect0,
		h_rect1 => h_rect1,
		h_rect2 => h_rect2,
		ii_address => ii_address0);

---- Integral Image RAM ---- ... this is configured as ROM for the init test
	-- 320x240 ii value is 19584000(dec) max ... 25bit unsigned data
	-- max address = 320*240-1 ... for addressing ii values from 0 to (320*240-1)
	-- (320*240-1) = 76799 ... 17 bit unsigned address width
ii_ram: ram 
generic map (ADDR_WIDTH => 17,DATA_WIDTH => 25, --2^17=131071, so real block can address 0 to 131070
				MAX_PRELOAD_ADDRESS => (320*240-1),
				MEM_FILE_NAME => "ii.txt")
port map (data => (others=>'0'),rdaddress => ii_address0,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => ii_data0);
			
---- Integral Image Registers ----
	-- address 12 regs ... 4bit unsigned address width
	-- 320x240 ii value is 19584000(dec) max ... 25bit unsigned data
ii_reg: register_file
generic map (ADDR_WIDTH => 4,
				DATA_WIDTH => 25)
port map(clk => clk,
			write_en => ii_reg_we0,
			write_reg_addr => ii_reg_address,
			write_data => ii_data0,
			q0 => r0,
			q1 => r1,
			q2 => r2,
			q3 => r3,
			q4 => r4,
			q5 => r5,
			q6 => r6,
			q7 => r7,
			q8 => r8,
			q9 => r9,
			q10 => r10,
			q11 => r11);

---- Integral Image Square RAM ----
	-- /* this will be included in future rev's */

---- Variance Normalization Regs
	-- /* currently static values for init test */
	p0 <= std_logic_vector(to_unsigned(31, 25)); -- 25 bit unsigned
	p1 <= std_logic_vector(to_unsigned(2796, 25)); -- 25 bit unsigned
	p2 <= std_logic_vector(to_unsigned(1183, 25)); -- 25 bit unsigned
	p3 <= std_logic_vector(to_unsigned(54698, 25)); -- 25 bit unsigned
	ssp0 <= std_logic_vector(to_unsigned(961, 33)); -- 33 bit unsigned
	ssp1 <= std_logic_vector(to_unsigned(412268, 33)); -- 33 bit unsigned
	ssp2 <= std_logic_vector(to_unsigned(174351, 33)); -- 33 bit unsigned
	ssp3 <= std_logic_vector(to_unsigned(8299024, 33)); -- 33 bit unsigned
	
---- Strong Thresh ROM ----
	-- 25 strong theshold stages ... values range from -1290 to -766 ... 12 bit signed
	-- max address = 25-1 ... for addressing from 0 to (25-1) ... 5 bit unsigned address width
stongThresh_rom: ram 
generic map (ADDR_WIDTH => 5,DATA_WIDTH => 12,
				MAX_PRELOAD_ADDRESS => (25-1),
				MEM_FILE_NAME => "strongThresh.txt")
port map (data => (others=>'0'),rdaddress => strongStage_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => strong_thresh);

---- Weak Stages Num ROM ---- ... specifies the number of weak stages in the current strong stage calculation
	-- 25 strong theshold stages ... weak stage number values range from 9 to 211 ... 8 bit unsigned
	-- max address = 25-1 ... for addressing from 0 to (25-1) ... 5 bit unsigned address width
weakStageNum_rom: ram 
generic map (ADDR_WIDTH => 5,DATA_WIDTH => 8,
				MAX_PRELOAD_ADDRESS => (25-1),
				MEM_FILE_NAME => "weakStageNum.txt")
port map (data => (others=>'0'),rdaddress => strongStage_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => weak_stage_num);

---- Weak Node ROM ----
	-- 2913 weak nodes ... 12 bit unsigned address width
	-- max address = 2913-1 ... for addressing from 0 to (2913-1) 
	-- weight values range from -4096 to 12288 ... 15 bit signed data width
	-- rectangle x,y,w,h values range from 0 to 24 ... 5 bit unsigned data width
	-- left tree values range from ___ to ___ ... 14 bit signed data width
	-- right tree values range from ___ to ___ ... 14 bit signed data width
	-- weak tree threshold values range from -1647 to 2705 ... 13 bit signed
weight0_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 15,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "weight0.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => weight_rect0);

weight1_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 15,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "weight1.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => weight_rect1);
			
weight2_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 15,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "weight2.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => weight_rect2);
			
x_rect0_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 5,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "x_rect0.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => x_rect0);
			
x_rect1_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 5,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "x_rect1.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => x_rect1);
			
x_rect2_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 5,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "x_rect2.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => x_rect2);
			
y_rect0_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 5,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "y_rect0.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => y_rect0);
			
y_rect1_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 5,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "y_rect1.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => y_rect1);
			
y_rect2_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 5,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "y_rect2.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => y_rect2);
			
w_rect0_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 5,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "w_rect0.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => w_rect0);
			
w_rect1_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 5,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "w_rect1.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => w_rect1);
			
w_rect2_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 5,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "w_rect2.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => w_rect2);
			
h_rect0_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 5,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "h_rect0.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => h_rect0);
			
h_rect1_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 5,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "h_rect1.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => h_rect1);
			
h_rect2_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 5,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "h_rect2.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => h_rect2);
			
left_tree_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 14,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "left_tree.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => left_tree);
			
right_tree_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 14,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "right_tree.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => right_tree);
			
weakThresh_rom: ram 
generic map (ADDR_WIDTH => 12,DATA_WIDTH => 13,
				MAX_PRELOAD_ADDRESS => (2913-1),
				MEM_FILE_NAME => "weakThresh.txt")
port map (data => (others=>'0'),rdaddress => weakNode_count,
			rdclock => clk_memRead,wraddress => (others=>'0'),
			wrclock => '0',we => '0',re => '1',q => weak_thresh);
			
---- Subwindow[0] feature_calc 
	-- /* this will directly assert face_detect top level output for init test */
subwindow0: subwindow
	port map(
		reset => reset,
		clk => clk,
		en_strongAccum => en_strongAccum0,
		left_tree => left_tree,
		right_tree => right_tree,
		weak_thresh => weak_thresh,
		strong_thresh => strong_thresh,
		w0 => weight_rect0,
		w1 => weight_rect1,
		w2 => weight_rect2,
		r0 => r0,
		r1 => r1,
		r2 => r2,
		r3 => r3,
		r4 => r4,
		r5 => r5,
		r6 => r6,
		r7 => r7,
		r8 => r8,
		r9 => r9,
		r10 => r10,
		r11 => r11,
		p0 => p0,
		p1 => p1,
		p2 => p2,
		p3 => p3,
		ssp0 => ssp0,
		ssp1 => ssp1,
		ssp2 => ssp2,
		ssp3 => ssp3,
		detection => face_detected0
	);
	
---- Assert Face Detection ----
face_detected <= face_detected0;
	
end behavior;
