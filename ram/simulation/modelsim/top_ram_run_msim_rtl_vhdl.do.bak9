transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/top_ram.vhd}

vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/tb_ram.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  tb_ram

add wave *
view structure
view signals
run 100 us
