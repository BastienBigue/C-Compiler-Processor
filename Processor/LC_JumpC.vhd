library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LC_JumpC is
    Port ( op : in  STD_LOGIC_VECTOR (7 downto 0);
           cond : in  STD_LOGIC_VECTOR (15 downto 0);
           load : out  STD_LOGIC);
end LC_JumpC;

architecture Behavioral of LC_JumpC is

begin

	load <= '1' when (op = x"0F") and (cond(0) = '0') else
	'0' ; 

end Behavioral;

