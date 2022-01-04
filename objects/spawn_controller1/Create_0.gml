/// @description Once per area, set enemy fights to none.  Start one screen BEFORE enemies
// Remember to DESTROY when leaving.
scriptedFights = [
	[battle_enemy,234,76,battle_enemy,276,90,battle_enemy,224,124,battle_enemy,256,150],
	[battle_enemy,234,76,battle_enemy,276,90,battle_enemy,224,124,battle_enemy,256,150],
	[battle_enemy,234,76,battle_enemy,276,90,battle_enemy,224,124,battle_enemy,256,150],
	[battle_lghost,234,66,battle_lghost,276,90,battle_lghost,224,124,battle_enemy,256,150],
	[battle_footsoldier,224,84],
	[battle_beastling,224,70],
	[battle_beastling,224,70,battle_beastling,260,114],
	[battle_lghost,234,76,battle_lghost,276,90,battle_lghost,224,124,battle_lghost,256,150],
	[battle_lghost,234,76,battle_enemy,276,90,battle_lghost,224,124,battle_enemy,256,150],
	[battle_lghost,234,76,battle_lghost,276,90,battle_lghost,224,124,battle_lghost,256,150]
];
global.spawnController=spawn_controller1;
//This could potentially handle overworld enemy spawns by checking room, too