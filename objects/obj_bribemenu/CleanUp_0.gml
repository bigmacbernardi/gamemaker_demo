/// @description Ends the turn if bribe attempted
// You can write your code in this editor
//priorMenu.visible = 1;
if finished{

	show_debug_message("bribe attempted");
	var un = global.selectedUnit;
	with battle_manager{
		alarm[1]=10;
		if un >0 enqueue(un);
	}
}
show_debug_message("cleaning up bribe menu");