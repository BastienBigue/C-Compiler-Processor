library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LC_UAL is
	Port ( op : in  STD_LOGIC_VECTOR (7 downto 0);
				ctrl_alu: out  STD_LOGIC_VECTOR(4 downto 0));
end LC_UAL;

architecture Behavioral of LC_UAL is

begin

ctrl_alu <= op(4 downto 0) ; 


end Behavioral;

