//these need to be changed by editing the bytecode due to method variables breaking when editing the decompiled code in UTMT

//this is in an if statement within the SHOW_COLLISIONS debugcommand
:[92]
push.v arg.argument0
pop.v.v global.showcollisions
pushi.e 1
pop.v.b global.updateshowcollisions
pushi.e 4
conv.i.v
pushi.e 7
conv.i.v
call.i event_perform(argc=2)
popz.v

//the initialization of these global variables
pushi.e 0
pop.v.b global.showcollisions
pushi.e 0
pop.v.b global.updateshowcollisions