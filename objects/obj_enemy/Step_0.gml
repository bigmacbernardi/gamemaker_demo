/// @description Handles collisions and warp
// You can write your code in this editor
if graceRemaining<=0{
	if place_meeting(x, y, obj_player) && !instance_exists(obj_battle_transition)
	{
		obj_player.paused=true;
		global.returnRoom = room;
		global.fightNo = fightNo;
		global.foesToSpawn = spawn_controller1.scriptedFights[fightNo];//[battle_enemy,224,66,battle_enemy,256,82,battle_enemy,224,114,battle_enemy,256,146];
		//spawn_controller1.scriptedFights[fightNo] = [];//ideally would be set true in battle, so it persists if you flee, but rn that would cause a loop
		var inst = instance_create_depth(0, 0, -9999, obj_battle_transition)
		inst.target_rm = battle_area;
	}
}

else if !(--graceRemaining%4) visible = !visible;
/*else{
	graceRemaining--;
	if graceRemaining%2 visible = !visible;
}*/
depth = -y;//depth can adjust for moving enemies