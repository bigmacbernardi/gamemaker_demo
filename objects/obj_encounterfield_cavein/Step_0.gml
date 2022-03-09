/// @description Insert description here
// You can write your code in this editor
if !activated{
	if place_meeting(x,y,obj_player){
		if stepsToGo == -1 stepsToGo=50+irandom(100);
		else{
		if last_x!=obj_player.x{
			//stepsToGo--;//with: or last_y!=obj_player.y
			stepsToGo=max(0,stepsToGo-round(abs(last_x-obj_player.x)/2));	
		}
		if last_y!=obj_player.y{
			stepsToGo=max(0,stepsToGo-round(abs(last_y-obj_player.y)/2));	
		}
		}
		last_x=obj_player.x;
		last_y=obj_player.y;
	}
	else {
		stepsToGo=-1;	
		last_x=-1;
		last_y=-1;
	}
	if stepsToGo==0{
		activated = true;
		obj_player.paused=true;
		audio_play_sound(shortdamage,100,false);
	}
}
else{
	if dropToGo == 0 { //&& !instance_exists(obj_battle_transition){
		global.returnRoom = room;
		global.fightNo = -1;//RANDOM
		global.foesToSpawn = battles_owned[irandom(array_length(battles_owned)-1)];
		var inst = instance_create_depth(0, 0, -9999, obj_battle_transition)
		inst.target_rm = global.battleRoom;
		instance_destroy();
	}
	else dropToGo--;
}
depth=obj_player.depth-1;