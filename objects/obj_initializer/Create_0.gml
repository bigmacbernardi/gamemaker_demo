/// @description Game start stuff
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
#macro PJANE 4
#macro NARANJA 5
/*#macro SERVER 6
#macro PAT 7
#macro NIKOLAI 8
#macro SPIDER 9
#macro MANAMI 10
#macro ATTA 11
#macro VARIS 12
#macro OGHUZ 30*/

/*party stuff*/
global.nameplate = noone;//probably a dialogue thing?
global.location_name = "Startup";
global.names=["Aoi","Yusuf","Jamir","Bardo","Prison Jane","Luchador","Server","Nikolai","Atta","Pat","Wormwood"];
//global.varisMistake="Birdo";
global.saveSlot = 1;
global.statuses=[[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0]];
global.inventory = ds_list_create();
global.equipment = ds_list_create();
global.currentParty = [AOI,YUSUF,noone,noone];
global.menuOptions = [
[["Attack","Magic","Skills","Items","Dual","Wait","Flee"],[attack,skills,skills,item,dual,wait,flee]],//should be loaded from character?  slot?
[["Attack","Skills","Speak","Items","Dual","Wait","Flee"],[attack,skills,talk,item,dual,wait,flee]],
[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]]//
];//DOING AWAY WITH THIS

global.actions=[standardActions(1),standardActions()];
global.equipped[AOI] = [noone,noone,noone,noone,noone,noone,noone,noone];
global.equipped[YUSUF] = [noone,noone,noone,noone,noone,noone,noone,noone];
global.availableParty = ds_list_create();
ds_list_add(global.availableParty,AOI);
ds_list_add(global.availableParty,YUSUF);
global.passives = [
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
];
global.skills= [/*naive solution that's getting REPLACED*/
	[true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
	[true,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
	[true,true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
	[true,true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
	[true,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false],
	[]
];
global.dualSkills = [//even MORE naive, but probably NOT getting replaced
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
global.canLearn=[];
/*var staff =  instance_create_depth(0,0,10,obj_weapon);//for now we'll just leave these as persistent things.  will compress eventually
var spear = instance_create_depth(0,0,10,obj_weapon);
spear.title = "Kida-yari";
spear.description = "A spear-like staff used mainly for ceremonial magic.  But those spikes aren't just ornamental.";
spear.ATK = 3;
spear.type = 2;//polearm!
staff.title = "Pathfinder Staff";
staff.description = "A big, blunt shillelagh originally designed by shepherds.  Speakers use these to feel through the shadows of the future.";
staff.ATK = 2;
staff.type = 1;//staff!*/
ds_list_add(global.equipment,[obj_staff,noone]);//was staff
ds_list_add(global.equipment,[obj_spear,noone]);//was spear
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
global.canLearn[AOI]= [true/*Earth*/,true/*Wind*/,true/*Fire*/,true/*Water*/,false/*Dark*/,true/*Light*/,true/*Electric*/,false/*Kiai*/,true/*Poison*/,true/*Ice*/,
						true/*Crystal*/,false/*Magma*/,false/*Acid*/,false/*Rainbow*/,true/*Healing*/,false/*Curing*/,true/*Buffing*/,true/*Time*/,true/*Protect*/,false/*Hydra*/];
global.canLearn[YUSUF]= [false/*Earth*/,true/*Wind*/,true/*Fire*/,true/*Water*/,true/*Dark*/,true/*Light*/,true/*Electric*/,true/*Kiai*/,false/*Poison*/,true/*Ice*/,
						false/*Crystal*/,false/*Magma*/,true/*Acid*/,false/*Rainbow*/,true/*Healing*/,true/*Curing*/,true/*Buffing*/,true/*Time*/,true/*Protect*/,false/*Hydra*/];

global.spellConfig=[];
for (var i = 0; i<array_length(global.canLearn[AOI]);i++){
	global.spellConfig[AOI][i]=1;//magic folder for you
	global.spellConfig[YUSUF][i]=2;//skill folder
}
//TEST!!!
global.spellConfig[AOI][4]=2;
global.spellConfig[AOI][7]=0;
//TEST!!! end
global.spellLv[AOI] = [3,3,1,2,3,2,3,2,2,1,
						0,0,0,2,0,0,0,4,0,0];
/*global.spellLv[AOI] = [0,0,1,0,0,0,0,0,0,1,
						0,0,0,0,0,0,0,0,0,0];*/
global.spellLv[YUSUF] = [0,0,0,0,0,0,0,0,0,0,
						0,0,0,0,0,0,0,0,0,0];
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
var dot = [obj_antidote,5];
var oh = [obj_uhoh,1];
ds_list_add(global.inventory,pot);
ds_list_add(global.inventory,eth);
ds_list_add(global.inventory,tot);
ds_list_add(global.inventory,dot);
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