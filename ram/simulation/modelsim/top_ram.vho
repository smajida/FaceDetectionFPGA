-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus II License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 14.1.0 Build 186 12/03/2014 SJ Web Edition"

-- DATE "11/08/2015 20:23:28"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top_ram IS
    PORT (
	data : IN std_logic_vector(17 DOWNTO 0);
	rdaddress : IN std_logic_vector(9 DOWNTO 0);
	rdclock : IN std_logic;
	wraddress : IN std_logic_vector(9 DOWNTO 0);
	wrclock : IN std_logic;
	we : IN std_logic;
	re : IN std_logic;
	q : OUT std_logic_vector(17 DOWNTO 0)
	);
END top_ram;

-- Design Ports Information
-- q[0]	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[1]	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[2]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[3]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[4]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[5]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[6]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[7]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[8]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[9]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[10]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[11]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[12]	=>  Location: PIN_G14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[13]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[14]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[15]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[16]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[17]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- we	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wrclock	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdclock	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- re	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[0]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[0]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[1]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[2]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[3]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[4]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[5]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[6]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[7]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[8]	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[9]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[0]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[1]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[2]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[3]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[4]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[5]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[6]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[7]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[8]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[9]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[1]	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[2]	=>  Location: PIN_F3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[3]	=>  Location: PIN_F5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[4]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[5]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[6]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[7]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[8]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[9]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[10]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[11]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[12]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[13]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[14]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[15]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[16]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[17]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF top_ram IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_data : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_rdaddress : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_rdclock : std_logic;
SIGNAL ww_wraddress : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_wrclock : std_logic;
SIGNAL ww_we : std_logic;
SIGNAL ww_re : std_logic;
SIGNAL ww_q : std_logic_vector(17 DOWNTO 0);
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \wrclock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rdclock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \q[0]~output_o\ : std_logic;
SIGNAL \q[1]~output_o\ : std_logic;
SIGNAL \q[2]~output_o\ : std_logic;
SIGNAL \q[3]~output_o\ : std_logic;
SIGNAL \q[4]~output_o\ : std_logic;
SIGNAL \q[5]~output_o\ : std_logic;
SIGNAL \q[6]~output_o\ : std_logic;
SIGNAL \q[7]~output_o\ : std_logic;
SIGNAL \q[8]~output_o\ : std_logic;
SIGNAL \q[9]~output_o\ : std_logic;
SIGNAL \q[10]~output_o\ : std_logic;
SIGNAL \q[11]~output_o\ : std_logic;
SIGNAL \q[12]~output_o\ : std_logic;
SIGNAL \q[13]~output_o\ : std_logic;
SIGNAL \q[14]~output_o\ : std_logic;
SIGNAL \q[15]~output_o\ : std_logic;
SIGNAL \q[16]~output_o\ : std_logic;
SIGNAL \q[17]~output_o\ : std_logic;
SIGNAL \we~input_o\ : std_logic;
SIGNAL \wrclock~input_o\ : std_logic;
SIGNAL \wrclock~inputclkctrl_outclk\ : std_logic;
SIGNAL \rdclock~input_o\ : std_logic;
SIGNAL \rdclock~inputclkctrl_outclk\ : std_logic;
SIGNAL \re~input_o\ : std_logic;
SIGNAL \data[0]~input_o\ : std_logic;
SIGNAL \wraddress[0]~input_o\ : std_logic;
SIGNAL \wraddress[1]~input_o\ : std_logic;
SIGNAL \wraddress[2]~input_o\ : std_logic;
SIGNAL \wraddress[3]~input_o\ : std_logic;
SIGNAL \wraddress[4]~input_o\ : std_logic;
SIGNAL \wraddress[5]~input_o\ : std_logic;
SIGNAL \wraddress[6]~input_o\ : std_logic;
SIGNAL \wraddress[7]~input_o\ : std_logic;
SIGNAL \wraddress[8]~input_o\ : std_logic;
SIGNAL \wraddress[9]~input_o\ : std_logic;
SIGNAL \rdaddress[0]~input_o\ : std_logic;
SIGNAL \rdaddress[1]~input_o\ : std_logic;
SIGNAL \rdaddress[2]~input_o\ : std_logic;
SIGNAL \rdaddress[3]~input_o\ : std_logic;
SIGNAL \rdaddress[4]~input_o\ : std_logic;
SIGNAL \rdaddress[5]~input_o\ : std_logic;
SIGNAL \rdaddress[6]~input_o\ : std_logic;
SIGNAL \rdaddress[7]~input_o\ : std_logic;
SIGNAL \rdaddress[8]~input_o\ : std_logic;
SIGNAL \rdaddress[9]~input_o\ : std_logic;
SIGNAL \data[1]~input_o\ : std_logic;
SIGNAL \data[2]~input_o\ : std_logic;
SIGNAL \data[3]~input_o\ : std_logic;
SIGNAL \data[4]~input_o\ : std_logic;
SIGNAL \data[5]~input_o\ : std_logic;
SIGNAL \data[6]~input_o\ : std_logic;
SIGNAL \data[7]~input_o\ : std_logic;
SIGNAL \data[8]~input_o\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a0~portbdataout\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a8\ : std_logic;
SIGNAL \data[9]~input_o\ : std_logic;
SIGNAL \data[10]~input_o\ : std_logic;
SIGNAL \data[11]~input_o\ : std_logic;
SIGNAL \data[12]~input_o\ : std_logic;
SIGNAL \data[13]~input_o\ : std_logic;
SIGNAL \data[14]~input_o\ : std_logic;
SIGNAL \data[15]~input_o\ : std_logic;
SIGNAL \data[16]~input_o\ : std_logic;
SIGNAL \data[17]~input_o\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a9~portbdataout\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a10\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a11\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a12\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a13\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a14\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a15\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a16\ : std_logic;
SIGNAL \ram_block_rtl_0|auto_generated|ram_block1a17\ : std_logic;

BEGIN

ww_data <= data;
ww_rdaddress <= rdaddress;
ww_rdclock <= rdclock;
ww_wraddress <= wraddress;
ww_wrclock <= wrclock;
ww_we <= we;
ww_re <= re;
q <= ww_q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\ram_block_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (\data[8]~input_o\ & \data[7]~input_o\ & \data[6]~input_o\ & \data[5]~input_o\ & \data[4]~input_o\ & \data[3]~input_o\ & \data[2]~input_o\ & \data[1]~input_o\ & \data[0]~input_o\);

\ram_block_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\wraddress[9]~input_o\ & \wraddress[8]~input_o\ & \wraddress[7]~input_o\ & \wraddress[6]~input_o\ & \wraddress[5]~input_o\ & \wraddress[4]~input_o\ & \wraddress[3]~input_o\ & 
\wraddress[2]~input_o\ & \wraddress[1]~input_o\ & \wraddress[0]~input_o\);

\ram_block_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\rdaddress[9]~input_o\ & \rdaddress[8]~input_o\ & \rdaddress[7]~input_o\ & \rdaddress[6]~input_o\ & \rdaddress[5]~input_o\ & \rdaddress[4]~input_o\ & \rdaddress[3]~input_o\ & 
\rdaddress[2]~input_o\ & \rdaddress[1]~input_o\ & \rdaddress[0]~input_o\);

\ram_block_rtl_0|auto_generated|ram_block1a0~portbdataout\ <= \ram_block_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\ram_block_rtl_0|auto_generated|ram_block1a1\ <= \ram_block_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\ram_block_rtl_0|auto_generated|ram_block1a2\ <= \ram_block_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\ram_block_rtl_0|auto_generated|ram_block1a3\ <= \ram_block_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\ram_block_rtl_0|auto_generated|ram_block1a4\ <= \ram_block_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\ram_block_rtl_0|auto_generated|ram_block1a5\ <= \ram_block_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\ram_block_rtl_0|auto_generated|ram_block1a6\ <= \ram_block_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\ram_block_rtl_0|auto_generated|ram_block1a7\ <= \ram_block_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);
\ram_block_rtl_0|auto_generated|ram_block1a8\ <= \ram_block_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(8);

\ram_block_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\ <= (\data[17]~input_o\ & \data[16]~input_o\ & \data[15]~input_o\ & \data[14]~input_o\ & \data[13]~input_o\ & \data[12]~input_o\ & \data[11]~input_o\ & \data[10]~input_o\ & \data[9]~input_o\);

\ram_block_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\ <= (\wraddress[9]~input_o\ & \wraddress[8]~input_o\ & \wraddress[7]~input_o\ & \wraddress[6]~input_o\ & \wraddress[5]~input_o\ & \wraddress[4]~input_o\ & \wraddress[3]~input_o\ & 
\wraddress[2]~input_o\ & \wraddress[1]~input_o\ & \wraddress[0]~input_o\);

\ram_block_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\ <= (\rdaddress[9]~input_o\ & \rdaddress[8]~input_o\ & \rdaddress[7]~input_o\ & \rdaddress[6]~input_o\ & \rdaddress[5]~input_o\ & \rdaddress[4]~input_o\ & \rdaddress[3]~input_o\ & 
\rdaddress[2]~input_o\ & \rdaddress[1]~input_o\ & \rdaddress[0]~input_o\);

\ram_block_rtl_0|auto_generated|ram_block1a9~portbdataout\ <= \ram_block_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(0);
\ram_block_rtl_0|auto_generated|ram_block1a10\ <= \ram_block_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(1);
\ram_block_rtl_0|auto_generated|ram_block1a11\ <= \ram_block_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(2);
\ram_block_rtl_0|auto_generated|ram_block1a12\ <= \ram_block_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(3);
\ram_block_rtl_0|auto_generated|ram_block1a13\ <= \ram_block_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(4);
\ram_block_rtl_0|auto_generated|ram_block1a14\ <= \ram_block_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(5);
\ram_block_rtl_0|auto_generated|ram_block1a15\ <= \ram_block_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(6);
\ram_block_rtl_0|auto_generated|ram_block1a16\ <= \ram_block_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(7);
\ram_block_rtl_0|auto_generated|ram_block1a17\ <= \ram_block_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\(8);

\wrclock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \wrclock~input_o\);

\rdclock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rdclock~input_o\);

-- Location: IOOBUF_X13_Y73_N9
\q[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a0~portbdataout\,
	devoe => ww_devoe,
	o => \q[0]~output_o\);

-- Location: IOOBUF_X0_Y58_N16
\q[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a1\,
	devoe => ww_devoe,
	o => \q[1]~output_o\);

-- Location: IOOBUF_X11_Y73_N2
\q[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a2\,
	devoe => ww_devoe,
	o => \q[2]~output_o\);

-- Location: IOOBUF_X18_Y73_N16
\q[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a3\,
	devoe => ww_devoe,
	o => \q[3]~output_o\);

-- Location: IOOBUF_X31_Y73_N2
\q[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a4\,
	devoe => ww_devoe,
	o => \q[4]~output_o\);

-- Location: IOOBUF_X13_Y73_N2
\q[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a5\,
	devoe => ww_devoe,
	o => \q[5]~output_o\);

-- Location: IOOBUF_X20_Y73_N9
\q[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a6\,
	devoe => ww_devoe,
	o => \q[6]~output_o\);

-- Location: IOOBUF_X52_Y73_N23
\q[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a7\,
	devoe => ww_devoe,
	o => \q[7]~output_o\);

-- Location: IOOBUF_X52_Y73_N9
\q[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a8\,
	devoe => ww_devoe,
	o => \q[8]~output_o\);

-- Location: IOOBUF_X31_Y73_N9
\q[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a9~portbdataout\,
	devoe => ww_devoe,
	o => \q[9]~output_o\);

-- Location: IOOBUF_X42_Y73_N2
\q[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a10\,
	devoe => ww_devoe,
	o => \q[10]~output_o\);

-- Location: IOOBUF_X20_Y73_N2
\q[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a11\,
	devoe => ww_devoe,
	o => \q[11]~output_o\);

-- Location: IOOBUF_X47_Y73_N16
\q[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a12\,
	devoe => ww_devoe,
	o => \q[12]~output_o\);

-- Location: IOOBUF_X49_Y73_N23
\q[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a13\,
	devoe => ww_devoe,
	o => \q[13]~output_o\);

-- Location: IOOBUF_X27_Y73_N23
\q[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a14\,
	devoe => ww_devoe,
	o => \q[14]~output_o\);

-- Location: IOOBUF_X47_Y73_N2
\q[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a15\,
	devoe => ww_devoe,
	o => \q[15]~output_o\);

-- Location: IOOBUF_X52_Y73_N16
\q[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a16\,
	devoe => ww_devoe,
	o => \q[16]~output_o\);

-- Location: IOOBUF_X27_Y73_N9
\q[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram_block_rtl_0|auto_generated|ram_block1a17\,
	devoe => ww_devoe,
	o => \q[17]~output_o\);

-- Location: IOIBUF_X35_Y73_N22
\we~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_we,
	o => \we~input_o\);

-- Location: IOIBUF_X0_Y36_N15
\wrclock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wrclock,
	o => \wrclock~input_o\);

-- Location: CLKCTRL_G4
\wrclock~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \wrclock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \wrclock~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y36_N8
\rdclock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdclock,
	o => \rdclock~input_o\);

-- Location: CLKCTRL_G2
\rdclock~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rdclock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rdclock~inputclkctrl_outclk\);

-- Location: IOIBUF_X54_Y73_N8
\re~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_re,
	o => \re~input_o\);

-- Location: IOIBUF_X29_Y73_N8
\data[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(0),
	o => \data[0]~input_o\);

-- Location: IOIBUF_X38_Y73_N8
\wraddress[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(0),
	o => \wraddress[0]~input_o\);

-- Location: IOIBUF_X23_Y73_N8
\wraddress[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(1),
	o => \wraddress[1]~input_o\);

-- Location: IOIBUF_X18_Y73_N22
\wraddress[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(2),
	o => \wraddress[2]~input_o\);

-- Location: IOIBUF_X25_Y73_N15
\wraddress[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(3),
	o => \wraddress[3]~input_o\);

-- Location: IOIBUF_X35_Y73_N15
\wraddress[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(4),
	o => \wraddress[4]~input_o\);

-- Location: IOIBUF_X23_Y73_N1
\wraddress[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(5),
	o => \wraddress[5]~input_o\);

-- Location: IOIBUF_X42_Y73_N8
\wraddress[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(6),
	o => \wraddress[6]~input_o\);

-- Location: IOIBUF_X40_Y73_N1
\wraddress[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(7),
	o => \wraddress[7]~input_o\);

-- Location: IOIBUF_X20_Y73_N22
\wraddress[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(8),
	o => \wraddress[8]~input_o\);

-- Location: IOIBUF_X23_Y73_N15
\wraddress[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(9),
	o => \wraddress[9]~input_o\);

-- Location: IOIBUF_X20_Y73_N15
\rdaddress[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(0),
	o => \rdaddress[0]~input_o\);

-- Location: IOIBUF_X33_Y73_N1
\rdaddress[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(1),
	o => \rdaddress[1]~input_o\);

-- Location: IOIBUF_X29_Y73_N1
\rdaddress[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(2),
	o => \rdaddress[2]~input_o\);

-- Location: IOIBUF_X23_Y73_N22
\rdaddress[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(3),
	o => \rdaddress[3]~input_o\);

-- Location: IOIBUF_X33_Y73_N8
\rdaddress[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(4),
	o => \rdaddress[4]~input_o\);

-- Location: IOIBUF_X27_Y73_N15
\rdaddress[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(5),
	o => \rdaddress[5]~input_o\);

-- Location: IOIBUF_X38_Y73_N15
\rdaddress[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(6),
	o => \rdaddress[6]~input_o\);

-- Location: IOIBUF_X38_Y73_N22
\rdaddress[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(7),
	o => \rdaddress[7]~input_o\);

-- Location: IOIBUF_X38_Y73_N1
\rdaddress[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(8),
	o => \rdaddress[8]~input_o\);

-- Location: IOIBUF_X40_Y73_N8
\rdaddress[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(9),
	o => \rdaddress[9]~input_o\);

-- Location: IOIBUF_X0_Y66_N15
\data[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(1),
	o => \data[1]~input_o\);

-- Location: IOIBUF_X0_Y66_N22
\data[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(2),
	o => \data[2]~input_o\);

-- Location: IOIBUF_X0_Y65_N15
\data[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(3),
	o => \data[3]~input_o\);

-- Location: IOIBUF_X0_Y67_N22
\data[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(4),
	o => \data[4]~input_o\);

-- Location: IOIBUF_X0_Y55_N8
\data[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(5),
	o => \data[5]~input_o\);

-- Location: IOIBUF_X35_Y0_N22
\data[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(6),
	o => \data[6]~input_o\);

-- Location: IOIBUF_X0_Y68_N8
\data[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(7),
	o => \data[7]~input_o\);

-- Location: IOIBUF_X0_Y63_N15
\data[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(8),
	o => \data[8]~input_o\);

-- Location: M9K_X37_Y70_N0
\ram_block_rtl_0|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init4 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	clk1_core_clock_enable => "ena1",
	clk1_input_clock_enable => "ena1",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/top_ram.ram0_top_ram_7042d6e4.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:ram_block_rtl_0|altsyncram_nii1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 9,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 576,
	port_a_logical_ram_width => 18,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 10,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 9,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 1023,
	port_b_logical_ram_depth => 576,
	port_b_logical_ram_width => 18,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \we~input_o\,
	portbre => VCC,
	clk0 => \wrclock~inputclkctrl_outclk\,
	clk1 => \rdclock~inputclkctrl_outclk\,
	ena0 => \we~input_o\,
	ena1 => \re~input_o\,
	portadatain => \ram_block_rtl_0|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \ram_block_rtl_0|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \ram_block_rtl_0|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \ram_block_rtl_0|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

-- Location: IOIBUF_X60_Y73_N15
\data[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(9),
	o => \data[9]~input_o\);

-- Location: IOIBUF_X25_Y73_N22
\data[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(10),
	o => \data[10]~input_o\);

-- Location: IOIBUF_X45_Y73_N1
\data[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(11),
	o => \data[11]~input_o\);

-- Location: IOIBUF_X13_Y73_N22
\data[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(12),
	o => \data[12]~input_o\);

-- Location: IOIBUF_X45_Y73_N8
\data[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(13),
	o => \data[13]~input_o\);

-- Location: IOIBUF_X52_Y73_N1
\data[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(14),
	o => \data[14]~input_o\);

-- Location: IOIBUF_X60_Y73_N22
\data[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(15),
	o => \data[15]~input_o\);

-- Location: IOIBUF_X65_Y73_N8
\data[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(16),
	o => \data[16]~input_o\);

-- Location: IOIBUF_X49_Y73_N15
\data[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(17),
	o => \data[17]~input_o\);

-- Location: M9K_X37_Y72_N0
\ram_block_rtl_0|auto_generated|ram_block1a9\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init4 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init3 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	clk0_core_clock_enable => "ena0",
	clk1_core_clock_enable => "ena1",
	clk1_input_clock_enable => "ena1",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "db/top_ram.ram0_top_ram_7042d6e4.hdl.mif",
	init_file_layout => "port_a",
	logical_ram_name => "altsyncram:ram_block_rtl_0|altsyncram_nii1:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 10,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 9,
	port_a_first_address => 0,
	port_a_first_bit_number => 9,
	port_a_last_address => 1023,
	port_a_logical_ram_depth => 576,
	port_a_logical_ram_width => 18,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 10,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "none",
	port_b_data_width => 9,
	port_b_first_address => 0,
	port_b_first_bit_number => 9,
	port_b_last_address => 1023,
	port_b_logical_ram_depth => 576,
	port_b_logical_ram_width => 18,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \we~input_o\,
	portbre => VCC,
	clk0 => \wrclock~inputclkctrl_outclk\,
	clk1 => \rdclock~inputclkctrl_outclk\,
	ena0 => \we~input_o\,
	ena1 => \re~input_o\,
	portadatain => \ram_block_rtl_0|auto_generated|ram_block1a9_PORTADATAIN_bus\,
	portaaddr => \ram_block_rtl_0|auto_generated|ram_block1a9_PORTAADDR_bus\,
	portbaddr => \ram_block_rtl_0|auto_generated|ram_block1a9_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \ram_block_rtl_0|auto_generated|ram_block1a9_PORTBDATAOUT_bus\);

ww_q(0) <= \q[0]~output_o\;

ww_q(1) <= \q[1]~output_o\;

ww_q(2) <= \q[2]~output_o\;

ww_q(3) <= \q[3]~output_o\;

ww_q(4) <= \q[4]~output_o\;

ww_q(5) <= \q[5]~output_o\;

ww_q(6) <= \q[6]~output_o\;

ww_q(7) <= \q[7]~output_o\;

ww_q(8) <= \q[8]~output_o\;

ww_q(9) <= \q[9]~output_o\;

ww_q(10) <= \q[10]~output_o\;

ww_q(11) <= \q[11]~output_o\;

ww_q(12) <= \q[12]~output_o\;

ww_q(13) <= \q[13]~output_o\;

ww_q(14) <= \q[14]~output_o\;

ww_q(15) <= \q[15]~output_o\;

ww_q(16) <= \q[16]~output_o\;

ww_q(17) <= \q[17]~output_o\;
END structure;


