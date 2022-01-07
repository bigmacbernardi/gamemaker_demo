/// @description Insert description here
// You can write your code in this editor
show_debug_message("obj_dialoguer "+(instance_exists(obj_dialoguer)?"exists":"does not exist"));
show_debug_message("obj_writer "+(instance_exists(obj_writer)?"exists":"does not exist"));
if(canchoose == 1 && chosen == 0) {
    chosen= 1;
    global.choice= mychoice;
	show_debug_message("obj_dialoguechoice setting alarm");
    alarm[0]= 2;
}
