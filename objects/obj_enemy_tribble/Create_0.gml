/// @description Despawns if fight previously entered
if array_length(spawn_controller1.scriptedFights[fightNo])==0 
	instance_destroy(); //should probably just prevent from spawning
countdown = 0;
graceRemaining = 0;
if global.fightNo==fightNo{
	global.fightNo=-6;
	graceRemaining = 40;
}