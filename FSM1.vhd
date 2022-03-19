library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all; 
use IEEE.std_logic_unsigned.all;

entity jogo_pablo_marcos is port ( 
  CLK: in std_logic;
  CLR: in std_logic;
  B : in std_logic;
  S: out std_logic_vector(1 downto 0)
  );
end entity;

architecture bla of FSM1 is
  type STATES is (_Init, _Setup, _Play, _Count, _Check, _Wait, _Result);
  signal EA, PE : STATES;
begin

  process(CLK, CLR)
  begin
    if (CLR = '1') then
      EA <= Init;
    elsif (CLK'event and CLK = '1') then
      EA <= PE;
    end if;
  end process;
  
   process (EA, B)
  begin
    case EA is
        when Init => 
            S <= "10";
                if (B = '1') then
                    PE <= On1;
                else
                    PE <= Init;
                end if;
        when On1 => PE <= Off1;
                S <= "01";
        when Off1 => PE <= On2;
                S <= "00";
        when On2 => PE <= Off2;
                S <= "01";
        when Off2 =>
            S <= "10";
                if (B = '1') then
                    PE <= On1;
                else
                    PE <= Off2;
                end if;
    end case;
  end process;
    
end architecture;