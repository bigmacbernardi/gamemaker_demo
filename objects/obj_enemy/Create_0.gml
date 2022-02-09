/// @description Despawns if fight previously entered
if !variable_global_exists("spawnController")||!instance_exists(global.spawnController)||global.spawnController<=0{
	if !instance_exists(spawn_controller1) instance_create_depth(0,0,0,spawn_controller1);
	global.spawnController=spawn_controller1;
}

if array_length(global.spawnController.scriptedFights[fightNo])==0 
	instance_destroy(); //should probably just prevent from spawning
	
graceRemaining = (global.fightNo==fightNo?40:0);//sets intangible, unmoving grace period if you just fled this
if global.fightNo==fightNo global.fightNo=-6;