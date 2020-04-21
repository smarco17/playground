# working directory
vlib ./work

# compile vhdl files
vcom -work ./work ./rtl/uart.vhd
vcom -work ./work ./testbench/tb_uart.vhd

# execute simulation
vsim -lib ./work tb_uart