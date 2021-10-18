/// @description Insert description here
// You can write your code in this editor


//order for stats set here
#macro HP 0
#macro MP 1
#macro DEF 2
#macro SPD 3
#macro POW 4
#macro ACC 5
#macro XP 6

//characters' indices defined - permanent first, then any guests
#macro AOI 0
#macro YUSUF 1



global.inventory = ds_list_create();
global.currentParty = ds_list_create();//party equivalent of "foesToSpawn" that can also be used for menus
global.chests = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,
false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,
false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,
false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];

ds_list_add(global.currentParty,YUSUF);
ds_list_add(global.currentParty,AOI);
//party: stats
//points: health/MP
//open to rework
global.party[AOI][HP] = 10;
global.party[AOI][MP] = 10;
global.party[AOI][POW] = 2;
global.party[AOI][DEF] = 1;
global.party[AOI][SPD] = 5;
global.party[AOI][ACC] = .75;
global.party[AOI][XP] = 0;

global.party[YUSUF][HP] = 10;
global.party[YUSUF][MP] = 10;
global.party[YUSUF][POW] = 2;
global.party[YUSUF][DEF] = 1;
global.party[YUSUF][SPD] = 5;
global.party[YUSUF][ACC] = .75;
global.party[YUSUF][XP] = 0;

global.points[AOI][HP] = global.party[AOI][HP]; //full health
global.points[AOI][MP] = global.party[AOI][MP]; //full MP
global.points[YUSUF][HP] = global.party[YUSUF][HP]; //full health
global.points[YUSUF][MP] = global.party[YUSUF][MP]; //full MP
var pot = [obj_potion,10]; //in menu, will call: instance_create_depth(0,0,10,obj_potion);
var tot = [obj_tent,2];
var oh = [obj_uhoh,1];
ds_list_add(global.inventory,pot);
ds_list_add(global.inventory,tot);
ds_list_add(global.inventory,oh);

//temp stuff
global.msc= 0;
global.dialogueLine=0;
//global.facechoice=0;
global.flag=[0,0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,0,
			0,0,0,0,0,0,0,0,0,0];