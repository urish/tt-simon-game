v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 470 -50 470 50 {lab=#net1}
N -230 10 430 10 {lab=VSS}
N -130 -50 -100 -50 {lab=#net2}
N -20 -50 10 -50 {lab=#net3}
N 90 -50 120 -50 {lab=#net4}
N 200 -50 230 -50 {lab=#net5}
N 310 -50 340 -50 {lab=#net6}
N 420 -50 470 -50 {lab=#net1}
N 420 50 470 50 {lab=#net1}
N 310 50 340 50 {lab=#net7}
N 200 50 230 50 {lab=#net8}
N 90 50 120 50 {lab=#net9}
N -20 50 10 50 {lab=#net10}
N -130 50 -100 50 {lab=#net11}
N -250 50 -210 50 {lab=#net12}
N -230 110 320 110 {lab=VSS}
N -250 -50 -210 -50 {lab=#net13}
N -370 50 -320 50 {lab=clk_out}
N -370 -30 -370 50 {lab=clk_out}
N -400 -70 -370 -70 {lab=en}
C {sg13g2_stdcells/sg13g2_inv_1.sym} -60 -50 0 0 {name=x2 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} -170 -50 0 0 {name=x1 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} 50 -50 0 0 {name=x3 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} 160 -50 0 0 {name=x4 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} 270 -50 0 0 {name=x5 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} 380 -50 0 0 {name=x6 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} 380 50 0 1 {name=x7 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} 270 50 0 1 {name=x8 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} 160 50 0 1 {name=x9 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} 50 50 0 1 {name=x10 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} -60 50 0 1 {name=x11 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} -170 50 0 1 {name=x12 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_inv_1.sym} -280 50 0 1 {name=x13 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {lab_wire.sym} -370 50 0 0 {name=p1 sig_type=std_logic lab=clk_out}
C {code_shown.sym} -320 170 0 0 {name=NGSPICE only_toplevel=true value="
.lib cornerMOSlv.lib mos_tt_stat
.lib cornerMOShv.lib mos_tt_stat
.include sg13g2_stdcell.spice

.control
save all
tran 10p 100n
write ring_osc.raw
meas tran tdiff TRIG "clk_out" VAL=1.1 RISE=50 TARG "clk_out" VAL=1.1 RISE=51
let freq_mhz = (1 / (tdiff) / 1e6)
print freq_mhz
plot clk_out
.endc
"}
C {vsource.sym} -620 0 0 0 {name=V1 value=0 savecurrent=false}
C {lab_pin.sym} -620 -30 0 0 {name=p2 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -620 30 0 0 {name=p3 sig_type=std_logic lab=0}
C {vsource.sym} -530 0 0 0 {name=V2 value=1.2 savecurrent=false}
C {lab_pin.sym} -530 30 0 0 {name=p4 sig_type=std_logic lab=VSS
value=1.5}
C {lab_pin.sym} -530 -30 0 0 {name=p5 sig_type=std_logic lab=VDD
value=1.5}
C {capa.sym} -230 -20 0 0 {name=C1
m=1
value=2f
footprint=1206
device="ceramic capacitor"}
C {capa.sym} -120 -20 0 0 {name=C2
m=1
value=2f
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} -230 10 0 0 {name=p6 sig_type=std_logic lab=VSS
value=1.5}
C {capa.sym} -10 -20 0 0 {name=C3
m=1
value=2f
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 100 -20 0 0 {name=C4
m=1
value=2f
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 210 -20 0 0 {name=C5
m=1
value=2f
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 320 -20 0 0 {name=C6
m=1
value=2f
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 430 -20 0 0 {name=C7
m=1
value=2f
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 320 80 0 0 {name=C8
m=1
value=2f
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 210 80 0 0 {name=C9
m=1
value=2f
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 100 80 0 0 {name=C10
m=1
value=2f
footprint=1206
device="ceramic capacitor"}
C {capa.sym} -10 80 0 0 {name=C11
m=1
value=2f
footprint=1206
device="ceramic capacitor"}
C {capa.sym} -120 80 0 0 {name=C12
m=1
value=2f
footprint=1206
device="ceramic capacitor"}
C {capa.sym} -230 80 0 0 {name=C13
m=1
value=2f
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} -230 110 0 0 {name=p7 sig_type=std_logic lab=VSS
value=1.5}
C {sg13g2_stdcells/sg13g2_and2_1.sym} -310 -50 0 0 {name=x14 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {lab_wire.sym} -380 -70 0 0 {name=p8 sig_type=std_logic lab=en}
C {sg13g2_stdcells/sg13g2_buf_1.sym} -590 -100 0 0 {name=x15 VDD=VDD VSS=VSS prefix=sg13g2_ }
C {lab_pin.sym} -550 -100 0 1 {name=p10 sig_type=std_logic lab=en}
C {lab_pin.sym} -630 -100 0 0 {name=p9 sig_type=std_logic lab=VDD
value=1.5}
