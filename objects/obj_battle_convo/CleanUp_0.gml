/// @description Does not reveal priorMenu anymore
//priorMenu.visible = 1;
//ds_list_destroy(lines);//is this unneeded?
var un = global.selectedUnit;
with battle_manager{
	alarm[1]=10;
	if un >0 enqueue(un);
}
show_debug_message("cleaning up convo");