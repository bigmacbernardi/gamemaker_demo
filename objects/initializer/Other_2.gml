/// @description Insert description here
// You can write your code in this editor


#macro HP 0
#macro ATK 1
#macro DEF 2
#macro SPD 3
#macro ACC 4
#macro XP 5

#macro AOI 0
#macro YUSUF 1
global.inventory = ds_list_create();

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
var pot = instance_create_depth(0,0,10,Potion);
var tot = instance_create_depth(0,0,2,Tent);
var oh = instance_create_depth(0,0,1,Uh_oh);
ds_list_add(global.inventory,pot);
ds_list_add(global.inventory,tot);
ds_list_add(global.inventory,oh);