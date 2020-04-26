if { [ file exists ./work ] == 1 } then {
    file delete -force ./work
}

# working directory
vlib ./work

# compile vhdl files
vcom -work ./work ./procedure/common.vhd
vcom -work ./work ./procedure/uart.vhd
vcom -work ./work ./rtl/synchronizer.vhd
vcom -work ./work ./rtl/detect_edge_f.vhd
vcom -work ./work ./rtl/uart.vhd
vcom -work ./work ./testbench/tb_uart.vhd

# execute simulation
vsim -lib ./work tb_uart

# add wave
add wave -position insertpoint sim:/tb_uart/inst_uart/clk
add wave -position insertpoint sim:/tb_uart/inst_uart/reset
add wave -position insertpoint sim:/tb_uart/inst_uart/rx
add wave -position insertpoint sim:/tb_uart/inst_uart/data_rx
add wave -position insertpoint sim:/tb_uart/inst_uart/state
add wave -position insertpoint sim:/tb_uart/inst_uart/rx_sync
add wave -position insertpoint sim:/tb_uart/inst_uart/rx_sync_F1
add wave -position insertpoint sim:/tb_uart/inst_uart/rx_cnt
add wave -position insertpoint sim:/tb_uart/inst_uart/data_rx_int
