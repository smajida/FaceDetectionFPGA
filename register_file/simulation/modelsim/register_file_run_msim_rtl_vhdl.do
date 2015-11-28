transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/register_file/register_file.vhd}

vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/register_file/testbench_register_file.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneiv_hssi -L cycloneiv_pcie_hip -L cycloneiv -L rtl_work -L work -voptargs="+acc"  testbench_register_file

add wave *
view structure
view signals
run 100 us
