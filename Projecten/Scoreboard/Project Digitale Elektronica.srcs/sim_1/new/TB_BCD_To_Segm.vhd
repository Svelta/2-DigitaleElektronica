library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity TB_BCD_To_Segm is
end TB_BCD_To_Segm;

architecture Behavioral of TB_BCD_To_Segm is
    signal BCD: unsigned (3 downto 0);
    signal Segm: std_logic_vector (6 downto 0);

    component BCD_To_Segm
    port (BCD: in unsigned (3 downto 0);
          Segm: out std_logic_vector (6 downto 0));
    end component;
    
begin
    Design: BCD_To_Segm port map(
    BCD => BCD,
    Segm => Segm);
    pBCD_To_Segm: process
    begin
        

end Behavioral;
