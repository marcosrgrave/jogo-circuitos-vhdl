library IEEE;
use IEEE.Std_Logic_1164.all;

entity MUX_4_16 is
port (
    A:  in std_logic_vector(15 downto 0);
    B:  in std_logic_vector(15 downto 0);
    C:  in std_logic_vector(15 downto 0);
    D:  in std_logic_vector(15 downto 0);
    E:  in std_logic_vector(1 downto 0);
    CODE:  out std_logic_vector(15 downto 0)
);
end MUX_4_16;

architecture arc_MUX_4_16 of MUX_4_16 is
begin 
  CODE <=  A when E = "00" else 
           B when E = "01" else
           C when E = "10" else
           D;
end arc_MUX_4_16;
