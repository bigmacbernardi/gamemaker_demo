/// @description Insert description here
currentIndex=min(0,obj_persistentmusicplayer.trackNo);
easeFrames = 0;
obj_player.paused=true;
currentLevel = global.party[0][LV];
scrollLevel = 0;

items = [obj_antidote,obj_ether,obj_potion,obj_potionsmall,obj_tent,obj_uhoh];
equipment = [obj_antidring,obj_oldhelm,obj_bigspear,obj_bigstick,obj_shotgun,obj_spear,obj_staff,obj_sword,obj_warflail];
names = [];
quantities = [];
var i;
for (i = 0; i < array_length(items); i++){
	var it = items[i];
	names[i] = instance_create_depth(0,0,0,it).title;	
	var found = -1;
	for (var j = 0;j<ds_list_size(global.inventory);j++){
		show_debug_message("Checkin "+object_get_name( global.inventory[|j][0] ));
		if global.inventory[|j][0] == it{
		//	show_debug_message("MATCH!");
			found = j;
			break;
		}
	}
	if found == -1 quantities[i]=0
	else quantities[i] = global.inventory[|j][1];
}
for (i = array_length(items); i < array_length(items)+array_length(equipment); i++){
	var it = equipment[i-array_length(items)];
	names[i] = instance_create_depth(0,0,0,it).title;
	var found = 0;
	for (var j = 0;j<ds_list_size(global.equipment);j++){
		found+=(global.inventory[|j][0] == it);
	}
	quantities[i] = found;
}