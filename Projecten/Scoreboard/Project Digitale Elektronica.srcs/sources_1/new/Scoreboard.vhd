library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity Scoreboard is
  port(--Inputs
       SW: in std_logic_vector (15 downto 0);
       BTNC: in std_logic;
       --Outputs
       AN: out std_logic_vector (7 downto 0);
       CA: out std_logic;
       CB: out std_logic;
       CC: out std_logic;
       CD: out std_logic;
       CE: out std_logic;
       CF: out std_logic;
       CG: out std_logic;
       DP: out std_logic);
        
end Scoreboard;

architecture Behavioral of Scoreboard is

component BCD_To_Segm
    port (BCD: in unsigned (3 downto 0);
          Segm: out std_logic_vector (6 downto 0));
end component;

--Signalen aanmaken die later verbonden moeten worden met de in en uitgangen van de component convertor
signal BCDin: unsigned (3 downto 0);
signal SEGout: std_logic_vector(6 downto 0);

begin

-- Verbind de juiste inputs en outputs naar  het component
Convertor: BCD_To_Segm port map(
    BCD => BCDin (3 downto 0),
    Segm => SEGout);
    
-- Zorgt voor een keuze bij de sigment
pWhichSegment: process (SW,BTNC) -- Alle signalen die gelezen worden (=ingangen van het proces) moeten op de sensitivity list staan
    begin -- De anodes zijn laag actief dus 0=>1 en 1=>0
    AN(0) <= not(SW(7) and SW(8));  -- 1 en 1 // "11" -> 3
    AN(1) <= not(SW(7) and SW(8));  -- 1 en 0 // "10" -> 2
    AN(7) <= SW(7) and SW(8);       -- 0 en 0 // "00" -> 0
    AN(6) <= SW(7) and (not SW(7)); -- 0 en 1 // "01" -> 1
   
    --De ongebruikte displays afzetten die niet worden gebruikt.(actif low)
    AN(2) <= '1';
    AN(3) <= '1';
    AN(4) <= '1';
    AN(5) <= '1';
    
    --Alle signalen die een waarde krijgen (=uitgangen van het proces) moeten altijd een waarde krijgen
    BCDin <= "1001111"; --Geeft bij default de letter E weer.
    if (BTNC = '1' or 
       (unsigned(SW(8 downto 7 )) =  0 and SW(6) = '0') or
       (unsigned(SW(8 downto 7 )) =  1 and SW(6) = '0') or
       (unsigned(SW(8 downto 7 )) =  2 and SW(15) = '0') or
       (unsigned(SW(8 downto 7 )) =  3 and SW(15) = '0'))
    then
        DP <= '1'; --DP gaat aanstaan als de knop is ingedrukt
        
    --De BCDin gaat het door de to_integer functie van het component Convertor.
    --Het kijkt ook ofdat het getal kleiner is als 100 anders geeft het een E weer.
    --Voor 7 segment moet je het getal omdraaien en plus 1 doen, dus de not keert het om en de +1 voegt er 1 bij toe. 
        if (unsigned(SW(8 downto 7)) = 1 and unsigned(SW(6 downto 0)) < 100)
        then
            BCDin <= (unsigned(not SW(6 downto 0))+1) rem 10;
        elsif (unsigned(SW(8 downto 7)) = 0 and unsigned(SW(6 downto 0)) < 100)
        then
            BCDin <= (unsigned(not SW(6 downto 0))+1) / 10;
        elsif (unsigned(not SW(8 downto 7)) = 2 and unsigned(SW(15 downto 9)) < 100)
        then
            BCDin <= (unsigned(not SW(15 downto 9))+1) rem 10;
        elsif (unsigned(SW(8 downto 7)) = 3 and unsigned(SW(15 downto 9)) < 100)
        then
            BCDin <= (unsigned(not SW(15 downto 9))+1) / 10;
        else 
            BCDin <= "1001111"; -- Geeft E weer als de rest van de if-elsif niet kloppen
        end if;
    else
        DP <= '0'; --DP gaat niet aanstaan als de knop niet is ingedrukt
        if (unsigned(SW(8 downto 7)) = 1 and unsigned(SW(6 downto 0)) < 100)
            then
                BCDin <= (unsigned(SW(6 downto 0))) rem 10;
            elsif (unsigned(SW(8 downto 7)) = 0 and unsigned(SW(6 downto 0)) < 100)
            then
                BCDin <= (unsigned(SW(6 downto 0))) / 10;
            elsif (unsigned(SW(8 downto 7)) = 2 and unsigned(SW(15 downto 9)) < 100)
            then
                BCDin <= (unsigned(SW(15 downto 9))) rem 10;
            elsif (unsigned(SW(8 downto 7)) = 3 and unsigned(SW(15 downto 9)) < 100)
            then
                BCDin <= (unsigned(SW(15 downto 9))) / 10;
            else 
                BCDin <= "1001111"; -- Geeft E weer als de rest van de if-elsif niet kloppen
            end if;
    end if;
    end process;

end Behavioral;
