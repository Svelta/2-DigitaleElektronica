library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity BCD_To_Segm is
    port (BCD: in unsigned (3 downto 0);
          Segm: out std_logic_vector (6 downto 0));
end BCD_To_Segm;

architecture Behavioral of BCD_To_Segm is
    --tSegm is de array die we gaan gebruiken voor de 7-display segment aan te sturen. 
    --Als tSegm(4)="0110011", dat gaat op het 7-segment display het getal 4 weergeven.
    --cSegm is een constante van tSegm
    type tSegm is array(0 to 9) of std_logic_vector(6 downto 0);
    constant cSegm : tSegm:= ("1111110",  --0
                              "0110000",  --1
                              "1101101",  --2
                              "1111001",  --3
                              "0110011",  --4
                              "1011011",  --5
                              "1011111",  --6
                              "1110000",  --7
                              "1111111",  --8
                              "1111011"); --9
begin
    --Zet de BCD van de imput om naar een integer (decimaal) getal,
    --waardoor het bij cSegm(x) het de waarde x zal zijn. Dus gaat het de juiste imput geven voor de segmentjes.
    --to_integer is een fuctie die binair omzet in decimaal.
    Segm <= cSegm(to_integer(BCD));

end Behavioral;
