library IEEE;
use IEEE.Std_Logic_1164.all;

entity mux4_1_7bits is
port (data_in_1, data_in_2, data_in_3, data_in_4:  in std_logic_vector(6 downto 0);
      op : in std_logic_vector(1 downto 0);
      out_7seg:  out std_logic_vector(6 downto 0)
     );
end mux4_1_7bits;

architecture mydecod of mux4_1_7bits is
begin 
  out_7seg <=  data_in_1 when op = "00" else
               data_in_2 when op = "01" else
               data_in_3 when op = "10" else
               data_in_4 when op = "11";
              
end mydecod;