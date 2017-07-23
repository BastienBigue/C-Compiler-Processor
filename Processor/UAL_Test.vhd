--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:55:33 03/31/2017
-- Design Name:   
-- Module Name:   /home/bigue-co/Bureau/4A/SystInfo/Processor/UAL_Test.vhd
-- Project Name:  Processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UAL
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_arith.all; 
USE ieee.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY UAL_Test IS
END UAL_Test;
 
ARCHITECTURE behavior OF UAL_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UAL
    PORT(
         A : IN  STD_LOGIC_VECTOR(15 downto 0);
         B : IN  STD_LOGIC_VECTOR(15 downto 0);
         Ctrl_Alu : IN  std_logic_vector(7 downto 0);
         N : OUT  std_logic;
         O : OUT  std_logic;
         Z : OUT  std_logic;
         C : OUT  std_logic;
         S : OUT  STD_LOGIC_VECTOR(15 downto 0)
        );
    END COMPONENT;
	 
	component bram32
	generic (
		init_file : String := "programme.hex"; --a changer dans l'instance et pas ici (ça correspond a la sortie de notre compilateur en hexa)
		adr_width : Integer := 11);
	port (
		-- System
		sys_clk : in std_logic;
		sys_rst : in std_logic;
		-- Master
		di : out std_logic_vector(31 downto 0);
		we : in std_logic;
		a : in std_logic_vector(15 downto 0);
		do : in std_logic_vector(31 downto 0));
	end component;

	component bram16
	generic (
	init_file : String := "none";
	adr_width : Integer := 11);
	port (
	-- System
	sys_clk : in std_logic;
	sys_rst : in std_logic;
	-- Master
	di : out std_logic_vector(15 downto 0);
	we : in std_logic;
	a : in std_logic_vector(15 downto 0);
	do : in std_logic_vector(15 downto 0));
	end component;
    

   --Inputs
   signal A : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
   signal B : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
   signal Ctrl_Alu : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal N : std_logic;
   signal O : std_logic;
   signal Z : std_logic;
   signal C : std_logic;
   signal S : STD_LOGIC_VECTOR(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UAL PORT MAP (
          A => A,
          B => B,
          Ctrl_Alu => Ctrl_Alu,
          N => N,
          O => O,
          Z => Z,
          C => C,
          S => S
        );
		  
--		  memoire_de_programme : bram32 port map ( 
--		  --Vérifier si les connexions sont bonnes !!
--		  sys_clk => sys_clk, 
--		  sys_rst => sys_rst, 
--		  di => di,
--		  we => we, 
--		  a => a, 
--		  do => do
--		  ) ;
		  
--			memoire_de_programme : bram16 port map ( 
--		  --Vérifier si les connexions sont bonnes !!
--		  sys_clk => sys_clk, 
--		  sys_rst => sys_rst, 
--		  di => di,
--		  we => we, 
--		  a => a, 
--		  do => do
--		  ) ;
		  

   -- Clock process definitions
		--A <= x"0002", x"0004" after 100 ns,  x"0014" after 200 ns, x"ffff" after 300 ns; 
	--	B <= x"0002", x"0005" after 100 ns,  x"0014" after 200 ns, x"ffff" after 300 ns; 
	--	Ctrl_Alu <= "001", "011" after 100 ns, "010" after 200 ns, "010" after 300 ns ; 
		
		A <= x"7fff", x"ffff" after 100 ns,  x"ff01" after 200 ns, x"7fff" after 300 ns; 
		B <= x"0002", x"ffff" after 100 ns,  x"7fff" after 200 ns, x"ffff" after 300 ns; 
		Ctrl_Alu <= "001", "001" after 100 ns, "011" after 200 ns, "011" after 300 ns ; 
		

END;
