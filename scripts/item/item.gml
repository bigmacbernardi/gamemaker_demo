// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function item(){
	var inst = instance_create_depth(0, button_attack.y-90,-90, obj_itemmenu);
	inst.priorMenu = button_item;		 
}