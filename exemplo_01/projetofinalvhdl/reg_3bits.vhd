library ieee;
use ieee.std_logic_1164.all;

entity reg_3bits is port (
	CLK, R, E: in std_logic;	
	D: in std_logic_vector(2 downto 0);
	Q: out std_logic_vector(2 downto 0));
end reg_3bits;
architecture behv of reg_3bits is
begin
	process(CLK, D, R, E)
	begin
	    if (R = '1') then 
	        Q <= "000";
	    elsif (E = '1') then
		    if (CLK'event and CLK = '1') then  
		        Q <= D;
		    end if;
	    end if;
	end process;
end behv;
