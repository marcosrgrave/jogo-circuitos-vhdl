library ieee;
use ieee.std_logic_1164.all;

entity ROM3 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(15 downto 0));
    
end ROM3;

architecture Rom_Arch of ROM3 is
  
type memory is array (00 to 15) of std_logic_vector(15 downto 0);
constant my_Rom : memory := (

	00 => "0110000100100011",  --6123   ROM0 esta totalmente preenchida como exemplo. 
	01 => "0110000100110010",  --6132   Eh necessario preencher a ROM1, ROM2 e ROM3 com sequencias de sua escolha.
    02 => "0110001000010011",  --6213
	03 => "0110001000110001",  --6231
	04 => "0110001100010010",  --6312
	05 => "0110001100100001",  --6321
	06 => "0001011000100011",  --1623
	07 => "0001011000110010",  --1632
	08 => "0001001001100011",  --1263
	09 => "0001001000110110",  --1236
    10 => "0001001101100010",  --1362
	11 => "0001001100100110",  --1326
	12 => "0010011000010011",  --2613
	13 => "0010011000110001",  --2631
	14 => "0010000101100011",  --2163
	15 => "0010000100110110"); --2136
	 
	
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