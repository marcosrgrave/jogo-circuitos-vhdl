library ieee;
use ieee.std_logic_1164.all;

entity REG_6bits is port (
	CLK: in std_logic;
	R: in std_logic;
	E: in std_logic;
	D: in std_logic_vector(5 downto 0);
	Q: out std_logic_vector(5 downto 0));
end REG_6bits;

architecture arc_REG_6bits of REG_6bits is
begin
	process(CLK, D, R, E)
	begin
	    if (R = '1') then 
	        Q <= "000000";
	    elsif (CLK'event and CLK = '1') then
		    if (E = '1') then  
		        Q <= D;
		    end if;
	    end if;
	end process;
end arc_REG_6bits;
