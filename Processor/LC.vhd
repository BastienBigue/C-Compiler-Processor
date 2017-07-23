library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LC_Registers is
    Port ( op : in  STD_LOGIC_VECTOR (7 downto 0);
           w : out  STD_LOGIC) ;  
end LC_Registers;

architecture Behavioral of LC_Registers is

begin

	w <= 	'1' when (op = x"01") 
					or (op = x"02") 
					or (op = x"03") 
					or (op = x"04") 
					or (op = x"05") 
					or (op = x"06") 
					or (op = x"07") 
					or (op = x"09") 
					or (op = x"0A") 
					or (op = x"0B") 
					or (op = x"0C") 
					or (op = x"0D") 
					or (op = x"70")
			else  '0' ; 

end Behavioral;

