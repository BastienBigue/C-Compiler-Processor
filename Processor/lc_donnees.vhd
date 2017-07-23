library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LC_donnees is
    Port ( op : in  STD_LOGIC_VECTOR (7 downto 0);
           w : out  STD_LOGIC);
end LC_donnees;

architecture Behavioral of LC_donnees is

begin

	w <= 	'1' when (op = x"08") 
						or (op = x"80")
			else  '0' ; 


end Behavioral;

