/// @description Insert description here
// You can write your code in this editor

//debugging

draw_text(0,0,"combat phase: "+string(combatPhase)+", selected target: "+string(global.selectedTargets));

for (var i = 0; i < ds_list_size(global.units); i++){
	draw_text(0,16+(i*16),string(global.units[|i]))
}