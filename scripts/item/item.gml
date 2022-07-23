// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function item(){
	var inst = instance_create_depth(0, battle_menu_positioner.y-40,-90, obj_itemmenu);
	inst.priorMenu = battle_menu;		 
}