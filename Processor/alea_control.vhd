library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alea_control is
    Port ( 	rst : in STD_LOGIC; 
				opnew : in  STD_LOGIC_VECTOR (7 downto 0);
				ranew : in  STD_LOGIC_VECTOR (15 downto 0);
				rbnew : in  STD_LOGIC_VECTOR (15 downto 0);
				rcnew : in  STD_LOGIC_VECTOR (15 downto 0);
				oplidi : in  STD_LOGIC_VECTOR (7 downto 0);
				ralidi : in  STD_LOGIC_VECTOR (15 downto 0);
				rblidi : in  STD_LOGIC_VECTOR (15 downto 0);
				rclidi : in  STD_LOGIC_VECTOR (15 downto 0);
				opdiex : in  STD_LOGIC_VECTOR (7 downto 0);
				radiex : in  STD_LOGIC_VECTOR (15 downto 0);
				rbdiex : in  STD_LOGIC_VECTOR (15 downto 0);
				rcdiex : in  STD_LOGIC_VECTOR (15 downto 0);
				opexmem : in  STD_LOGIC_VECTOR (7 downto 0);
				raexmem : in  STD_LOGIC_VECTOR (15 downto 0);
				rbexmem : in  STD_LOGIC_VECTOR (15 downto 0);
				rcexmem : in  STD_LOGIC_VECTOR (15 downto 0);
				alea_out : out STD_LOGIC) ;  
end alea_control;

architecture Behavioral of alea_control is
signal alea1lidi : std_logic ; 
signal alea1diex : std_logic ; 
signal alea1exmem : std_logic ; 
signal alea2lidi : std_logic ; 
signal alea2diex : std_logic ; 
signal alea2exmem : std_logic ; 
signal alea_jmp : std_logic ; 
signal alea_jmpc : std_logic ; 
signal alea_jmpr : std_logic ;
 
begin			

alea1lidi <= '1' when 
						--alea quand on veut lire dans un registre dans lequel la valeur n'est pas encore la bonne
						((ralidi = rbnew) or (ralidi = rcnew)) and 
						((oplidi = x"01") or --ADD SUB MUL DIV COP AFC LOAD EQU INF INFE SUP SUPE LOADR
						(oplidi = x"02") or 
						(oplidi = x"03") or 
						(oplidi = x"04") or 
						(oplidi = x"05") or 
						(oplidi = x"06") or 
						(oplidi = x"07") or 
						(oplidi = x"09") or 
						(oplidi = x"0A") or 
						(oplidi = x"0B") or 
						(oplidi = x"0C") or 
						(oplidi = x"0D") or 
						(oplidi = x"70")) and  
						((opnew = x"01") or 
						(opnew = x"02") or 
						(opnew = x"03") or 
						(opnew = x"04") or 
						(opnew = x"05") or 
						(opnew = x"08") or 
						(opnew = x"09") or 
						(opnew = x"0A") or 
						(opnew = x"0B") or 
						(opnew = x"0C") or 
						(opnew = x"0D") or 
						(opnew = x"0F") or 
						(opnew = x"80") or 
						(opnew = x"70")) else '0' ; 
						
alea1diex <=		'1' when ((radiex = rbnew) or (radiex = rcnew)) and 
						((opdiex = x"01") or --ADD SUB MUL DIV COP AFC LOAD EQU INF INFE SUP SUPE LOADR
						(opdiex = x"02") or 
						(opdiex = x"03") or 
						(opdiex = x"04") or 
						(opdiex = x"05") or 
						(opdiex = x"06") or 
						(opdiex = x"07") or 
						(opdiex = x"09") or 
						(opdiex = x"0A") or 
						(opdiex = x"0B") or 
						(opdiex = x"0C") or 
						(opdiex = x"0D") or 
						(opdiex = x"70")) and  
						((opnew = x"01") or 
						(opnew = x"02") or 
						(opnew = x"03") or 
						(opnew = x"04") or 
						(opnew = x"05") or 
						(opnew = x"08") or 
						(opnew = x"09") or 
						(opnew = x"0A") or 
						(opnew = x"0B") or 
						(opnew = x"0C") or 
						(opnew = x"0D") or 
						(opnew = x"0F") or 
						(opnew = x"80") or 
						(opnew = x"70")) else '0' ; 
						
alea1exmem <=		'1' when ((raexmem = rbnew) or (raexmem = rcnew)) and 
						((opexmem = x"01") or --ADD SUB MUL DIV COP AFC LOAD EQU INF INFE SUP SUPE LOADR
						(opexmem = x"02") or 
						(opexmem = x"03") or 
						(opexmem = x"04") or 
						(opexmem = x"05") or 
						(opexmem = x"06") or 
						(opexmem = x"07") or 
						(opexmem = x"09") or 
						(opexmem = x"0A") or 
						(opexmem = x"0B") or 
						(opexmem = x"0C") or 
						(opexmem = x"0D") or 
						(opexmem = x"70")) and  
						((opnew = x"01") or 
						(opnew = x"02") or 
						(opnew = x"03") or 
						(opnew = x"04") or 
						(opnew = x"05") or 
						(opnew = x"08") or 
						(opnew = x"09") or 
						(opnew = x"0A") or 
						(opnew = x"0B") or 
						(opnew = x"0C") or 
						(opnew = x"0D") or 
						(opnew = x"0F") or 
						(opnew = x"80") or 
						(opnew = x"70")) else '0' ; 

						
alea2lidi <= 		'1' when ((ranew = rblidi) or (ranew = rclidi)) and 
						((oplidi = x"01") or --ADD SUB MUL DIV COP STORE EQU INF INFE SUP 
						(oplidi = x"02") or --SUPE JMPC STRR LOADR JMPR (RA2 RB2 RC2)
						(oplidi = x"03") or 
						(oplidi = x"04") or 
						(oplidi = x"05") or 
						(oplidi = x"08") or 
						(oplidi = x"09") or 
						(oplidi = x"0A") or 
						(oplidi = x"0B") or 
						(oplidi = x"0C") or 
						(oplidi = x"0D") or 
						(oplidi = x"0F") or 
						(oplidi = x"80") or 
						(oplidi = x"70")) and  
						((opnew = x"01") or --ADD SUB MUL DIV COP AFC LOAD EQU INF INFE SUP SUPE LOADR
						(opnew = x"02") or 
						(opnew = x"03") or 
						(opnew = x"04") or 
						(opnew = x"05") or 
						(opnew = x"06") or 						
						(opnew = x"07") or 
						(opnew = x"09") or 
						(opnew = x"0A") or 
						(opnew = x"0B") or 
						(opnew = x"0C") or 
						(opnew = x"0D") or 
						(opnew = x"70")) else  '0' ; 
						
alea2diex <=		'1' when ((ranew = rbdiex) or (ranew = rcdiex)) and 
						((opdiex = x"01") or --ADD SUB MUL DIV COP STORE EQU INF INFE SUP 
						(opdiex = x"02") or --SUPE JMPC STRR LOADR JMPR (RA2 RB2 RC2)
						(opdiex = x"03") or 
						(opdiex = x"04") or 
						(opdiex = x"05") or 
						(opdiex = x"08") or 
						(opdiex = x"09") or 
						(opdiex = x"0A") or 
						(opdiex = x"0B") or 
						(opdiex = x"0C") or 
						(opdiex = x"0D") or 
						(opdiex = x"0F") or 
						(opdiex = x"80") or 
						(opdiex = x"70")) and  
						((opnew = x"01") or --ADD SUB MUL DIV COP AFC LOAD EQU INF INFE SUP SUPE LOADR
						(opnew = x"02") or 
						(opnew = x"03") or 
						(opnew = x"04") or 
						(opnew = x"05") or 
						(opnew = x"06") or 						
						(opnew = x"07") or 
						(opnew = x"09") or 
						(opnew = x"0A") or 
						(opnew = x"0B") or 
						(opnew = x"0C") or 
						(opnew = x"0D") or 
						(opnew = x"70")) else  '0' ; 
					
							
							--ADD SUB MUL DIV COP STORE EQU INF INFE SUP 
alea2exmem <=		'1' when ((opexmem = x"02") or --SUPE JMPC STRR LOADR JMPR (RA2 RB2 RC2)
						(opexmem = x"03") or 
						(opexmem = x"04") or 
						(opexmem = x"05") or 
						(opexmem = x"08") or 
						(opexmem = x"09") or 
						(opexmem = x"0A") or 
						(opexmem = x"0B") or 
						(opexmem = x"0C") or 
						(opexmem = x"0D") or 
						(opexmem = x"0F") or 
						(opexmem = x"80") or 
						(opexmem = x"70")) and  
						((opnew = x"01") or --ADD SUB MUL DIV COP AFC LOAD EQU INF INFE SUP SUPE LOADR
						(opnew = x"02") or 
						(opnew = x"03") or 
						(opnew = x"04") or 
						(opnew = x"05") or 
						(opnew = x"06") or 						
						(opnew = x"07") or 
						(opnew = x"09") or 
						(opnew = x"0A") or 
						(opnew = x"0B") or 
						(opnew = x"0C") or 
						(opnew = x"0D") or 
						(opnew = x"70")) else '0' ;   
						
alea_jmp <= '1' when (oplidi = x"0E") else '0'; 

alea_jmpc <= '1' when (oplidi = x"0F") or (opdiex = x"0F") else '0' ; 

alea_jmpr <= '1' when (oplidi = x"E0") or (opdiex = x"E0") else '0' ; 
						
alea_out <= alea1lidi or alea1diex or alea1exmem or alea2lidi or alea2diex or alea2exmem  or alea_jmp or alea_jmpc or alea_jmpr; 
end Behavioral;

