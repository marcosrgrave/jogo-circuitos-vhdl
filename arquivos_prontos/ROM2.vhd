library ieee;
use ieee.std_logic_1164.all;

entity ROM2 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(15 downto 0));
    
end ROM2;

architecture Rom_Arch of ROM2 is
  
type memory is array (00 to 15) of std_logic_vector(15 downto 0);
constant my_Rom : memory := (

	00 => "1000000100100011",  --8123   ROM0 esta totalmente preenchida como exemplo. 
	01 => "1000000100110010",  --8132   Eh necessario preencher a ROM1, ROM2 e ROM3 com sequencias de sua escolha.
    02 => "1000001000010011",  --8213
	03 => "1000001000110001",  --8231
	04 => "1000001100010010",  --8312
	05 => "1000001100100001",  --8321
	06 => "0001100000100011",  --1823
	07 => "0001100000110010",  --1832
	08 => "0001001010000011",  --1283
	09 => "0001001000111000",  --1238
    10 => "0001001110000010",  --1382
	11 => "0001001100101000",  --1328
	12 => "0010100000010011",  --2813
	13 => "0010100000110001",  --2831
	14 => "0010000110000011",  --2183
	15 => "0010000100111000"); --2138
	 
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