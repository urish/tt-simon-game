# Ring oscillator clock
# Constrain at the fast end: GF180 SPICE gives ~136 MHz at the ff corner
# (3.3 V, 27 C); 200 MHz adds headroom for voltage/temperature beyond that sweep.
set rosc_clock_name "clk_ring_osc"
set rosc_freq_mhz 200
set rosc_clock_net [get_nets $rosc_clock_name]
set rosc_pin [get_pins -of_objects $rosc_clock_net -filter "direction==output"]
puts "\[INFO] Using ring oscillator clock $rosc_clock_name"
create_clock $rosc_pin -name $rosc_clock_name -period [expr 1000.0 / $rosc_freq_mhz]

# Clock divider stages
puts "\[INFO] Generating clock divider stages"
set divider_stages 11
set prev_stage_clk_pin $rosc_pin
set divider_stages_clocks [list]
for {set i 0} {$i < $divider_stages - 1} {incr i} {
    set net_name "ring_osc.divider\[$i]"
    set net [get_nets $net_name]
    set clk_pin [get_pins -of_objects $net -filter "direction==output"]
    create_generated_clock -name $net_name -source $prev_stage_clk_pin -divide_by 2 $clk_pin
    puts "\[INFO] -> Created clock $net_name"
    lappend divider_stages_clocks {*}[get_clocks $net_name]
    set prev_stage_clk_pin $clk_pin
}

# The main clock (clk_simon) is covered by project.sdc:

source $::env(DESIGN_DIR)/project.sdc

set_clock_groups -asynchronous -group [get_clocks $rosc_clock_name] -group [get_clocks $clock_name] -group $divider_stages_clocks
