# Ring oscillator SPICE check (gf180mcu)

Transistor-level transient simulation of the 13-stage ring oscillator that
generates `clk_internal` (the internal clock when `ui_in[7]=1`), for the
ttgf26a (GF180) shuttle.

## Why a realistic load

The internal clock is `ring / 2^DIVIDER_BITS`. ttgf0p2 sized the divider from a
schematic deck that put only **2 fF** per ring node and predicted 50.7 kHz — but
silicon came out **17.234 kHz (~3x slower)**, because 2 fF grossly under-counts
the real interconnect + fanout load. This deck uses **14 fF/node**, calibrated
so the typical corner reproduces the ttgf0p2 silicon for the same gf180mcu
process and standard cells. (The post-layout PEX flow on the
`gf-spice-realistic-load` branch, `pex/`, refines this from the actual extracted
layout — it lands within ~8% of silicon.)

## Corner sweep (3.3 V, 14 fF/node)

| Corner | Ring frequency | uo_out[7] = ring / 2048 |
| --- | --- | --- |
| ff | 136 MHz | 66.6 kHz |
| typical | 101 MHz | 49.5 kHz |
| ss | 72 MHz | 34.9 kHz |

With `CHAIN_LENGTH=13` and `DIVIDER_BITS=11` (/2048), the typical internal clock
lands at ~49.5 kHz — matching the external 50 kHz path, so `ticks_per_milli=50`
is correct for both clock sources.

## Running

```sh
export PDK_ROOT=$HOME/.ciel        # any gf180mcu install with libs.tech + libs.ref
export PDK=gf180mcuD
cd spice/
ngspice -b ring_osc.spice          # prints fmhz (ring frequency in MHz)
```

Switch corners by editing the `.lib sm141064.ngspice typical` line to `ff`/`ss`.
