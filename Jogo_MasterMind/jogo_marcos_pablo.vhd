library ieee;
use ieee.std_Logic_1164.all;

entity jogo_marcos_pablo is port( 
    SW: in  std_logic_vector(15 downto 0);
    Clock1, Clock500: in  std_logic;
    KEY1, KEY0: in  std_logic;
    HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7: out std_logic_vector(6 downto 0);
    LEDR: out std_logic_vector(15 downto 0)
);
end jogo_marcos_pablo;

architecture arc_jogo_marcos_pablo of jogo_marcos_pablo is

signal R1, R2, E1, E2, E3, E4, E5: std_logic;
signal btn_enter, btn_reset, end_game, end_time, end_round: std_logic;

    component ButtonSync is 
        port(
            KEY0, KEY1, CLK: in  std_logic;
            Enter, Reset: out std_logic
        );
    end component;

    component controler is 
        port(
            end_game, end_time, end_round, enter, reset, clk : in std_logic;
            R1, R2, E1, E2, E3, E4, E5: out std_logic
        );
    end component;
    
    component datapath is 
        port(
            Switches                     : in  std_logic_vector(15 downto 0);
            Clock1, Clock500             : in  std_logic;
            R1, R2                       : in  std_logic;
            E1, E2, E3, E4, E5           : in  std_logic;
            ledr                         : out std_logic_vector(15 downto 0);
            hex0, hex1, hex2, hex3       : out std_logic_vector(6 downto 0);
            hex4, hex5, hex6, hex7       : out std_logic_vector(6 downto 0);
            end_game, end_time, end_round: out std_logic
        );
    end component;
    
begin

    Button_sync: component ButtonSync
        port map (KEY0, KEY1, Clock500, btn_enter, btn_reset);

    controlerr: component controler
        port map (end_game, end_time, end_round, btn_enter, btn_reset, Clock500, R1, R2, E1, E2, E3, E4, E5);
        
    datapathh: component datapath 
        port map (
            SW, Clock1, Clock500, R1, R2, E1, E2, E3, E4, E5, 
            LEDR, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7, end_game, end_time, end_round
        );
    
end arc_jogo_marcos_pablo;
