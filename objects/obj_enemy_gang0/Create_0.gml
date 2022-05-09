/// @description Despawns if fight previously entered
if array_length(global.spawnController.scriptedFights[fightNo])==0 
	instance_destroy(); //should probably just prevent from spawning
graceRemaining = (global.fightNo==fightNo?40:0);
if global.fightNo==fightNo global.fightNo=-6;