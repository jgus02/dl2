transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/jasper/quartus/l3_regcarrylookaddsub {/home/jasper/quartus/l3_regcarrylookaddsub/keypad_input.v}
vlog -sv -work work +incdir+/home/jasper/quartus/l3_regcarrylookaddsub {/home/jasper/quartus/l3_regcarrylookaddsub/binary2Seven_high.sv}
vlog -sv -work work +incdir+/home/jasper/quartus/l3_regcarrylookaddsub {/home/jasper/quartus/l3_regcarrylookaddsub/clock_div.sv}
vlog -sv -work work +incdir+/home/jasper/quartus/l3_regcarrylookaddsub {/home/jasper/quartus/l3_regcarrylookaddsub/clockLadder.sv}
vlog -sv -work work +incdir+/home/jasper/quartus/l3_regcarrylookaddsub {/home/jasper/quartus/l3_regcarrylookaddsub/four2one.sv}
vlog -sv -work work +incdir+/home/jasper/quartus/l3_regcarrylookaddsub {/home/jasper/quartus/l3_regcarrylookaddsub/fsm.sv}
vlog -sv -work work +incdir+/home/jasper/quartus/l3_regcarrylookaddsub {/home/jasper/quartus/l3_regcarrylookaddsub/hex2sevenMX.sv}
vlog -sv -work work +incdir+/home/jasper/quartus/l3_regcarrylookaddsub {/home/jasper/quartus/l3_regcarrylookaddsub/cla_pg_gen.sv}
vlog -sv -work work +incdir+/home/jasper/quartus/l3_regcarrylookaddsub {/home/jasper/quartus/l3_regcarrylookaddsub/cla_logic.sv}
vlog -sv -work work +incdir+/home/jasper/quartus/l3_regcarrylookaddsub {/home/jasper/quartus/l3_regcarrylookaddsub/CarryLookAhead_AddSub.sv}
vlog -sv -work work +incdir+/home/jasper/quartus/l3_regcarrylookaddsub {/home/jasper/quartus/l3_regcarrylookaddsub/AddSub_IO.sv}
vlog -sv -work work +incdir+/home/jasper/quartus/l3_regcarrylookaddsub {/home/jasper/quartus/l3_regcarrylookaddsub/keypad_base.sv}
vlog -sv -work work +incdir+/home/jasper/quartus/l3_regcarrylookaddsub {/home/jasper/quartus/l3_regcarrylookaddsub/keypad_fsm.sv}
vlog -sv -work work +incdir+/home/jasper/quartus/l3_regcarrylookaddsub {/home/jasper/quartus/l3_regcarrylookaddsub/keypad_decoder.sv}
vlog -sv -work work +incdir+/home/jasper/quartus/l3_regcarrylookaddsub {/home/jasper/quartus/l3_regcarrylookaddsub/nBitRegister.sv}

