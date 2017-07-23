library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity multiplexeur_addr is
    Port ( a : in  STD_LOGIC_VECTOR (15 downto 0);
           b : in  STD_LOGIC_VECTOR (15 downto 0);
           op : in  STD_LOGIC_VECTOR (7 downto 0);
           s : out  STD_LOGIC_VECTOR (15 downto 0));
end multiplexeur_addr;

architecture Behavioral of multiplexeur_addr is

begin

s <= 	a when (op = x"0E") or (op = x"0F") else
		b when (op = x"E0") ; 

end Behavioral;

