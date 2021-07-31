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
selectedFinished = false;
processFinished = false;
allowInput = false;

global.units = ds_list_create();
global.selectedUnit = noone;
global.selectedTargets = noone;