library IEEE;
use IEEE.Std_Logic_1164.all;

entity MUX_4_7 is
port (
    A:  in std_logic_vector(6 downto 0);
    B:  in std_logic_vector(6 downto 0);
    C:  in std_logic_vector(6 downto 0);
    D:  in std_logic_vector(6 downto 0);
    E:  in std_logic_vector(1 downto 0);
    out_7seg:  out std_logic_vector(6 downto 0)
);
end MUX_4_7;

architecture arc_MUX_4_7 of MUX_4_7 is
begin 
  out_7seg <=  A when E = "00" else 
               B when E = "01" else
               C when E = "10" else
               D;
end arc_MUX_4_7;
