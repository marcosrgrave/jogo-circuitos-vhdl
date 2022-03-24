library ieee;
use ieee.std_logic_1164.all;

entity REG_16bit is port (
	CLK: in std_logic;
	R: in std_logic;
	E: in std_logic;
	D: in std_logic_vector(15 downto 0);
	Q: out std_logic_vector(15 downto 0));
end REG_16bit;

architecture arc_REG_16bit of REG_16bit is
begin
	process(CLK, D, R, E)
	begin
	    if (R = '1') then 
	        Q <= "0000000000000000";
	    elsif (CLK'event and CLK = '1') then
		    if (E = '1') then  
		        Q <= D;
		    end if;
	    end if;
	end process;
end arc_REG_16bit;
