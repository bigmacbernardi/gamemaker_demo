/// @description Spawn by manager, after 
// You can write your code in this editor

menuDisplaying = false;
menuActive = false;
selected = false;//leftover
index = 0;
names = ["Attack","Skills","Talk","Items","Wait","Flee"];//should be loaded from character?  slot?
actions = [attack,skills,talk,item,wait,flee];//
players = [];
for (var i=0;i<battle_manager.totalUnits;i++){
	if !global.units[|i].isPlayer break;
	else players[i]=global.units[|i];
}