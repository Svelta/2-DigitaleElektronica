library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Scoreboard is
    Port (
    SCORE: in std_logic;
    
    AN: out std_logic_vector(7 downto 0);
    CA: out std_logic_vector(6 downto 0)    
    );
end Scoreboard;

architecture Behavioral of Scoreboard is

    component BinairToDecimaal port(
        SCORE: in unsigned (3 downto 0);
        Segm: out std_logic_vector (6 downto 0)
        );
    end component;
    
    signal SEGout: std_logic_vector(6 downto 0); 
    
begin

    BTDConverter: BinairToDecimaal port map(
        SCORE => SCORE,
        Segm=> SEGout);
        
end Behavioral;
