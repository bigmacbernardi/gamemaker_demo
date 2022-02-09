/// @description Variant of initializer built for 
//order for stats set here
/*#macro HP 0
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
#macro NARANJA 5*/
/*#macro SERVER 6
#macro PAT 7
#macro NIKOLAI 8
#macro SPIDER 9
#macro MANAMI 10
#macro ATTA 11
#macro VARIS 12
#macro OGHUZ 30*/

//temp system stuff
global.lineNo= 0;
global.dialogueLine=0;
//global.facechoice=0;
//global.showBattleDetails = true; //can use this for toggles

instance_create_depth(0,0,10,obj_persistentmusicplayer); //can just put in room but i do not trust
global.lastSortOpt = 0;
global.fightNo = -6;//global.lastUsedSkills = [0,0,0,0,0,0,0,0,0,0,0,0,0,0];//could be used for ease of use