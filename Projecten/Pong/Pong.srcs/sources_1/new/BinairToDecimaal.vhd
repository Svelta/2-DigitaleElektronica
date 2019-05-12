library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity BinairToDecimaal is
    port (SCORE: in unsigned (3 downto 0);
          Segm: out std_logic_vector (6 downto 0));
end BinairToDecimaal;

architecture Behavioral of BinairToDecimaal is

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

    Segm <= cSegm(to_integer(SCORE));

end Behavioral;