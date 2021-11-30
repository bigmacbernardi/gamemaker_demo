/// @description Despawns if fight previously entered
if (spawn_controller1.scriptedFights[fightNo]) 
	instance_destroy(); //should probably just prevent from spawning
countdown = 0;