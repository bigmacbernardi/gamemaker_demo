/// @description Insert description here
// You can write your code in this editor
event_inherited();
if index < 20{//not a guest char
	title = global.names[index];
	base[HP] = global.party[index][HP];
	base[MP] = global.party[index][MP];
	base[DEF] = global.party[index][DEF];
	base[SPD] = global.party[index][SPD];
	base[STR] = global.party[index][STR];
	base[AGI] = global.party[index][AGI];
	base[CHA] = global.party[index][CHA];
	base[DEX] = global.party[index][DEX];
	base[WIS] = global.party[index][WIS];

	base[ACC] = global.party[index][ACC]; //change to formuler
	current[HP] = global.points[index][HP];
	current[MP] = global.points[index][MP];

	/*load equipment*/
	weapon = global.equipped[index][0]>=0?instance_create_depth(x,y,0,global.equipment[|global.equipped[index][0]][0]):0;
	offhand = global.equipped[index][1]>=0?instance_create_depth(x,y,0,global.equipment[|global.equipped[index][1]][0]):0;
	helmet = global.equipped[index][2]>=0?instance_create_depth(x,y,0,global.equipment[|global.equipped[index][2]][0]):0;
	armor = global.equipped[index][3]>=0?instance_create_depth(x,y,0,global.equipment[|global.equipped[index][3]][0]):0;
	digs = global.equipped[index][4]>=0?instance_create_depth(x,y,0,global.equipment[|global.equipped[index][4]][0]):0;
	acc1 = global.equipped[index][5]>=0?instance_create_depth(x,y,0,global.equipment[|global.equipped[index][5]][0]):0;
	boon = global.equipped[index][6]>=0?instance_create_depth(x,y,0,global.equipment[|global.equipped[index][6]][0]):0;
	acc2 = global.equipped[index][7]>=0?instance_create_depth(x,y,0,global.equipment[|global.equipped[index][7]][0]):0;

	current[DEF] = base[@ DEF] //to separate errors
		+ (offhand>0?offhand.defBonus:0)
		+ (helmet>0?helmet.defBonus:0)
		+ (armor>0?armor.defBonus:0)
		+ (digs>0?digs.defBonus:0)
		+ (acc1>0?acc1.defBonus:0)
		+ (acc2>0?acc2.defBonus:0);
	current[SPD] = base[@ SPD] + (offhand>0?offhand.spdBonus:0)+ (digs>0?digs.spdBonus:0)+ (acc1>0?acc1.spdBonus:0)+ (acc2>0?acc2.spdBonus:0);
	current[STR] = base[@ STR] + (weapon>0?weapon.ATK:0);//just for safety
	current[AGI] = base[@ AGI] + (armor>0?armor.agiBonus:0);
	current[CHA] = base[@ CHA];
	current[DEX] = base[@ DEX] + (acc1>0?acc1.dexBonus:0)+ (acc2>0?acc2.dexBonus:0);
	current[WIS] = base[@ WIS] + (offhand>0?offhand.wisBonus:0);
	current[ACC] = base[@ ACC]; // TIMES weapon accuracy!


	

	status = global.statuses[index];

	//sPlayer is filler animation for the knight
	unitSequence = layer_sequence_create("Sequences",x,y,sPlayer);
	isPlayer = true;
	//start and end frames for each state
	idleStart = 0;
	idleEnd = 30;
	atkStart = 30;
	atkEnd = 41;
	intoDefStart = 50;
	intoDefEnd = 55;
	defStart = 56;
	defEnd = 59;
	hitStart = 42;
	hitEnd = 45;
	missStart = 46;
	missEnd = 49;
	deathStart = 61;
	deathMid = 69;
	deathEnd = 73;
	itmStart = 75;
	itmEnd = 87;
	spcStart = 88; //no event, no broadcast
	spcEnd = 100;
}
if (current[HP]==0){//only added for start of battle
		var myId = id;
		layer_sequence_headpos(unitSequence, deathStart);
		state = DEATH;	
		with battle_manager{
			remove(myId);
			totalUnits--;
		}
	}
actions = [];
var in = 0;
var m = -1;
var s = -1;
//var t = -1; //not implemented yet
for (var i = 0; i<ds_list_size(global.actions[index]);i++){
	var it = global.actions[index][|i];
	show_debug_message(string(i)+"st action: "+it[0]);
	if it[1]==skills s = in;
	//else if it[1] == talk t=in;
	switch (it[3]){
		case 0://should do these first
			actions[in++]=
			{name:it[0],
			 action:it[1],
			 element :(-1),
			 lvl:0,
			 children:[]
			};
			if array_length(it)>3{
				
				if array_length(it)>4{
					
				}
				if it[1]==castStandard//lvl should read from
					continue;
			}
			break;
		case 1: //magic
		case 2: //skills
			show_debug_message("s: "+string(s)+"\n"+string(array_length(actions))+" actions");
			if s<array_length(actions)
				actions[s].children[array_length(actions[s].children)]={
																	name:it[0],
																	action:it[1],
																	element:-1,
																	lvl:0,
																	children:[]
																		};
			else actions[in++]=
				{
					name:it[0],
					 action:it[1],
					 element :(-1),
					 lvl:0,
					 children:[]
				};
			break;
		default: //
			actions[s].children[array_length(actions[s].children)]=
			{name:it[0],
			 action:it[1],
			 children:[]
			};
			break;
		
	}
	
}
var names = ["Quake","Gale","Flame","Torrent","Dark","Nova","Shock","Kiai","Bitch","no",//torrent=>flood?
			"You","Are","A","Toy","Buzz","HPeal","Statcure","8","19","tenty"];
var costs = [[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],
				[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16]];
for (var i = 0;i<array_length(names);i++){
		
	var n = names[i];
	//deepest allowed NOT NEEDED!
	//for (var j = 0;j<global.spellLv[index][i];j++){
	if global.spellLv[index][i]>0 {
		//var insertIt = [,castStandard,2,0,costs[i][j],i,];
		//if battling
		switch (global.spellConfig[index][i]){
			case 0:
				actions[in++]=
				{name:n,
					action:castStandard,
					mp: costs[i],
					element :(-1),
					lvl:global.spellLv[index][i],
					children:[]
				};
				break;
			case 1: //magic
			case 2: //skills
				actions[s].children[array_length(actions[s].children)]=
				{name:n,
					action:castStandard,
					mp: costs[i],
					element:-1,
					lvl:0,
					children:[]
				};
				break;
		}
	//else do this however	ds_list_add(list,);
	}
}
//mpBarWidth = sprite_get_width(ui_mp);
//mpBarHeight = sprite_get_height(ui_mp);