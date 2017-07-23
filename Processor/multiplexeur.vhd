library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexeur_registers is
    Port ( qa : in  STD_LOGIC_VECTOR (15 downto 0);
           bin : in  STD_LOGIC_VECTOR (15 downto 0);
           op : in  STD_LOGIC_VECTOR (7 downto 0);
           bout : out  STD_LOGIC_VECTOR (15 downto 0));
end multiplexeur_registers;

architecture Behavioral of multiplexeur_registers is

begin


bout <=		qa when (op = x"05") 
						or (op = x"01") 
						or (op = x"02") 
						or (op = x"03") 
						or (op = x"08") 
						or (op = x"09") 
						or (op = x"0A") 
						or (op = x"0B") 
						or (op = x"0C") 
						or (op = x"0D") 
						or (op = x"0F")
						or (op = x"80")
						or (op = x"70")
						or (op = x"E0") else --COP ADD SUB MUL
				bin ; 


end Behavioral;

