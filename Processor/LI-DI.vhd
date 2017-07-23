library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LIDI is
    Port ( 	clk : in STD_LOGIC ;
				rst : in STD_LOGIC ; 
				op_in : in  STD_LOGIC_VECTOR (7 downto 0);
				a_in : in  STD_LOGIC_VECTOR (15 downto 0);
				b_in : in  STD_LOGIC_VECTOR (15 downto 0);
				c_in : in  STD_LOGIC_VECTOR (15 downto 0);
				op_out : out  STD_LOGIC_VECTOR (7 downto 0);
				a_out : out  STD_LOGIC_VECTOR (15 downto 0);
				b_out : out  STD_LOGIC_VECTOR (15 downto 0);
				c_out : out  STD_LOGIC_VECTOR (15 downto 0); 
				alea : in STD_LOGIC);
end LIDI;

architecture Behavioral of LIDI is

begin

	process(clk,rst)
	begin 
	
	if rising_edge(clk) then 
		if (rst = '0') then 
			op_out <= (others => '0') ;
			a_out <= (others => '0') ;
			b_out <= (others => '0') ;
			c_out <= (others => '0') ;
		else 
			if (alea = '1') then 
				op_out <= x"00" ;
					a_out <= x"0000" ; 
					b_out <= x"0000" ; 
					c_out <= x"0000" ; 
			else 
				if (op_in = x"80") or (op_in = x"E0") then 
					op_out <= op_in ;
					a_out <= a_in ; 
					b_out <= a_in ; 
					c_out <= b_in ; 
				else 
					op_out <= op_in ;
					a_out <= a_in ; 
					b_out <= b_in ; 
					c_out <= c_in ; 
				end if ; 
			end if ; 				
		end if ; 
	end if ; 
	end process ; 

end Behavioral;

