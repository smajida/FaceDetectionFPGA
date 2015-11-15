transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/pixel_offset/pixel_offset.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/pixel_offset/lpm_mult_unsign8bit_unsign9bit_to_unsign17bit.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/pixel_offset/lpm_add_unsign17bit_to_unsign17bit.vhd}

vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/pixel_offset/tb_pixel_offset.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  tb_pixel_offset

add wave *
view structure
view signals
run 4 us
