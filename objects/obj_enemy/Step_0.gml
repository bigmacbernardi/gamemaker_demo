/// @description Handles collisions and warp
// You can write your code in this editor
if place_meeting(x, y, obj_player) && !instance_exists(obj_battle_transition)
{
	obj_player.paused=true;
	global.returnRoom = room;
	spawn_controller1.scriptedFights[fightNo] = true;//ideally would be set true in battle, so it persists if you flee, but rn that would cause a loop
	global.foesToSpawn = [battle_enemy,224,66,battle_enemy,256,82,battle_enemy,224,114,battle_enemy,256,146];
	var inst = instance_create_depth(0, 0, -9999, obj_battle_transition)
	inst.target_rm = battle_area;
}
depth = -y;//depth can adjust for moving enemies