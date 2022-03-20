library IEEE;
use IEEE.Std_Logic_1164.all;

entity mux is
port (
    A:  in std_logic_vector(6 downto 0);
    B:  in std_logic_vector(6 downto 0);
    mux_controler: in std_logic;
    out_7seg:  out std_logic_vector(6 downto 0)
);
end mux;

architecture mydecod of mux is
begin 
  out_7seg <=  A when mux_controler = '0' else
               B when mux_controler = '1' else
               "1111111";
end mydecod;
