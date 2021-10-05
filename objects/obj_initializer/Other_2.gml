/// @description Insert description here
// You can write your code in this editor


//order for stats set here
#macro HP 0
#macro ATK 1
#macro DEF 2
#macro SPD 3
#macro ACC 4
#macro XP 5

//characters' indices defined - permanent first, then any guests
#macro AOI 0
#macro YUSUF 1



global.inventory = ds_list_create();
global.currentParty = ds_list_create();//party equivalent of "foesToSpawn" that can also be used for menus

ds_list_add(global.currentParty,YUSUF);
ds_list_add(global.currentParty,AOI);

global.party[AOI][HP] = 10;
global.party[AOI][ATK] = 2;
global.party[AOI][DEF] = 1;
global.party[AOI][SPD] = 5;
global.party[AOI][ACC] = .5;
global.party[AOI][XP] = 0;

global.party[YUSUF][HP] = 10;
global.party[YUSUF][ATK] = 2;
global.party[YUSUF][DEF] = 1;
global.party[YUSUF][SPD] = 5;
global.party[YUSUF][ACC] = .5;
global.party[YUSUF][XP] = 0;
var pot = [obj_potion,10]; //in menu, will call: instance_create_depth(0,0,10,obj_potion);
var tot = [obj_tent,2];
var oh = [obj_uhoh,1];
ds_list_add(global.inventory,pot);
ds_list_add(global.inventory,tot);
ds_list_add(global.inventory,oh);

global.msc= 0;
global.dialogueLine=0;