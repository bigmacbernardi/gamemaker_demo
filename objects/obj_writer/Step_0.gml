/// @description Continue with event

if(keyboard_multicheck_pressed(0/* NOKEY */) == 1) event_user(0);
if (lastMsc != global.lineNo){
	show_debug_message("Msc = " + string(global.lineNo));
	lastMsc = global.lineNo;
}