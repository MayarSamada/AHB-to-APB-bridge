# reset
set_fp_rail_constraints -remove_all_layers
remove_fp_virtual_pad -all              
set_fp_rail_strategy -reset             
set_fp_block_ring_constraints -remove_all
set_fp_rail_region_constraints  -remove 
# global constraints
set_fp_rail_constraints -set_global 

# layer constraints
set_fp_rail_constraints -add_layer  -layer metal10 -direction vertical -max_pitch 5.000000 -min_pitch 5.000000 -max_width 5.000000 -min_width 1.700000 -spacing minimum 
set_fp_rail_constraints -add_layer  -layer metal9 -direction horizontal -max_pitch 5.000000 -min_pitch 5.000000 -max_width 5.000000 -min_width 1.700000 -spacing minimum 
set_fp_rail_constraints -add_layer  -layer metal8 -direction vertical -max_pitch 5.000000 -min_pitch 5.000000 -max_width 5.000000 -min_width 1.700000 -spacing minimum 
set_fp_rail_constraints -add_layer  -layer metal7 -direction horizontal -max_pitch 5.000000 -min_pitch 5.000000 -max_width 5.000000 -min_width 1.700000 -spacing minimum 

# ring and strap constraints
set_fp_rail_constraints  -set_ring -nets { VDD VSS } -horizontal_ring_layer { metal7,metal9 } -vertical_ring_layer { metal8,metal10 } -ring_width 2.000000 -ring_spacing 0.800000 -ring_offset 0.800000 -extend_strap core_ring 

# strategies
set_fp_rail_strategy  -use_tluplus true 

# block ring constraints

# regions

# virtual pads
create_fp_virtual_pad -net VDD -point { 6.116500 10.474500 }
create_fp_virtual_pad -net VDD -point { 6.116500 13.474500 }
create_fp_virtual_pad -net VDD -point { 6.116500 15.474500 }
create_fp_virtual_pad -net VDD -point { 6.116500 17.474501 }
create_fp_virtual_pad -net VDD -point { 6.116500 19.474501 }
create_fp_virtual_pad -net VDD -point { 6.116500 21.474501 }
create_fp_virtual_pad -net VDD -point { 6.116500 23.474501 }
create_fp_virtual_pad -net VDD -point { 6.116500 25.474501 }
create_fp_virtual_pad -net VDD -point { 6.116500 27.474501 }
create_fp_virtual_pad -net VDD -point { 6.116500 29.474501 }
create_fp_virtual_pad -net VDD -point { 6.116500 31.474501 }
create_fp_virtual_pad -net VDD -point { 6.116500 33.474499 }
create_fp_virtual_pad -net VDD -point { 6.116500 35.474499 }
create_fp_virtual_pad -net VDD -point { 6.116500 37.474499 }
create_fp_virtual_pad -net VDD -point { 6.116500 39.474499 }
create_fp_virtual_pad -net VDD -point { 6.116500 41.474499 }
create_fp_virtual_pad -net VDD -point { 6.116500 43.474499 }
create_fp_virtual_pad -net VDD -point { 6.116500 45.474499 }
create_fp_virtual_pad -net VDD -point { 6.116500 47.474499 }
create_fp_virtual_pad -net VDD -point { 6.116500 49.474499 }
create_fp_virtual_pad -net VDD -point { 6.116500 51.474499 }
create_fp_virtual_pad -net VDD -point { 6.116500 53.474499 }
create_fp_virtual_pad -net VDD -point { 6.116500 55.474499 }
create_fp_virtual_pad -net VDD -point { 6.116500 57.474499 }
create_fp_virtual_pad -net VDD -point { 6.116500 59.474499 }
create_fp_virtual_pad -net VDD -point { 6.116500 61.474499 }
create_fp_virtual_pad -net VDD -point { 6.116500 63.474499 }
create_fp_virtual_pad -net VDD -point { 6.116500 65.474503 }
create_fp_virtual_pad -net VDD -point { 6.116500 67.474503 }
create_fp_virtual_pad -net VDD -point { 6.116500 69.474503 }
create_fp_virtual_pad -net VDD -point { 6.116500 71.474503 }
create_fp_virtual_pad -net VDD -point { 6.116500 73.474503 }
create_fp_virtual_pad -net VDD -point { 6.116500 75.474503 }
create_fp_virtual_pad -net VDD -point { 6.116500 77.474503 }
create_fp_virtual_pad -net VDD -point { 6.116500 79.474503 }
create_fp_virtual_pad -net VDD -point { 6.116500 81.474503 }
create_fp_virtual_pad -net VDD -point { 6.116500 83.474503 }
create_fp_virtual_pad -net VDD -point { 6.116500 85.474503 }
create_fp_virtual_pad -net VDD -point { 6.116500 87.474503 }
create_fp_virtual_pad -net VDD -point { 6.116500 89.474503 }
create_fp_virtual_pad -net VDD -point { 6.116500 91.474503 }
create_fp_virtual_pad -net VDD -point { 6.116500 93.474503 }
create_fp_virtual_pad -net VDD -point { 6.116500 95.474503 }
create_fp_virtual_pad -net VDD -point { 6.116500 97.474503 }
create_fp_virtual_pad -net VDD -point { 6.116500 99.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 10.474500 }
create_fp_virtual_pad -net VDD -point { 117.116501 13.474500 }
create_fp_virtual_pad -net VDD -point { 117.116501 15.474500 }
create_fp_virtual_pad -net VDD -point { 117.116501 17.474501 }
create_fp_virtual_pad -net VDD -point { 117.116501 19.474501 }
create_fp_virtual_pad -net VDD -point { 117.116501 21.474501 }
create_fp_virtual_pad -net VDD -point { 117.116501 23.474501 }
create_fp_virtual_pad -net VDD -point { 117.116501 25.474501 }
create_fp_virtual_pad -net VDD -point { 117.116501 27.474501 }
create_fp_virtual_pad -net VDD -point { 117.116501 29.474501 }
create_fp_virtual_pad -net VDD -point { 117.116501 31.474501 }
create_fp_virtual_pad -net VDD -point { 117.116501 33.474499 }
create_fp_virtual_pad -net VDD -point { 117.116501 35.474499 }
create_fp_virtual_pad -net VDD -point { 117.116501 37.474499 }
create_fp_virtual_pad -net VDD -point { 117.116501 39.474499 }
create_fp_virtual_pad -net VDD -point { 117.116501 41.474499 }
create_fp_virtual_pad -net VDD -point { 117.116501 43.474499 }
create_fp_virtual_pad -net VDD -point { 117.116501 45.474499 }
create_fp_virtual_pad -net VDD -point { 117.116501 47.474499 }
create_fp_virtual_pad -net VDD -point { 117.116501 49.474499 }
create_fp_virtual_pad -net VDD -point { 117.116501 51.474499 }
create_fp_virtual_pad -net VDD -point { 117.116501 53.474499 }
create_fp_virtual_pad -net VDD -point { 117.116501 55.474499 }
create_fp_virtual_pad -net VDD -point { 117.116501 57.474499 }
create_fp_virtual_pad -net VDD -point { 117.116501 59.474499 }
create_fp_virtual_pad -net VDD -point { 117.116501 61.474499 }
create_fp_virtual_pad -net VDD -point { 117.116501 63.474499 }
create_fp_virtual_pad -net VDD -point { 117.116501 65.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 67.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 69.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 71.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 73.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 75.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 77.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 79.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 81.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 83.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 85.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 87.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 89.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 91.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 93.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 95.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 97.474503 }
create_fp_virtual_pad -net VDD -point { 117.116501 99.474503 }
create_fp_virtual_pad -net VSS -point { 16.116400 118.474503 }
create_fp_virtual_pad -net VSS -point { 18.116400 118.474503 }
create_fp_virtual_pad -net VSS -point { 21.116400 118.474503 }
create_fp_virtual_pad -net VSS -point { 23.116400 118.474503 }
create_fp_virtual_pad -net VSS -point { 25.116400 118.474503 }
create_fp_virtual_pad -net VSS -point { 27.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 29.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 31.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 33.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 35.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 37.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 39.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 41.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 43.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 45.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 47.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 49.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 51.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 53.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 55.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 57.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 59.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 61.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 63.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 65.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 67.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 69.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 71.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 73.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 75.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 77.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 79.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 81.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 83.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 85.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 87.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 89.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 91.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 93.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 95.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 97.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 99.116501 118.474503 }
create_fp_virtual_pad -net VSS -point { 16.116400 9.474500 }
create_fp_virtual_pad -net VSS -point { 18.116400 9.474500 }
create_fp_virtual_pad -net VSS -point { 21.116400 9.474500 }
create_fp_virtual_pad -net VSS -point { 23.116400 9.474500 }
create_fp_virtual_pad -net VSS -point { 25.116400 9.474500 }
create_fp_virtual_pad -net VSS -point { 27.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 29.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 31.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 33.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 35.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 37.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 39.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 41.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 43.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 45.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 47.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 49.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 51.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 53.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 55.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 57.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 59.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 61.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 63.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 65.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 67.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 69.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 71.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 73.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 75.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 77.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 79.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 81.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 83.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 85.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 87.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 89.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 91.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 93.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 95.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 97.116501 9.474500 }
create_fp_virtual_pad -net VSS -point { 99.116501 9.474500 }

# synthesize_fp_rail 
synthesize_fp_rail -nets { VDD VSS } -voltage_supply 1.100000 -power_budget 50.000000  -target_voltage_drop 22.000000  
