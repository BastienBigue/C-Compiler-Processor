library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexeur_donnees is
 Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           op : in  STD_LOGIC_VECTOR (7 downto 0);
           s : out  STD_LOGIC_VECTOR (15 downto 0));
end multiplexeur_donnees;

architecture Behavioral of multiplexeur_donnees is

begin

s <=		b when (op = x"07") or (op = x"70") else
			a when (op=x"08") or (op = x"80") else 
			x"0000"; 

end Behavioral;

