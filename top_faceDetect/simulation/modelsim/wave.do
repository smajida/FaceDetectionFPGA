onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top_facedetect/reset
add wave -noupdate /tb_top_facedetect/clk
add wave -noupdate /tb_top_facedetect/clk_memRead
add wave -noupdate /tb_top_facedetect/face_detected
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/clk
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/clk_memRead
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/face_detected
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/face_detected0
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/fail
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/ii_address0
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/ii_data0
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/ii_reg_address
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/ii_reg_index
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/ii_reg_we0
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/p_offset0
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/r0
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/r1
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/r2
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/r3
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/r4
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/r5
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/r6
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/r7
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/r8
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/r9
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/r10
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/r11
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/strongStage_count
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/top_cs
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/top_ns
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/weakNode_count
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/weak_count
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/weak_stage_num
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/width_scale_img
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/subwindow_reset
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/subwindow0/tree_mux_sel
add wave -noupdate -radix decimal /tb_top_facedetect/test_top_faceDetect/subwindow0/var_norm_factor
add wave -noupdate -radix decimal /tb_top_facedetect/test_top_faceDetect/subwindow0/weak_thresh
add wave -noupdate -radix decimal /tb_top_facedetect/test_top_faceDetect/subwindow0/var_norm_weak_thresh
add wave -noupdate -radix decimal /tb_top_facedetect/test_top_faceDetect/left_tree
add wave -noupdate -radix decimal /tb_top_facedetect/test_top_faceDetect/right_tree
add wave -noupdate -radix decimal /tb_top_facedetect/test_top_faceDetect/subwindow0/tree_mux_result
add wave -noupdate -radix decimal /tb_top_facedetect/test_top_faceDetect/subwindow0/result_feature
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/en_strongAccum0
add wave -noupdate -radix decimal /tb_top_facedetect/test_top_faceDetect/strong_thresh
add wave -noupdate -radix decimal /tb_top_facedetect/test_top_faceDetect/subwindow0/strong_accumulator_result
add wave -noupdate -radix decimal /tb_top_facedetect/test_top_faceDetect/subwindow0/feature_calc0/result_rect0
add wave -noupdate -radix decimal /tb_top_facedetect/test_top_faceDetect/subwindow0/feature_calc0/result_rect1
add wave -noupdate -radix decimal /tb_top_facedetect/test_top_faceDetect/subwindow0/feature_calc0/result_rect2
add wave -noupdate -radix decimal /tb_top_facedetect/test_top_faceDetect/subwindow0/feature_calc0/result_rect2_extend
add wave -noupdate -radix decimal /tb_top_facedetect/test_top_faceDetect/subwindow0/feature_calc0/result_feature
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/subwindow0/feature_calc0/c_out0
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/subwindow0/feature_calc0/c_out1
add wave -noupdate -radix decimal /tb_top_facedetect/test_top_faceDetect/subwindow0/feature_calc0/w0
add wave -noupdate -radix decimal /tb_top_facedetect/test_top_faceDetect/subwindow0/feature_calc0/w1
add wave -noupdate -radix decimal /tb_top_facedetect/test_top_faceDetect/subwindow0/feature_calc0/w2
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/p0
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/p1
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/p2
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/p3
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/ssp0
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/ssp1
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/ssp2
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/ssp3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5829097634 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {5828041944 ps} {5830092726 ps}
