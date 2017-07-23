-- Vhdl test bench created from schematic /home/bigue-co/Bureau/4A/SystInfo/Processor/schematic_processor.sch - Mon May 15 13:16:56 2017
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY schematic_processor_schematic_processor_sch_tb IS
END schematic_processor_schematic_processor_sch_tb;
ARCHITECTURE behavioral OF schematic_processor_schematic_processor_sch_tb IS 

   COMPONENT schematic_processor
   PORT( clk	:	IN	STD_LOGIC; 
          rst	:	IN	STD_LOGIC;
			 sens: IN STD_LOGIC);
	 END COMPONENT;

   SIGNAL clk	:	STD_LOGIC := '0';
   SIGNAL rst	:	STD_LOGIC;
	SIGNAL sens:  STD_LOGIC := '1';

BEGIN

   UUT: schematic_processor PORT MAP(
		clk => clk, 
		rst => rst,
		sens => sens
   );

clk <= not clk after 10ns;
rst <= '0', '1' after 100ns; 



END;
