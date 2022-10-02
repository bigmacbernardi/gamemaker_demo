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
#macro MORI 0
#macro MUSA 1
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
global.names=["Mori","Musa","Jamir","Bardo","Prison Jane","Luchador","Server","Nikolai","Atta","Pat","Wormwood"];
//global.varisMistake="Birdo";
global.saveSlot = 1;
global.statuses=[[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0]];
global.inventory = ds_list_create();
global.equipment = ds_list_create();
global.currentParty = [MORI,MUSA,noone,noone];
global.menuOptions = [
[["Attack","Magic","Skills","Items","Dual","Wait","Flee"],[attack,skills,skills,item,dual,wait,flee]],//should be loaded from character?  slot?
[["Attack","Skills","Speak","Items","Dual","Wait","Flee"],[attack,skills,talk,item,dual,wait,flee]],
[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]],[["Go"],[attack]]//
];//DOING AWAY WITH THIS

global.actions=[standardActions(1),standardActions()];
learnStartingSkills();
global.equipped[MORI] = [noone,noone,noone,noone,noone,noone,noone,noone];
global.equipped[MUSA] = [noone,noone,noone,noone,noone,noone,noone,noone];
global.availableParty = ds_list_create();
ds_list_add(global.availableParty,MORI);
ds_list_add(global.availableParty,MUSA);
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
global.perkState=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];//will track path via bitwise addition
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
equip(MORI,1);
equip(MUSA,0);

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
global.party[MORI][HP] = 10;
global.party[MORI][MP] = 10;
global.party[MORI][DEF] = 1;
global.party[MORI][SPD] = 3;
global.party[MORI][STR] = 6;
global.party[MORI][AGI] = 3;
global.party[MORI][CHA] = 3;
global.party[MORI][DEX] = 3;
global.party[MORI][WIS] = 5;
global.party[MORI][ACC] = .75;
global.party[MORI][LV] = 1;
global.party[MORI][XP] = 0;
global.canLearn[MORI]= [true/*Earth*/,true/*Wind*/,true/*Fire*/,true/*Water*/,false/*Dark*/,true/*Light*/,true/*Electric*/,false/*Kiai*/,true/*Poison*/,true/*Ice*/,
						true/*Crystal*/,false/*Magma*/,false/*Acid*/,false/*Rainbow*/,true/*Healing*/,false/*Curing*/,true/*Buffing*/,true/*Time*/,true/*Protect*/,false/*Hydra*/];
global.canLearn[MUSA]= [false/*Earth*/,true/*Wind*/,true/*Fire*/,true/*Water*/,true/*Dark*/,true/*Light*/,true/*Electric*/,true/*Kiai*/,false/*Poison*/,true/*Ice*/,
						false/*Crystal*/,false/*Magma*/,true/*Acid*/,false/*Rainbow*/,true/*Healing*/,true/*Curing*/,true/*Buffing*/,true/*Time*/,true/*Protect*/,false/*Hydra*/];

global.spellConfig=[];
for (var i = 0; i<array_length(global.canLearn[MORI]);i++){
	global.spellConfig[MORI][i]=1;//magic folder for you
	global.spellConfig[MUSA][i]=2;//skill folder
}
//TEST!!!
global.spellConfig[MORI][4]=2;
global.spellConfig[MORI][7]=0;
//TEST!!! end
global.spellLv[MORI] = [3,3,1,2,3,2,3,2,2,1,
						0,1,0,2,0,1,1,3,1,1];
/*global.spellLv[MORI] = [0,0,1,0,0,0,0,0,0,1,
						0,0,0,0,0,0,0,0,0,0];*/
global.spellLv[MUSA] = [0,0,0,0,0,0,0,0,0,0,
						0,0,0,0,0,0,0,0,0,0];
global.party[MUSA][HP] = 10;
global.party[MUSA][MP] = 10;
global.party[MUSA][DEF] = 1;
global.party[MUSA][SPD] = 4;
global.party[MUSA][STR] = 5;
global.party[MUSA][AGI] = 5;
global.party[MUSA][CHA] = 3;
global.party[MUSA][DEX] = 3;
global.party[MUSA][WIS] = 3;
global.party[MUSA][ACC] = .75;
global.party[MUSA][LV] = 1;
global.party[MUSA][XP] = 0;

global.points[MORI][HP] = global.party[MORI][HP]; //full health
global.points[MORI][MP] = global.party[MORI][MP]; //full MP
global.points[MUSA][HP] = global.party[MUSA][HP]; //full health
global.points[MUSA][MP] = global.party[MUSA][MP]; //full MP
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