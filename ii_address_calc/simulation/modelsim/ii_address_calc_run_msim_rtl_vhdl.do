transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/ii_address_calc/ii_address_calc.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/ii_address_calc/lpm_mult_unsign5bit_unsign5bit_to_unsign10bit.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/ii_address_calc/lpm_add_unsign10bit_to_unsign10bit.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/ii_address_calc/lpm_add_unsign17bit_to_unsign17bit.vhd}

vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/ii_address_calc/tb_ii_address_calc.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  tb_ii_address_calc

add wave *
view structure
view signals
run 4 us
