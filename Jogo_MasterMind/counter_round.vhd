library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity counter_round is port ( 
  CLK: in std_logic;
  R: in std_logic;
  E: in std_logic;
  S: out std_logic_vector(3 downto 0);
  end_round: out std_logic
);
end counter_round;

architecture arc_counter_round of counter_round is
  signal cnt: std_logic_vector(3 downto 0) := "0000";
begin
  process(CLK, R, E)
  begin
    if (R = '1' or cnt = "1111") then
        cnt <= "0000";
    
    elsif (CLK'event and CLK = '1') then
        if (E = '1') then	
            cnt <= cnt + "0001";
        end if;
    end if;
  end process;
  end_round <= '1' when cnt = "1111" else '0';
  S <= cnt;
end arc_counter_round;
