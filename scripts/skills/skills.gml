// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function skills(){
	var inst = instance_create_depth(0, button_attack.y-90,-90, obj_skillmenu);
	//change list to skills
	inst.priorMenu = battle_menu;	//redundant.
	//also slot_skills could be handled here
}