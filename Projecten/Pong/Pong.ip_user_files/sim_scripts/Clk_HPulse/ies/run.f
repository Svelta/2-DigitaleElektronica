-makelib ies_lib/xil_defaultlib -sv \
  "D:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../Pong.srcs/sources_1/ip/Clk_HPulse/Clk_HPulse_clk_wiz.v" \
  "../../../../Pong.srcs/sources_1/ip/Clk_HPulse/Clk_HPulse.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

