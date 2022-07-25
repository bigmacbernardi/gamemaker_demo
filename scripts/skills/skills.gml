// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function magic(){//placeholder function
	var inst = instance_create_depth(0, battle_menu_positioner.y-40,-90, obj_skillmenu);
	//change list to skills
	inst.priorMenu = battle_menu;	//redundant.
	//also slot_skills could be handled here
}
function skills(){
	var inst = instance_create_depth(0, battle_menu_positioner.y-40,-90, obj_skillmenu);
	//change list to skills
	inst.priorMenu = battle_menu;	//redundant.
	//also slot_skills could be handled here
}
function talk(){
	var inst = instance_create_depth(0, battle_menu_positioner.y-40,-90, obj_submenu);
	inst.priorMenu = battle_menu;	//redundant.
	switch global.selectedUnit.index{
		case YUSUF:
			var negotiat = instance_create_layer(0,battle_menu_positioner.y-80,"UI_Base", obj_skill);
			var pacif = instance_create_layer(0,battle_menu_positioner.y-80,"UI_Base", obj_skill);
			var convo = instance_create_layer(0,battle_menu_positioner.y-80,"UI_Base", obj_skill);
			negotiat.title = "Negotiate";
			negotiat.description = "Persuade or bribe an enemy for peaceful and mutually \ngainful resolution.";
			negotiat.script = negotiate;
			negotiat.mode=0;
			pacif.title = "Pacify (All)";
			pacif.description = "Try to talk your enemies down.";
			pacif.mode=2;
			pacif.script=pacify;
			convo.title = "Converse";
			convo.description = "Talk it out.";
			convo.mode=0;
			convo.script=converse;
			ds_list_add(inst.optionSlots,convo);
			ds_list_add(inst.optionSlots,pacif);
			ds_list_add(inst.optionSlots,negotiat);
			break;
		case AOI:
			var pacif = instance_create_layer(0,battle_menu_positioner.y-80,"UI_Base", obj_skill);
			var interrogat= instance_create_layer(0,battle_menu_positioner.y-80,"UI_Base", obj_skill);
			var convo = instance_create_layer(0,battle_menu_positioner.y-80,"UI_Base", obj_skill);
			pacif.title = "Pacify (Single)";
			pacif.description = "Try to talk an enemy down.";
			pacif.mode=0;
			pacif.script=pacify;
			interrogat.title = "Interrogate";
			interrogat.description = "Shake an enemy down for information.\nMore effective on damaged or weaker enemies.";
			interrogat.script = interrogate;
			interrogat.mode=0;
			convo.title = "Converse";
			convo.description = "Talk it out.";
			convo.mode=0;
			convo.script=converse;
			ds_list_add(inst.optionSlots,convo);
			ds_list_add(inst.optionSlots,pacif);
			ds_list_add(inst.optionSlots,interrogat);
			break;
		default:
			break;
	}
	return inst;
}