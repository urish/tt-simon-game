# Ring oscillator SPICE check (sky130)

Transistor-level transient simulation of the 13-stage ring oscillator that generates `clk_internal` (the internal clock when `ui_in[7]=1`).

## Running

```sh
export PDK_ROOT=$(ciel path) || \
  export PDK_ROOT=/home/ttuser/pdk/ciel/sky130/versions/<HASH>
cd spice/
ngspice -b ring_osc.spice
```

`.spiceinit` adds the sky130A models and standard-cell SPICE to the search path.
The testbench prints `freq_mhz` and `stage_ps` at the end of the log.

To run other corners, edit the `.lib sky130.lib.spice tt` line — valid corners include `tt`, `ff`, `ss`, `sf`, `fs`. 