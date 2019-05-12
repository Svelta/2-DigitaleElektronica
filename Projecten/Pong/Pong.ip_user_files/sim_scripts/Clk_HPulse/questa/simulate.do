onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Clk_HPulse_opt

do {wave.do}

view wave
view structure
view signals

do {Clk_HPulse.udo}

run -all

quit -force
