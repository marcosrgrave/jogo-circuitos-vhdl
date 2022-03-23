library ieee;
use ieee.std_logic_1164.all;

entity controle is
    port(
        -- control in
        end_game, end_time, end_round, enter, reset, clk : in std_logic;
        -- data in
        -- control out
        R1, R2, E1, E2, E3, E4, E5: out std_logic
        -- data out
    );
end entity;

architecture archbehav of controle is
-- COMPLETE
    type Estado is (Init, Setup, Play, Result, Count_Round, Check, Wait_1);
    signal estadoAtual, proximoEstado: Estado;
begin
    -- logica de proximo estado
    process(end_game, end_time, end_round, enter) is
    begin
        proximoEstado <= estadoAtual;
        case estadoAtual is
            when Init =>
                proximoEstado <= Setup;
            when Setup =>
                if enter = '1' then
                    proximoEstado <= Play;
                end if;
            when Play =>
                if end_time = '1' then
                    proximoEstado <= Result;
                elsif enter = '1' then
                    proximoEstado <= Count_Round;
                end if;
            when Count_Round =>
                proximoEstado <= Check;
            when Check =>
                if (end_round = '1' or end_game = '1') then
                    proximoEstado <= Result;
                else
                    proximoEstado <= Wait_1;
                end if;
            when Wait_1 =>
                if enter = '1' then
                    proximoEstado <= Play;
                end if;
            when Result =>
                if enter = '1' then
                    proximoEstado <= Init;
                end if;
        end case;
    end process;
    -- COMPLETE
    
    -- regitrador de estado
    process(clk, reset) is
    begin
        if reset = '1' then
            estadoAtual <= Init;
        elsif rising_edge(clk) then
            estadoAtual <= proximoEstado;
        end if;
    end process;
    -- COMPLETE
    
    -- logica de saida 
    process(estadoAtual) is
    begin
        case estadoAtual is
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
            when Result =>
                R1 <= '0';
                R2 <= '0';
                E1 <= '0';
                E2 <= '0';
                E3 <= '0';
                E4 <= '0';
                E5 <= '1';
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
            when Wait_1 =>
                R1 <= '1';
                R2 <= '0';
                E1 <= '0';
                E2 <= '0';
                E3 <= '0';
                E4 <= '0';
                E5 <= '0';
        end case;
    end process;
    -- COMPLETE
end architecture;