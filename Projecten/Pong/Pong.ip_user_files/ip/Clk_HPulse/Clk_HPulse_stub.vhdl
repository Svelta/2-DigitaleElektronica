-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Mon May  6 15:38:29 2019
-- Host        : LAPTOP-GAHH6SMN running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/Piete/OneDrive/Bureaublad/School/2-BasisDigitaleElektronica/Projecten/Pong/Pong.srcs/sources_1/ip/Clk_HPulse/Clk_HPulse_stub.vhdl
-- Design      : Clk_HPulse
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clk_HPulse is
  Port ( 
    Clk_H : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    CLK100MHZ : in STD_LOGIC
  );

end Clk_HPulse;

architecture stub of Clk_HPulse is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "Clk_H,reset,locked,CLK100MHZ";
begin
end;
