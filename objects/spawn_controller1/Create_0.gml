/// @description Once per area, set enemy fights to none.  Start one screen BEFORE enemies
// Remember to DESTROY when leaving.
scriptedFights = [
	[battle_fungusboss/*battle_enemy*/,234,76,battle_enemy,276,90,battle_enemy,224,124,battle_enemy,256,150],//0
	[battle_enemy,234,76,battle_enemy,276,90,battle_enemy,224,124,battle_enemy,256,150],
	[battle_enemy,234,76,battle_enemy,276,90,battle_enemy,224,124,battle_enemy,256,150],
	[battle_lghost,234,66,battle_lghost,276,90,battle_lghost,224,124,battle_enemy,256,150],
	[battle_footsoldier,224,84],
	[battle_beastling,224,70],															//5
	[battle_beastling,224,70,battle_beastling,260,114],
	[battle_lghost,234,76,battle_lghost,276,90,battle_lghost,224,124,battle_lghost,256,150],
	[battle_lghost,234,76,battle_enemy,276,90,battle_lghost,224,124,battle_enemy,256,150],
	[battle_lghost,234,76,battle_lghost,276,90,battle_lghost,224,124,battle_lghost,256,150],
	[battle_lghost,234,76,battle_lghost,276,90,battle_lghost,224,124,battle_lghost,256,150],//10
	[battle_lghost,234,76,battle_lghost,276,90,battle_lghost,224,124,battle_lghost,256,150],
	[battle_flower,224,80,battle_flower,260,124],
	[battle_flower,224,80,battle_flower,280,104,battle_flower,260,124],
	[battle_flower,224,80,battle_flower2,260,124],
	[battle_flower2,242,100],							//15
	[battle_flower2,224,80,battle_flower2,260,124],
	[battle_smallshroom,260,104],
	[battle_smallshroom,224,70,battle_smallshroom,260,104],
	[battle_smallshroom,234,76,battle_smallshroom,276,90,battle_smallshroom,224,120,battle_smallshroom,256,100]
];
global.spawnController=spawn_controller1;
//This could potentially handle overworld enemy spawns by checking room, too