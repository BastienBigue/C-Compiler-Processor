--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:21:13 04/27/2017
-- Design Name:   
-- Module Name:   /home/bigue-co/Bureau/4A/SystInfo/Processor/Registers_test.vhd
-- Project Name:  Processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Registers
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Registers_test IS
END Registers_test;
 
ARCHITECTURE behavior OF Registers_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Registers
    PORT(
         addrA : IN  std_logic_vector(4 downto 0);
         addrB : IN  std_logic_vector(4 downto 0);
         addrW : IN  std_logic_vector(4 downto 0);
         W : IN  std_logic;
         DATA : IN  std_logic_vector(15 downto 0);
         rst : IN  std_logic;
         clk : IN  std_logic;
         QA : OUT  std_logic_vector(15 downto 0);
         QB : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal addrA : std_logic_vector(4 downto 0) := (others => '0');
   signal addrB : std_logic_vector(4 downto 0) := (others => '0');
   signal addrW : std_logic_vector(4 downto 0) := (others => '0');
   signal W : std_logic := '0';
   signal DATA : std_logic_vector(15 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal QA : std_logic_vector(15 downto 0);
   signal QB : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Registers PORT MAP (
          addrA => addrA,
          addrB => addrB,
          addrW => addrW,
          W => W,
          DATA => DATA,
          rst => rst,
          clk => clk,
          QA => QA,
          QB => QB
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
			
      wait for clk_period*10;
		
		rst <= '1';
		addrA <= "00001";
		addrB <= "00010";
		addrW <= "00010";
		W <= '0', '1' after 100 ns; 
		DATA <= x"7fff"; 
      -- insert stimulus here 

      wait;
   end process;

END;
