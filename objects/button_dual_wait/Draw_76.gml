/// @description Done whenever made visible
// You can write your code in this editor
var what =  ds_priority_find_min(battle_manager.pq);
//show_debug_message(string(what));
if (global.selectedUnit.teammate == what) { 
	onSprite = spr_dualbutton_on;
	offSprite = spr_dualbutton_off;
	script = dual;//condition will change when there are more party members

}
else {
	onSprite = spr_hold_on;
	offSprite = spr_hold_off;
	script = wait;
}