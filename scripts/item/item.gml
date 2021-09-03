// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function item(){
	var inst = instance_create_layer(0, button_attack.y-90,"UI_Targeting", obj_submenu);
	inst.priorMenu = button_item;		 
}