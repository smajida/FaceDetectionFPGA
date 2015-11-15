transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/feature_calc/feature_calc.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/feature_calc/rect_calc.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/feature_calc/lpm_add_unsign25bit_to_unsign25bitWithCarry.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/feature_calc/lpm_mult_sign27bit_sign15bit_to_sign42bit.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/feature_calc/lpm_sub_unsign26bit_to_unsign26bit.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/feature_calc/lpm_add_sign43bit_to_sign43bitWithCarry.vhd}
vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/feature_calc/lpm_add_sign42bit_to_sign42bitWithCarry.vhd}

vcom -93 -work work {C:/Users/Peter/Desktop/Senior_Design/97_altera_workspace/FaceDetectionFPGA/feature_calc/tb_feature_calc.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneive -L rtl_work -L work -voptargs="+acc"  tb_feature_calc

add wave *
view structure
view signals
run 1 us
