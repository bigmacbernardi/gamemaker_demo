/// @description Done whenever made visible
// You can write your code in this editor
//if (global.selectedUnit != battle_player) visible = 0;
//else{
var what =  battle_manager.checkForReadiness(); //always returning true rn.  figure out
//show_debug_message(string(what));
//if (global.selectedUnit.teammate == what) { 
if what {
	onSprite = spr_dualbutton_on;
	offSprite = spr_dualbutton_off;
	script = dual;//condition will change when there are more party members

}
else {
	onSprite = spr_hold_on;
	offSprite = spr_hold_off;
	script = wait;
}
//}