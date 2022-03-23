library ieee;
use ieee.std_logic_1164.all;

entity ROM3 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(15 downto 0));
    
end ROM3;

architecture Rom_Arch of ROM3 is
  
type memory is array (00 to 15) of std_logic_vector(15 downto 0);
constant my_Rom : memory := (

    00 => "0101011000101000", --5628
    01 => "1001100001110001", --9871
    02 => "1001010001110011", --9473
    03 => "0101001001001000", --5248
    04 => "1000011100000010", --8702
    05 => "0110001101000101", --6345
    06 => "0010010001011000", --2458
    07 => "0110100100110000", --6930
    08 => "0110100000110010", --6832
    09 => "1001001000110110", --9236
    10 => "0100011100000011", --4703
    11 => "0101000010010111", --5097
    12 => "0010100110000111", --2987
    13 => "0011011000010101", --3615
    14 => "0100000000010101", --4015
    15 => "0100010101110001"); --4571
	 
	
begin
   process (address)
   begin
     case address is
       when "0000" => data <= my_rom(00);
       when "0001" => data <= my_rom(01);
       when "0010" => data <= my_rom(02);
       when "0011" => data <= my_rom(03);
       when "0100" => data <= my_rom(04);
       when "0101" => data <= my_rom(05);
       when "0110" => data <= my_rom(06);
       when "0111" => data <= my_rom(07);
       when "1000" => data <= my_rom(08);
       when "1001" => data <= my_rom(09);
	   when "1010" => data <= my_rom(10);
	   when "1011" => data <= my_rom(11);
       when "1100" => data <= my_rom(12);
	   when "1101" => data <= my_rom(13);
	   when "1110" => data <= my_rom(14);
	   when others => data <= my_rom(15);
     end case;
  end process;
end architecture Rom_Arch;