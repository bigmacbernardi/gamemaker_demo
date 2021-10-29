/// @description Prepare for battle
// You can write your code in this editor

obj_player.paused = true;//lock it in place
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
solicitInput = false;
expEarned = 0;

function curPhaseName(){
	switch(combatPhase){
		case phase.init: return "init";
		case phase.startTurn: return "startTurn";
		case phase.wait: return "wait";
		case phase.process: return "process";
		case phase.checkFinish: return "checkFinish";
		case phase.endTurn: return "endTurn";
		case phase.win: return "win";
		case phase.lose: return "lose";
	}
}

global.units = ds_list_create(); //only used for selector options
global.allies = ds_list_create();
global.enemies = ds_list_create();
pq = ds_priority_create();//only battle managers needs to see this
global.selectedUnit = noone;
global.targets = [noone];
global.P_System = part_system_create_layer("UI_Targeting",false);//special fx!
global.Particle1 = part_type_create();

function getWait(u){
	return 100-u.current[SPD];
}
draw_set_font(Roses);
obj_player.visible = 0;//undoes debug crap
draw_set_colour(c_white);//to reset silly red thing