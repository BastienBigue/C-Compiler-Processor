LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Inster_pointer_test IS
END Inster_pointer_test;
 
ARCHITECTURE behavior OF Inster_pointer_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Instr_pointer
    PORT(
         Din : IN  std_logic_vector(15 downto 0);
         Dout : OUT  std_logic_vector(15 downto 0);
         clk : IN  std_logic;
         sens : IN  std_logic;
         load : IN  std_logic;
         en : IN  std_logic;
         rst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Din : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal sens : std_logic := '0';
   signal load : std_logic := '0';
   signal en : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal Dout : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Instr_pointer PORT MAP (
          Din => Din,
          Dout => Dout,
          clk => clk,
          sens => sens,
          load => load,
          en => en,
          rst => rst
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

      -- insert stimulus here 
		rst <= '1' ; 
		load <= '1', '0' after clk_period * 10 ; 
		Din <= "0001111111000000" ; 
		en <= '0' ; 
		sens <= '1' ; 

      wait;
   end process;

END;
