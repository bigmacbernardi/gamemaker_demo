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
	escape
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
		case phase.escape: return "escape";
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
function foreach_priority(priority) {
    var size = ds_priority_size(priority);
    
    for (var i = 0; i < size; i++) {
        var element = ds_priority_find_min(priority);
        var key = ds_priority_find_priority(priority, element);
        //func(element, key, i);
	    draw_text_transformed(280,2+(i*15),((i==0)?"NEXT: ":"In "+string(i)+" turn(s): ")+element.title+" ("+string(key)+" left)",.375,.375,0);
        ds_priority_delete_min(priority);
    }
}
function reduce(amt) {
    var copy = ds_priority_create();
	ds_priority_copy(copy,pq);
	var size = ds_priority_size(copy);
    
	show_debug_message("Before all reduction, pq size is "+string(ds_priority_size(pq))+" and copy size is "+string(ds_priority_size(pq)));
    for (var i = 0; i < size; i++) {
        var element = ds_priority_find_min(copy);
        var key = ds_priority_find_priority(copy, element);
		var new_key = key - amt;
        //func(element, key, i);
        ds_priority_change_priority(pq,element,new_key);
			show_debug_message("After change, pq size is "+string(ds_priority_size(pq)));
		ds_priority_delete_min(copy);
			show_debug_message("After copy delete, pq size is "+string(ds_priority_size(pq)));
    }
	show_debug_message("After all reduction, pq size is "+string(ds_priority_size(pq)));
}