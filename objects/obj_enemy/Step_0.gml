/// @description Handles collisions and warp
// You can write your code in this editor
if place_meeting(x, y, obj_player) && !instance_exists(obj_battle_transition)
{
	global.returnRoom = room;
	spawn_controller1.scriptedFights[fightNo] = true;//ideally would be set true in battle, so it persists if you flee, but rn that would cause a loop
	global.foesToSpawn = [battle_enemy,224,16,battle_enemy,256,32,battle_enemy,224,64,battle_enemy,256,96];
	var inst = instance_create_depth(0, 0, -9999, obj_battle_transition)
	inst.target_rm = battle_area;
}
depth = -y;//depth can adjust for moving enemies