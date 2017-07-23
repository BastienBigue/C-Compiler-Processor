LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY decode_test IS
END decode_test;
 
ARCHITECTURE behavior OF decode_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decode
    PORT(
         ins_di : IN  std_logic_vector(31 downto 0);
         op : OUT  std_logic_vector(7 downto 0);
         a : OUT  std_logic_vector(15 downto 0);
         b : OUT  std_logic_vector(15 downto 0);
         c : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ins_di : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal op : std_logic_vector(7 downto 0);
   signal a : std_logic_vector(15 downto 0);
   signal b : std_logic_vector(15 downto 0);
   signal c : std_logic_vector(15 downto 0); 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decode PORT MAP (
          ins_di => ins_di,
          op => op,
          a => a,
          b => b,
          c => c
        );

   -- Stimulus process
   stim_proc: process
   begin		
	
      wait for 100 ns;	
		ins_di <= x"0701ABCD", x"01010904" after 100 ns, x"05010904" after 200 ns, x"06010904" after 300 ns, x"08010904" after 400 ns, x"0E010904" after 500 ns, x"0F010904" after 600 ns, x"70010904" after 700 ns, x"80010904" after 800 ns, x"E0010904" after 900 ns ; 

      wait;
   end process;

END;
