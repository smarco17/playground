if { [ file exists ./work ] == 1 } then {
    file delete -force ./work
}

# working directory
vlib ./work

# compile vhdl files
vcom -work ./work ./procedure/common.vhd
vcom -work ./work ./rtl/synchronizer.vhd
vcom -work ./work ./rtl/uart.vhd
vcom -work ./work ./testbench/tb_uart.vhd

# execute simulation
vsim -lib ./work tb_uart
