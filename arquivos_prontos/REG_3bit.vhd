library ieee;
use ieee.std_logic_1164.all;

entity REG_3bits is port (
	CLK: in std_logic;
	R: in std_logic;
	E: in std_logic;
	D: in std_logic_vector(2 downto 0);
	Q: out std_logic_vector(2 downto 0));
end REG_3bits;

architecture arc_REG_3bits of REG_3bits is
begin
	process(CLK, D, R, E)
	begin
	    if (R = '1') then 
	        Q <= "000";
	    elsif (CLK'event and CLK = '1') then
		    if (E = '1') then  
		        Q <= D;
		    end if;
	    end if;
	end process;
end arc_REG_3bits;
