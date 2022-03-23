library IEEE;
use IEEE.Std_Logic_1164.all;

entity mux2_1 is
port (data_in_1, data_in_2:  in std_logic_vector(6 downto 0);
      op : in std_logic;
      out_7seg:  out std_logic_vector(6 downto 0)
     );
end mux2_1;

architecture mydecod of mux2_1 is
begin 
  out_7seg <=  data_in_1 when op = '0' else
               data_in_2 when op = '1';
              
end mydecod;