library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EXMem is
    Port ( 	clk : in STD_LOGIC ;
				rst : in STD_LOGIC ; 
				op_in : in  STD_LOGIC_VECTOR (7 downto 0);
				a_in : in  STD_LOGIC_VECTOR (15 downto 0);
				b_in : in  STD_LOGIC_VECTOR (15 downto 0);
				op_out : out  STD_LOGIC_VECTOR (7 downto 0);
				a_out : out  STD_LOGIC_VECTOR (15 downto 0);
				b_out : out  STD_LOGIC_VECTOR (15 downto 0)) ; 
end EXMem;

architecture Behavioral of EXMem is

begin

	process(clk,rst)
	begin 
	
	if rising_edge(clk) then 
		if (rst = '0') then 
			op_out <= (others => '0') ;
			a_out <= (others => '0') ;
			b_out <= (others => '0') ;
		else 
			op_out <= op_in ;
			a_out <= a_in ; 
			b_out <= b_in ; 
		end if ; 
		
	end if ; 

	end process ; 


end Behavioral;

