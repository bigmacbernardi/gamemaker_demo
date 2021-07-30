/// @description Insert description here
// You can write your code in this editor
randomize();
enum phase{
	init,
	startTurn,
	wait,
	process,
	checkFinish,
	endTurn,
	win,
	lose,
}

combatPhase = phase.init;
unitsFinished = 0;

global.units = ds_list_create();
global.selectedUnit = noone;