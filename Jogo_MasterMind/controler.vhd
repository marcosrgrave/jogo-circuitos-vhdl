library ieee;
use ieee.std_logic_1164.all;

entity controler is
    port(
        end_game, end_time, end_round, enter, reset, clk : in std_logic;
        R1, R2, E1, E2, E3, E4, E5: out std_logic
    );
end entity;

architecture arc_controler of controler is
    type STATES is (Init, Setup, Play, Count_Round, Check, Waitt, Result);
    signal EAtual, PEstado: STATES;
    
begin
    process(CLK, reset) is
    begin
        if reset = '1' then
            EAtual <= Init;
        elsif (CLK'event and CLK = '1') then
            EAtual <= PEstado;
        end if;
    end process;
    
    process(end_game, end_time, end_round, enter, CLK) is
    begin
        PEstado <= EAtual;
        case EAtual is
            when Init =>
                PEstado <= Setup;
            when Setup =>
                if enter = '1' then
                    PEstado <= Play;
                end if;
            when Play =>
                if end_time = '1' then
                    PEstado <= Result;
                elsif enter = '1' then
                    PEstado <= Count_Round;
                end if;
            when Count_Round =>
                PEstado <= Check;
            when Check =>
                if (end_round = '1' or end_game = '1') then
                    PEstado <= Result;
                else
                    PEstado <= Waitt;
                end if;
            when Waitt =>
                if enter = '1' then
                    PEstado <= Play;
                end if;
            when Result =>
                if enter = '1' then
                    PEstado <= Init;
                end if;
        end case;
    end process;
    
    process(EAtual) is -- Fazer segundo Lab 6
    begin
        case EAtual is
            when Init =>
                R1 <= '1';
                R2 <= '1';
                E1 <= '0';
                E2 <= '0';
                E3 <= '0';
                E4 <= '0';
                E5 <= '0';
            when Setup =>
                R1 <= '0';
                R2 <= '0';
                E1 <= '1';
                E2 <= '0';
                E3 <= '0';
                E4 <= '0';
                E5 <= '0';
            when Play =>
                R1 <= '0';
                R2 <= '0';
                E1 <= '0';
                E2 <= '1';
                E3 <= '0';
                E4 <= '0';
                E5 <= '0';
            when Count_Round =>
                R1 <= '0';
                R2 <= '0';
                E1 <= '0';
                E2 <= '0';
                E3 <= '1';
                E4 <= '0';
                E5 <= '0';
            when Check =>
                R1 <= '0';
                R2 <= '0';
                E1 <= '0';
                E2 <= '0';
                E3 <= '0';
                E4 <= '1';
                E5 <= '0';
            when Waitt =>
                R1 <= '1';
                R2 <= '0';
                E1 <= '0';
                E2 <= '0';
                E3 <= '0';
                E4 <= '0';
                E5 <= '0';
            when Result =>
                R1 <= '0';
                R2 <= '0';
                E1 <= '0';
                E2 <= '0';
                E3 <= '0';
                E4 <= '0';
                E5 <= '1';
        end case;
    end process;
end arc_controler;