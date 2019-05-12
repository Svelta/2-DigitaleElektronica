library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ClockDisplay is        
Port    (Clk100MHz: in std_logic;
         SW: in std_logic_vector(7 downto 0);
         AN: out std_logic_vector(7 downto 0);
         CA: out std_logic_vector(6 downto 0)
         );
end ClockDisplay;                                                                                                                              

architecture Behavioral of ClockDisplay is
--componenten die nodig zijn
component BCD_To_Segm
    port (BCD: in unsigned (7 downto 0);
          Segm: out std_logic_vector (6 downto 0));
end component   
   
end Behavioral;