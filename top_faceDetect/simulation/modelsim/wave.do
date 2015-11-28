onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_top_facedetect/reset
add wave -noupdate /tb_top_facedetect/clk
add wave -noupdate /tb_top_facedetect/clk_memRead
add wave -noupdate /tb_top_facedetect/face_detected
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/fail
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/ii_reg_address
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/ii_address_decoder_en
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/ii_reg_we0
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/strongStage_count
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/weak_count
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/weak_stage_num
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/weakNode_count
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/top_cs
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/top_ns
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/ii_address0
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
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/en_strongAccum0
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/face_detected0
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/ii_address_decoder0/reset
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/ii_address_decoder0/clk
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/ii_address_decoder0/en
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/ii_address_decoder0/rect_mux_sel
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/ii_address_decoder0/rect_cs
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/ii_address_decoder0/rect_ns
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/ii_address_decoder0/ii_address_mux_sel
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/ii_address_decoder0/ii_address0
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/ii_address_decoder0/ii_address1
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/ii_address_decoder0/ii_address2
add wave -noupdate -radix unsigned /tb_top_facedetect/test_top_faceDetect/ii_address_decoder0/ii_address3
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/ii_address_decoder0/ii_address_cs
add wave -noupdate /tb_top_facedetect/test_top_faceDetect/ii_address_decoder0/ii_address_ns
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1125232 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 174
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
WaveRestoreZoom {785388 ps} {2427478 ps}
