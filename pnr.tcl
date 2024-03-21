##############################################
########### 1. DESIGN SETUP ##################
##############################################

set design fsm

set sc_dir "/home/standard_cell_libraries/NangateOpenCellLibrary_PDKv1_3_v2010_12"

set_app_var search_path "/home/standard_cell_libraries/NangateOpenCellLibrary_PDKv1_3_v2010_12/lib/Front_End/Liberty/NLDM \
			 /home/ahesham/Desktop/ahbtoapb/output_syn"

set_app_var link_library "NangateOpenCellLibrary_ss0p95v125c.db"
set_app_var target_library "NangateOpenCellLibrary_ss0p95v125c.db"


create_mw_lib   ./${design} \
                -technology $sc_dir/tech/techfile/milkyway/FreePDK45_10m.tf \
		-mw_reference_library $sc_dir/lib/Back_End/mdb \
		-hier_separator {/} \
		-bus_naming_style {[%d]} \
		-open

set tlupmax "$sc_dir/tech/rcxt/FreePDK45_10m_Cmax.tlup"
set tlupmin "$sc_dir/tech/rcxt/FreePDK45_10m_Cmin.tlup"
set tech2itf "$sc_dir/tech/rcxt/FreePDK45_10m.map"

set_tlu_plus_files -max_tluplus $tlupmax \
                   -min_tluplus $tlupmin \
     		   -tech2itf_map $tech2itf


import_designs   ${design}.v \
                -format verilog \
		-top ${design} \
		-cel ${design}


source  ./cons.tcl
set_propagated_clock [get_clocks Hclk]

save_mw_cel -as ${design}_1_imported

##########################################




####
########### 2. Floorplan #####################
##############################################

## Create Starting Floorplan
############################
create_floorplan -start_first_row -flip_first_row \
	-core_width 100 \
	-core_height 100 \
	-left_io2core 15 -bottom_io2core 15 -right_io2core 15 -top_io2core 15


## CONSTRAINTS
## Here, We define more constraints on your design that are related to floorplan stage.
##report_ignored_layers
##remove_ignored_layers -all
set_ignored_layers -max_routing_layer metal6

## Initial Virtual Flat Placement
create_fp_placement -timing -congestion 

save_mw_cel -as ${design}_2_fp


##################################################
########### 3. POWER NETWORK #####################
##################################################

## Defining Logical POWER/GROUND Connections
############################################
derive_pg_connection 	 -power_net VDD		\
			 -ground_net VSS	\
			 -power_pin VDD		\
			 -ground_pin VSS	


## Define Power Ring 
####################
set_fp_rail_constraints  -set_ring -nets  {VDD VSS}  \
                         -horizontal_ring_layer { metal7 metal9 } \
                         -vertical_ring_layer { metal8 metal10 } \
			 -ring_spacing 0.8 \
			 -ring_width 2 \
			 -ring_offset 0.8 \
			 -extend_strap core_ring

## Define Power Mesh 
####################
set_fp_rail_constraints -add_layer  -layer metal10 -direction vertical   -max_pitch 5 -min_pitch 5 -min_width 1.7 -spacing minimum
set_fp_rail_constraints -add_layer  -layer metal9  -direction horizontal -max_pitch 5 -min_pitch 5 -min_width 1.7 -spacing minimum
set_fp_rail_constraints -add_layer  -layer metal8  -direction vertical   -max_pitch 5 -min_pitch 5 -min_width 1.7 -spacing minimum
set_fp_rail_constraints -add_layer  -layer metal7  -direction horizontal -max_pitch 5 -min_pitch 5 -min_width 1.7 -spacing minimum


set_fp_rail_constraints -set_global

## Creating virtual PG pads
# you can create them with gui. Preroute > Create Virtual Power Pad 6 and 117 from ten to 99
create_fp_virtual_pad -net VDD -point {6.1165 10.4745} 
create_fp_virtual_pad -net VDD -point {6.1165 13.4745}
create_fp_virtual_pad -net VDD -point {6.1165 15.4745}
create_fp_virtual_pad -net VDD -point {6.1165 17.4745}
create_fp_virtual_pad -net VDD -point {6.1165 19.4745}
create_fp_virtual_pad -net VDD -point {6.1165 21.4745}
create_fp_virtual_pad -net VDD -point {6.1165 23.4745}
create_fp_virtual_pad -net VDD -point {6.1165 25.4745}
create_fp_virtual_pad -net VDD -point {6.1165 27.4745}
create_fp_virtual_pad -net VDD -point {6.1165 29.4745}
create_fp_virtual_pad -net VDD -point {6.1165 31.4745}
create_fp_virtual_pad -net VDD -point {6.1165 33.4745}
create_fp_virtual_pad -net VDD -point {6.1165 35.4745}
create_fp_virtual_pad -net VDD -point {6.1165 37.4745}
create_fp_virtual_pad -net VDD -point {6.1165 39.4745}
create_fp_virtual_pad -net VDD -point {6.1165 41.4745}
create_fp_virtual_pad -net VDD -point {6.1165 43.4745}
create_fp_virtual_pad -net VDD -point {6.1165 45.4745}
create_fp_virtual_pad -net VDD -point {6.1165 47.4745}
create_fp_virtual_pad -net VDD -point {6.1165 49.4745}
create_fp_virtual_pad -net VDD -point {6.1165 51.4745}
create_fp_virtual_pad -net VDD -point {6.1165 53.4745}
create_fp_virtual_pad -net VDD -point {6.1165 55.4745}
create_fp_virtual_pad -net VDD -point {6.1165 57.4745}
create_fp_virtual_pad -net VDD -point {6.1165 59.4745}
create_fp_virtual_pad -net VDD -point {6.1165 61.4745}
create_fp_virtual_pad -net VDD -point {6.1165 63.4745}
create_fp_virtual_pad -net VDD -point {6.1165 65.4745}
create_fp_virtual_pad -net VDD -point {6.1165 67.4745}
create_fp_virtual_pad -net VDD -point {6.1165 69.4745}
create_fp_virtual_pad -net VDD -point {6.1165 71.4745}
create_fp_virtual_pad -net VDD -point {6.1165 73.4745}
create_fp_virtual_pad -net VDD -point {6.1165 75.4745}
create_fp_virtual_pad -net VDD -point {6.1165 77.4745}
create_fp_virtual_pad -net VDD -point {6.1165 79.4745}
create_fp_virtual_pad -net VDD -point {6.1165 81.4745}
create_fp_virtual_pad -net VDD -point {6.1165 83.4745}
create_fp_virtual_pad -net VDD -point {6.1165 85.4745}
create_fp_virtual_pad -net VDD -point {6.1165 87.4745}
create_fp_virtual_pad -net VDD -point {6.1165 89.4745}
create_fp_virtual_pad -net VDD -point {6.1165 91.4745}
create_fp_virtual_pad -net VDD -point {6.1165 93.4745}
create_fp_virtual_pad -net VDD -point {6.1165 95.4745}
create_fp_virtual_pad -net VDD -point {6.1165 97.4745}
create_fp_virtual_pad -net VDD -point {6.1165 99.4745}
create_fp_virtual_pad -net VDD -point {117.1165 10.4745} 
create_fp_virtual_pad -net VDD -point {117.1165 13.4745}
create_fp_virtual_pad -net VDD -point {117.1165 15.4745}
create_fp_virtual_pad -net VDD -point {117.1165 17.4745}
create_fp_virtual_pad -net VDD -point {117.1165 19.4745}
create_fp_virtual_pad -net VDD -point {117.1165 21.4745}
create_fp_virtual_pad -net VDD -point {117.1165 23.4745}
create_fp_virtual_pad -net VDD -point {117.1165 25.4745}
create_fp_virtual_pad -net VDD -point {117.1165 27.4745}
create_fp_virtual_pad -net VDD -point {117.1165 29.4745}
create_fp_virtual_pad -net VDD -point {117.1165 31.4745}
create_fp_virtual_pad -net VDD -point {117.1165 33.4745}
create_fp_virtual_pad -net VDD -point {117.1165 35.4745}
create_fp_virtual_pad -net VDD -point {117.1165 37.4745}
create_fp_virtual_pad -net VDD -point {117.1165 39.4745}
create_fp_virtual_pad -net VDD -point {117.1165 41.4745}
create_fp_virtual_pad -net VDD -point {117.1165 43.4745}
create_fp_virtual_pad -net VDD -point {117.1165 45.4745}
create_fp_virtual_pad -net VDD -point {117.1165 47.4745}
create_fp_virtual_pad -net VDD -point {117.1165 49.4745}
create_fp_virtual_pad -net VDD -point {117.1165 51.4745}
create_fp_virtual_pad -net VDD -point {117.1165 53.4745}
create_fp_virtual_pad -net VDD -point {117.1165 55.4745}
create_fp_virtual_pad -net VDD -point {117.1165 57.4745}
create_fp_virtual_pad -net VDD -point {117.1165 59.4745}
create_fp_virtual_pad -net VDD -point {117.1165 61.4745}
create_fp_virtual_pad -net VDD -point {117.1165 63.4745}
create_fp_virtual_pad -net VDD -point {117.1165 65.4745}
create_fp_virtual_pad -net VDD -point {117.1165 67.4745}
create_fp_virtual_pad -net VDD -point {117.1165 69.4745}
create_fp_virtual_pad -net VDD -point {117.1165 71.4745}
create_fp_virtual_pad -net VDD -point {117.1165 73.4745}
create_fp_virtual_pad -net VDD -point {117.1165 75.4745}
create_fp_virtual_pad -net VDD -point {117.1165 77.4745}
create_fp_virtual_pad -net VDD -point {117.1165 79.4745}
create_fp_virtual_pad -net VDD -point {117.1165 81.4745}
create_fp_virtual_pad -net VDD -point {117.1165 83.4745}
create_fp_virtual_pad -net VDD -point {117.1165 85.4745}
create_fp_virtual_pad -net VDD -point {117.1165 87.4745}
create_fp_virtual_pad -net VDD -point {117.1165 89.4745}
create_fp_virtual_pad -net VDD -point {117.1165 91.4745}
create_fp_virtual_pad -net VDD -point {117.1165 93.4745}
create_fp_virtual_pad -net VDD -point {117.1165 95.4745}
create_fp_virtual_pad -net VDD -point {117.1165 97.4745}
create_fp_virtual_pad -net VDD -point {117.1165 99.4745}
create_fp_virtual_pad -net VSS -point {16.1165 118.4745}
create_fp_virtual_pad -net VSS -point {18.1165 118.4745}
create_fp_virtual_pad -net VSS -point {21.1165 118.4745}
create_fp_virtual_pad -net VSS -point {23.1165 118.4745}
create_fp_virtual_pad -net VSS -point {25.1165 118.4745}
create_fp_virtual_pad -net VSS -point {27.1165 118.4745}
create_fp_virtual_pad -net VSS -point {29.1165 118.4745}
create_fp_virtual_pad -net VSS -point {31.1165 118.4745}
create_fp_virtual_pad -net VSS -point {33.1165 118.4745}
create_fp_virtual_pad -net VSS -point {35.1165 118.4745}
create_fp_virtual_pad -net VSS -point {37.1165 118.4745}
create_fp_virtual_pad -net VSS -point {39.1165 118.4745}
create_fp_virtual_pad -net VSS -point {41.1165 118.4745}
create_fp_virtual_pad -net VSS -point {43.1165 118.4745}
create_fp_virtual_pad -net VSS -point {45.1165 118.4745}
create_fp_virtual_pad -net VSS -point {47.1165 118.4745}
create_fp_virtual_pad -net VSS -point {49.1165 118.4745}
create_fp_virtual_pad -net VSS -point {51.1165 118.4745}
create_fp_virtual_pad -net VSS -point {53.1165 118.4745}
create_fp_virtual_pad -net VSS -point {55.1165 118.4745}
create_fp_virtual_pad -net VSS -point {57.1165 118.4745}
create_fp_virtual_pad -net VSS -point {59.1165 118.4745}
create_fp_virtual_pad -net VSS -point {61.1165 118.4745}
create_fp_virtual_pad -net VSS -point {63.1165 118.4745}
create_fp_virtual_pad -net VSS -point {65.1165 118.4745}
create_fp_virtual_pad -net VSS -point {67.1165 118.4745}
create_fp_virtual_pad -net VSS -point {69.1165 118.4745}
create_fp_virtual_pad -net VSS -point {71.1165 118.4745}
create_fp_virtual_pad -net VSS -point {73.1165 118.4745}
create_fp_virtual_pad -net VSS -point {75.1165 118.4745}
create_fp_virtual_pad -net VSS -point {77.1165 118.4745}
create_fp_virtual_pad -net VSS -point {79.1165 118.4745}
create_fp_virtual_pad -net VSS -point {81.1165 118.4745}
create_fp_virtual_pad -net VSS -point {83.1165 118.4745}
create_fp_virtual_pad -net VSS -point {85.1165 118.4745}
create_fp_virtual_pad -net VSS -point {87.1165 118.4745}
create_fp_virtual_pad -net VSS -point {89.1165 118.4745}
create_fp_virtual_pad -net VSS -point {91.1165 118.4745}
create_fp_virtual_pad -net VSS -point {93.1165 118.4745}
create_fp_virtual_pad -net VSS -point {95.1165 118.4745}
create_fp_virtual_pad -net VSS -point {97.1165 118.4745}
create_fp_virtual_pad -net VSS -point {99.1165 118.4745}
create_fp_virtual_pad -net VSS -point {16.1165 9.4745}
create_fp_virtual_pad -net VSS -point {18.1165 9.4745}
create_fp_virtual_pad -net VSS -point {21.1165 9.4745}
create_fp_virtual_pad -net VSS -point {23.1165 9.4745}
create_fp_virtual_pad -net VSS -point {25.1165 9.4745}
create_fp_virtual_pad -net VSS -point {27.1165 9.4745}
create_fp_virtual_pad -net VSS -point {29.1165 9.4745}
create_fp_virtual_pad -net VSS -point {31.1165 9.4745}
create_fp_virtual_pad -net VSS -point {33.1165 9.4745}
create_fp_virtual_pad -net VSS -point {35.1165 9.4745}
create_fp_virtual_pad -net VSS -point {37.1165 9.4745}
create_fp_virtual_pad -net VSS -point {39.1165 9.4745}
create_fp_virtual_pad -net VSS -point {41.1165 9.4745}
create_fp_virtual_pad -net VSS -point {43.1165 9.4745}
create_fp_virtual_pad -net VSS -point {45.1165 9.4745}
create_fp_virtual_pad -net VSS -point {47.1165 9.4745}
create_fp_virtual_pad -net VSS -point {49.1165 9.4745}
create_fp_virtual_pad -net VSS -point {51.1165 9.4745}
create_fp_virtual_pad -net VSS -point {53.1165 9.4745}
create_fp_virtual_pad -net VSS -point {55.1165 9.4745}
create_fp_virtual_pad -net VSS -point {57.1165 9.4745}
create_fp_virtual_pad -net VSS -point {59.1165 9.4745}
create_fp_virtual_pad -net VSS -point {61.1165 9.4745}
create_fp_virtual_pad -net VSS -point {63.1165 9.4745}
create_fp_virtual_pad -net VSS -point {65.1165 9.4745}
create_fp_virtual_pad -net VSS -point {67.1165 9.4745}
create_fp_virtual_pad -net VSS -point {69.1165 9.4745}
create_fp_virtual_pad -net VSS -point {71.1165 9.4745}
create_fp_virtual_pad -net VSS -point {73.1165 9.4745}
create_fp_virtual_pad -net VSS -point {75.1165 9.4745}
create_fp_virtual_pad -net VSS -point {77.1165 9.4745}
create_fp_virtual_pad -net VSS -point {79.1165 9.4745}
create_fp_virtual_pad -net VSS -point {81.1165 9.4745}
create_fp_virtual_pad -net VSS -point {83.1165 9.4745}
create_fp_virtual_pad -net VSS -point {85.1165 9.4745}
create_fp_virtual_pad -net VSS -point {87.1165 9.4745}
create_fp_virtual_pad -net VSS -point {89.1165 9.4745}
create_fp_virtual_pad -net VSS -point {91.1165 9.4745}
create_fp_virtual_pad -net VSS -point {93.1165 9.4745}
create_fp_virtual_pad -net VSS -point {95.1165 9.4745}
create_fp_virtual_pad -net VSS -point {97.1165 9.4745}
create_fp_virtual_pad -net VSS -point {99.1165 9.4745}

synthesize_fp_rail  -nets {VDD VSS} -synthesize_power_plan -target_voltage_drop 22 -voltage_supply 1.1 -power_budget 50

commit_fp_rail

set_preroute_drc_strategy -max_layer metal6
preroute_standard_cells -fill_empty_rows -remove_floating_pieces

## If you want to remove power and recreate it
remove_net_shape  [get_net_shapes -of_objects [get_nets -all "VSS VDD"]]
remove_via  [get_vias -of_objects [get_nets -all "VSS VDD"]]


## Analyze IR-drop; Modify power network constraints and re-synthesize, as needed.
analyze_fp_rail  -nets {VDD VSS} -power_budget 50 -voltage_supply 1.1


## Final Floorplan Assessment
create_fp_placement -incremental all; # Updates fp placement after PG mesh creation.

## Add Well Tie Cells
#####################
add_tap_cell_array -master   TAP \
     		   -distance 30 \
     		   -pattern  stagger_every_other_row

save_mw_cel -as ${design}_3_power

##############################################
########### 4. Placement #####################
##############################################
puts "start_place"

## CHECKS
#########
report_ignored_layers 
check_physical_design -stage pre_place_opt
check_physical_constraints

source  ./cons.tcl
set_propagated_clock [get_clocks Hclk]
set_optimize_pre_cts_power_options -low_power_placement true

## INITIAL PLACEMENT
## Initial Placement can be done using the following command using any of its target options 
place_opt -area_recovery -power -congestion

## OPTIMIZATION
############### 
psynopt -area_recovery -power -congestion


## FINAL ASSESSMENT
###################

check_legality
report_design_physical -utilization

# DEFINING POWER/GROUND NETS AND PINS			 
derive_pg_connection     -power_net VDD		\
			 -ground_net VSS	\
			 -power_pin VDD		\
			 -ground_pin VSS	

## Tie fixed values
set tie_pins [get_pins -all -filter "constant_value == 0 || constant_value == 0 && name !~ V* && is_hierarchical == false "]

derive_pg_connection 	 -power_net VDD		\
			 -ground_net VSS	\
			 -tie

if {[sizeof_collection $tie_pins] > 0 } {
	connect_tie_cells -objects $tie_pins \
                  -obj_type port_inst \
		  -tie_low_lib_cell  */LOGIC0_X1 \
		  -tie_high_lib_cell */LOGIC1_X1
}




puts "finish_place"

save_mw_cel -as ${design}_4_placed

##############################################
########### 5. CTS       #####################
##############################################

puts "start_cts"

## CHECKS
#########
check_physical_design -stage pre_clock_opt 
check_clock_tree 
report_clock_tree


## CONSTRAINTS 
##############
## Here, We define more constraints on your design that are related to CTS stage.

set_driving_cell -lib_cell INV_X16 -pin ZN [get_ports Hclk]
###OR
# set_input_transition -rise 0.3 [get_ports clk]
# set_input_transition -fall 0.2 [get_ports clk]

### Set Clock Control/Targets
set_clock_tree_options \
                -clock_trees Hclk \
		-target_early_delay 0.1 \
		-target_skew 0.1 \
		-max_capacitance 300 \
		-max_fanout 5 \
		-max_transition 0.3

set_clock_tree_options -clock_trees Hclk \
		-buffer_relocation true \
		-buffer_sizing true \
		-gate_relocation true \
		-gate_sizing true 


set_clock_tree_references -references {INV_X1 INV_X2}

### Set Clock Physical Constraints
## Clock Non-Default Ruls (NDR) - Set it to be double width and double spacing 
define_routing_rule my_route_rule  \
  -widths   {metal3 0.14 metal4 0.28 metal5 0.28 } \
  -spacings {metal3 0.14 metal4 0.28 metal5 0.28 } 

set_clock_tree_options -clock_trees Hclk \
                       -routing_rule my_route_rule  \
		       -layer_list "metal3 metal4 metal5 "

## To avoid NDR at clock sinks
set_clock_tree_options -use_default_routing_for_sinks 1

report_clock_tree -settings


## Clock Tree : Synhtesis, Optimization, and Routing
####################################################
## The 3 steps can be done with the combo command clock_opt. But below, we do them individually.

## 1- CTS 
clock_opt -only_cts -no_clock_route
## analyze
    report_design_physical -utilization > ./report_pnr/utilization_cts.rpt 
    report_clock_tree -summary ; # reports for the clock tree, regardless of relation between FFs
    report_clock_tree
    report_clock_timing -type summary ; # reports for the clock tree, considering relation between FFs
    report_timing -delay_type max -max_paths 10 > ./report_pnr/timing_setup_cts.rpt
    report_timing -delay_type min -max_paths 10 > ./report_pnr/timing_hold_cts.rpt
    report_constraints -all_violators -max_delay -min_delay
    # Check Congestion
    # Check Timing


## 2- CTO
## To Consider Hold Fix -- Design Dependent
    set_fix_hold [all_clocks]
    set_fix_hold_options -prioritize_tns
clock_opt -only_psyn -no_clock_route
#analyze


## 3- Clock Tree Routing
route_group -all_clock_nets
#analyze

# DEFINING POWER/GROUND NETS AND PINS			 
derive_pg_connection     -power_net VDD		\
			 -ground_net VSS	\
			 -power_pin VDD		\
			 -ground_pin VSS	
			 
save_mw_cel -as ${design}_5_cts

puts "finish_cts"

##############################################
########### 6. Routing   #####################
##############################################

## Before starting to route, you should add spare cells
insert_spare_cells -lib_cell {OR2_X4 NAND2_X4} \
		   -num_instances 20 \
		   -cell_name SPARE_PREFIX_NAME \
		   -tie

set_dont_touch  [all_spare_cells] true
set_attribute [all_spare_cells]  is_soft_fixed true

##############################################

puts "start_route"

check_physical_design -stage pre_route_opt; # dump check_physical_design result to file ./cpd_pre_route_opt_*/index.html
all_ideal_nets
all_high_fanout -nets -threshold 100
check_routeability


set_delay_calculation_options -preroute elmore \
                              -routed_clock elmore \
			      -postroute elmore

#Defines the delay model used to compute a timing arc delay value for a cell or net
#set_delay_calculation_options -preroute     elmore | awe (Asymptotic Waveform Evaluation)
#                              -routed_clock elmore | arnoldi
#			       -postroute    elmore | arnoldi
#			       -awe_effort     low | medium | high
#			       -arnoldi_effort low | medium | high
			      

set_route_options -groute_timing_driven true \
	          -groute_incremental true \
	          -track_assign_timing_driven true \
	          -same_net_notch check_and_fix 

set_si_options -route_xtalk_prevention true\
	       -delta_delay true \
	       -min_delta_delay true \
	       -static_noise true\
	       -timing_window true 


## route_opt : global, track, and detail routing, S&R, logic and placement optimizations with ECO routing
##             End goal: Design that meets timing, crosstalk and route DRC rules

## route_opt -effort high  \      
	  -xtalk_reduction  \   
	  -incremental        
	  

## To Consider Hold Fix
#   set_fix_hold_options -prioritize_tns
   set_fix_hold [all_clocks]
   set_prefer -min  [get_lib_cells "*/BUF_X2 */BUF_X1"]
   set_fix_hold_options -preferred_buffer


route_opt -effort high -xtalk_reduction -incremental
psynopt  -only_hold_time -congestion
route_zrt_eco -open_net_driven true

verify_zrt_route
route_zrt_detail -incremental true -initial_drc_from_input true

insert_zrt_redundant_vias
verify_zrt_route
route_zrt_detail -incremental true -initial_drc_from_input true

derive_pg_connection     -power_net VDD		\
			 -ground_net VSS	\
			 -power_pin VDD		\
			 -ground_pin VSS	




report_noise > ./report_pnr/report_noise_routing.rpt
report_timing -crosstalk_delta


save_mw_cel -as ${design}_6_routed

puts "finish_route"

##############################################
########### 7. Finishing #####################
##############################################


insert_stdcell_filler -cell_without_metal {FILLCELL_X8 FILLCELL_X4 FILLCELL_X2 FILLCELL_X1} \
	-connect_to_power VDD -connect_to_ground VSS

 

derive_pg_connection     -power_net VDD		\
			 -ground_net VSS	\
			 -power_pin VDD		\
			 -ground_pin VSS	

save_mw_cel -as ${design}_7_finished

save_mw_cel -as ${design}

##############################################
########### 8. Checks and Outputs ############
##############################################

verify_zrt_route
verify_lvs -ignore_floating_port -ignore_floating_net \
           -check_open_locator -check_short_locator

set_write_stream_options -map_layer $sc_dir/tech/strmout/FreePDK45_10m_gdsout.map \
                         -output_filling fill \
			 -child_depth 20 \
			 -output_outdated_fill  \
			 -output_pin  {text geometry}

write_stream -lib $design \
                  -format gds\
		  -cells $design\
		  ./output_pnr/${design}.gds



define_name_rules  no_case -case_insensitive
change_names -rule no_case -hierarchy
change_names -rule verilog -hierarchy
set verilogout_no_tri	 true
set verilogout_equation  false


write_verilog -pg -no_physical_only_cells ./output_pnr/${design}_icc.v
write_verilog -no_physical_only_cells ./output_pnr/${design}_icc_nopg.v

extract_rc
write_parasitics -output {./output_pnr/ahbtoapb_top.spef}

report_design_physical -utilization > ./report/pnr_utilization.rpt
report_timing -delay_type max -max_paths 10 > ./report_pnr/pnr_timing_setup_routing.rpt
report_timing -delay_type min -max_paths 10 > ./report_pnr/pnr_timing_hold_routing.rpt
close_mw_cel
close_mw_lib

exit
