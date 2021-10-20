/// @description Afterward)
// You can write your code in this editor
if (ds_exists(global.units,ds_type_list)){
	ds_list_destroy(global.units);
}

if (ds_exists(global.allies,ds_type_list)){
	ds_list_destroy(global.allies);
}
if (ds_exists(global.enemies,ds_type_list)){
	ds_list_destroy(global.enemies);
}

obj_player.visible = 1;
obj_player.paused = false;