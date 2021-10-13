/// @description Continue with event

if(keyboard_multicheck_pressed(0/* NOKEY */) == 1) event_user(0);
if (lastMsc != global.msc){
	show_debug_message("Msc = " + string(global.msc));
	lastMsc = global.msc;
}