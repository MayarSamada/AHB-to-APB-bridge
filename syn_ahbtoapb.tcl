set design fsm
set_app_var search_path "/home/standard_cell_libraries/NangateOpenCellLibrary_PDKv1_3_v2010_12/lib/Front_End/Liberty/NLDM"

set_app_var link_library "NangateOpenCellLibrary_ss0p95v125c.db"

#set_app_var link_library "NangateOpenCellLibrary_ff1p25vn40c.db"

set_app_var target_library "NangateOpenCellLibrary_ss0p95v125c.db"

#set_app_var target_library "NangateOpenCellLibrary_ff1p25vn40c.db"

sh rm -rf work
sh mkdir -p work
define_design_lib work -path ./work


analyze -library work -format verilog ./$design.v
elaborate $design -lib work
current_design 


source ./cons.tcl
link
check_design
#source ./dft.tcl

compile -map_effort medium
report_area  -hierarchy > /home/ahesham/Desktop/ahbtoapb/report_syn/synth_area.rpt
report_cell > /home/ahesham/Desktop/ahbtoapb/report_syn/synth_cells.rpt
report_qor  > /home/ahesham/Desktop/ahbtoapb/report_syn/synth_qor.rpt
report_resources > /home/ahesham/Desktop/ahbtoapb/report_syn/synth_resources.rpt
report_timing -max_paths 10 > /home/ahesham/Desktop/ahbtoapb/report_syn/synth_timing_setup.rpt
report_timing -delay_type min -max_paths 10 > /home/ahesham/Desktop/ahbtoapb/report_syn/synth_timing_hold.rpt
 
write_sdc  output_syn/${design}.sdc 

define_name_rules  no_case -case_insensitive
change_names -rule no_case -hierarchy
change_names -rule verilog -hierarchy
set verilogout_no_tri	 true
set verilogout_equation  false

write -hierarchy -format verilog -output output_syn/${design}.v
write_sdf -version 2.1 output_syn/${design}.sdf
write -f ddc -hierarchy -output output_syn/${design}.ddc  
#write_scan_def -o output_syn/${design}.scandef
#write_test_protocol -o output_syn/${design}.spf 

exit
