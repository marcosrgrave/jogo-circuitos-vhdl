library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity counter_time is port ( 
  CLK, R, E: in std_logic;
  end_time: out std_logic;
  S: out std_logic_vector(3 downto 0) );
end counter_time;
architecture behv of counter_time is
  signal cnt: std_logic_vector(3 downto 0) := "0000";
begin
  process(CLK, R, E)
  begin
    if (R = '1' or cnt = "1010") then
        cnt <= "0000";
    
    elsif (E = '1') then
        if (CLK'event and CLK = '1') then	
            cnt <= cnt + "0001";
        end if;
    end if;
  end process;
  S <= cnt;
  end_time <= '0' when cnt < "1010" else '1';
end behv;