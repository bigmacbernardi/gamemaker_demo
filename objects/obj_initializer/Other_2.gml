/// @description Insert description here
//order for stats set here
#macro HP 0
#macro MP 1
#macro DEF 2
#macro SPD 3
#macro STR 4
#macro AGI 5
#macro CHA 6
#macro DEX 7
#macro WIS 8
#macro ACC 9 //should be function of other stats
#macro LV 10
#macro XP 11

//characters' indices defined - permanent first, then any guests
#macro AOI 0
#macro YUSUF 1
#macro JAMIR 2
#macro BARDO 3
/*#macro PJANE 4
#macro WRESTLER 5
#macro SERVER 6
#macro PAT 7
#macro NIKOLAI 8
#macro SPIDER 9
#macro MANAMI 10
#macro ATTA 11
#macro VARIS 12
#macro OGHUZ 30*/

/*party stuff*/
global.names=["Aoi","Yusuf","Jamir","Bardo","Prison Jane","Luchador","Server","Nikolai","Atta","Pat","Wormwood"];
//global.varisMistake="Birdo";
global.statuses=[[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0]];
global.inventory = ds_list_create();
global.equipment = ds_list_create();
global.currentParty = [AOI,YUSUF,noone,noone];
global.menuOptions = [
[["Attack","Skills","Speak","Items","Wait","Flee"],[attack,skills,talk,item,wait,flee]],//should be loaded from character?  slot?
[["Attack","Skills","Talk","Items","Wait","Flee"],[attack,skills,talk,item,wait,flee]],
[["Go"],[attack]],[["Go"],[attack]]//
];
global.equipped[AOI] = [noone,noone,noone,noone,noone,noone,noone,noone];
global.equipped[YUSUF] = [noone,noone,noone,noone,noone,noone,noone,noone];
global.availableParty = ds_list_create();
ds_list_add(global.availableParty,AOI);
ds_list_add(global.availableParty,YUSUF);
global.skills= [/*naive but still fully functional solution*/
	[true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
	[true,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
	[true,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
	[true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
	[true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
	[]
];
global.dualSkills = [//even MORE naive
	true,true,false,false,false,false,false,
	false,false,false,false,false,false,false,
	false,false,false,false,false,false,false,
	false,false,false,false,false,false,false,
	false,false,false,false,false,false,false,
	false,false,false,false,false,false,false,
	false,false,false,false,false,false,false,
	false,false,false,false,false,false,false,
	false,false,false,false,false,false,false,
	false,false,false,false,false,false,false,
	false,false,false,false,false,false,false,
	false,false,false,false,false,false,false,
	false,false,false,false,false,false,false,
	false,false,false,false,false,false,false,
	false,false,false,false,false,false,false
];
global.electrum= 99;
global.gold = 0;
var staff =  instance_create_depth(0,0,10,obj_weapon);//for now we'll just leave these as persistent things.  will compress eventually
var spear = instance_create_depth(0,0,10,obj_weapon);
spear.title = "Kida-yari";
spear.description = "A spear-like staff used mainly for ceremonial magic.  But those spikes aren't just ornamental.";
spear.ATK = 3;
spear.type = 2;//polearm!
staff.title = "Pathfinder Staff";
staff.description = "A big, blunt shillelagh originally designed by shepherds.  Searchers uses these to feel through the shadows of the future.";
staff.ATK = 2;
staff.type = 1;//staff!
ds_list_add(global.equipment,staff);
ds_list_add(global.equipment,spear);
equip(AOI,1);
equip(YUSUF,0);

/*world stuff*/
global.flag=[0,0,0,0,0,0,0,0,0,0,//Elder has gotten your attention
			0,0,0,0,0,0,0,0,0,0,//
			0,0,0,0,0,0,0,0,0,0];//some writer thing, , , , some dialogue thing
global.chests = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,
false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,
false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,
false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];

//party: stats
//points: health/MP
//open to rework
global.party[AOI][HP] = 10;
global.party[AOI][MP] = 10;
global.party[AOI][DEF] = 1;
global.party[AOI][SPD] = 3;
global.party[AOI][STR] = 6;
global.party[AOI][AGI] = 3;
global.party[AOI][CHA] = 3;
global.party[AOI][DEX] = 3;
global.party[AOI][WIS] = 5;
global.party[AOI][ACC] = .75;
global.party[AOI][LV] = 1;
global.party[AOI][XP] = 0;

global.party[YUSUF][HP] = 10;
global.party[YUSUF][MP] = 10;
global.party[YUSUF][DEF] = 1;
global.party[YUSUF][SPD] = 4;
global.party[YUSUF][STR] = 5;
global.party[YUSUF][AGI] = 5;
global.party[YUSUF][CHA] = 3;
global.party[YUSUF][DEX] = 3;
global.party[YUSUF][WIS] = 3;
global.party[YUSUF][ACC] = .75;
global.party[YUSUF][LV] = 1;
global.party[YUSUF][XP] = 0;

global.points[AOI][HP] = global.party[AOI][HP]; //full health
global.points[AOI][MP] = global.party[AOI][MP]; //full MP
global.points[YUSUF][HP] = global.party[YUSUF][HP]; //full health
global.points[YUSUF][MP] = global.party[YUSUF][MP]; //full MP
var pot = [obj_potionsmall,10]; //in menu, will call: instance_create_depth(0,0,10,obj_potionsmall);
var eth = [obj_ether,4]; //in menu, will call: instance_create_depth(0,0,10,obj_potionsmall);
var tot = [obj_tent,2];
var oh = [obj_uhoh,1];
ds_list_add(global.inventory,pot);
ds_list_add(global.inventory,eth);
ds_list_add(global.inventory,tot);
ds_list_add(global.inventory,oh);

//temp system stuff
global.lineNo= 0;
global.dialogueLine=0;
//global.facechoice=0;
//global.showBattleDetails = true; //can use this for toggles

instance_create_depth(0,0,10,obj_persistentmusicplayer); //can just put in room but i do not trust
global.lastSortOpt = 0;
global.fightNo = -6;//current battle OR last battle fled
//global.lastUsedSkills = [0,0,0,0,0,0,0,0,0,0,0,0,0,0];//could be used for ease of use