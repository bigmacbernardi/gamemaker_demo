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
	if it[1]==magic m = in;
	//else if it[1] == talk t=in;
	var ele = -1;
	var lev = 0;
	
	if array_length(it)>4{//has elemental
		ele=it[4];
		if array_length(it)>5{//has extra levels
			lev=it[5];
		}
		//if it[1]==castStandard//lvl should read from//shouldn't happen here!
			//continue;
	}
	switch (it[3]){
		case 0://should do these first
			actions[in++]={
				 name:it[0],
				 action:it[1],
				 element :ele,
				 lvl:lev,
				 children:[],
				 description:getDescription(it[1])
			};
			break;
		case 1: //magic
			if m<array_length(actions)
				actions[m].children[array_length(actions[m].children)]={
																	name:it[0],
																	action:it[1],
																	element:-1,
																	lvl:0,
																	children:[],
																	description:"Sorcel a spelll"
																		};
			else actions[in++]=
				{
					name:it[0],
					 action:it[1],
					 element :(-1),
					 lvl:0,
					 children:[],
					 description:"Sorcel an enspellment"
				};
			break;
		case 2: //skills
			show_debug_message("s: "+string(s)+"\n"+string(array_length(actions))+" actions");
			if s<array_length(actions)
				actions[s].children[array_length(actions[s].children)]={
																	name:it[0],
																	action:it[1],
																	element:-1,
																	lvl:0,
																	children:[],
																	description:"Use special techniques"
																		};
			else actions[in++]=
				{
					name:it[0],
					 action:it[1],
					 element :ele,
					 lvl:lev,
					 children:[]
				};
			break;
		default: //
			actions[s].children[array_length(actions[s].children)]=
			{name:it[0],
			 action:it[1],
			 children:[],
			 element :ele,
			 lvl:lev,
			 description:getDescription(it[1])
			};
			break;
		
	}
	
}
var spell_names = ["Quake","Gale","Flame","Torrent","Dark","Nova","Shock","Kiai","Bitch","no",//torrent=>flood?
			"You","Are","A","Toy","Buzz","HPeal","Statcure","Eight","19","tenty"];
var element_names = ["earth","wind","fire","water","dark","light","electric","kiai","poison","ice",
						"crystal","magma","acid","rainbow","healing","curing","buffing","time","protective","hydra"];
	
var costs = [[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],
				[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16],[5,10,16]];
for (var i = 0;i<array_length(spell_names);i++){
		
	var n = spell_names[i];
	var desc = [];
	//deepest allowed NOT NEEDED!
	//for (var j = 0;j<global.spellLv[index][i];j++){
	if global.spellLv[index][i]>0 {
		//var insertIt = [,castStandard,2,0,costs[i][j],i,];
		//if battling
		switch(i){
			case 8: 
					desc = [["Light "+element_names[i]+" to power up an ally.\nCosts "+string(costs[i][0])+" MP."],
							["Normal "+element_names[i]+" to power up an ally.\nCosts "+string(costs[i][1])+" MP."],
							["Strong "+element_names[i]+" to power up an ally.\nCosts "+string(costs[i][2])+" MP."]];
					break;
			case 14: 
					desc = [["Light "+element_names[i]+" on yourself or an ally.\nCosts "+string(costs[i][0])+" MP."],
							["Normal "+element_names[i]+" on yourself or an ally.\nCosts "+string(costs[i][1])+" MP."],
							["Strong "+element_names[i]+" on yourself or an ally.\nCosts "+string(costs[i][2])+" MP."]];
					break;
			case 15: 
					desc = [["Cures some status ailments.\nCosts "+string(costs[i][0])+" MP."],
							["Cures most status ailments.\nCosts "+string(costs[i][1])+" MP."],
							["Cures all status ailments.\nCosts "+string(costs[i][2])+" MP."]];
					break;
			case 16: 
					desc = [["Lightly powers up an ally.\nCosts "+string(costs[i][0])+" MP."],
							["Powers up an ally.\nCosts "+string(costs[i][1])+" MP."],
							["Heavily powers up an ally.\nCosts "+string(costs[i][2])+" MP."]];
					break;
			case 18: 
					desc = [["Casts a light barrier to protect an ally.\nCosts "+string(costs[i][0])+" MP."],
							["Casts a barrier to protect an ally.\nCosts "+string(costs[i][1])+" MP."],
							["Casts a strong barrier to protect an ally.\nCosts "+string(costs[i][2])+" MP."]];
					break;
			default:
					desc = [["Deals light "+element_names[i]+" damage.\nCosts "+string(costs[i][0])+" MP."],
							["Deals medium "+element_names[i]+" damage.\nCosts "+string(costs[i][1])+" MP."],
							["Deals heavy "+element_names[i]+" damage.\nCosts "+string(costs[i][2])+" MP."]];
		}
		switch (global.spellConfig[index][i]){
			case 0:
				actions[in++]=
				{	name:n,
					action:castStandard,
					mp: costs[i],
					element :i,
					lvl:global.spellLv[index][i],
					children:[]
				};
				break;
			case 1: //magic menu
				if m!=-1{
				actions[m].children[array_length(actions[s].children)]=
				{name:n,
					action:castStandard,
					mp: costs[i],
					element:i,
					lvl:0,
					children:[]
				};
				}
				else{//everyone should have an S at this point
				actions[s].children[array_length(actions[s].children)]=
				{name:n,
					action:castStandard,
					mp: costs[i],
					element:i,
					lvl:0,
					children:slotSkills(self)//should just lump skills into actions, temporary solution
				};	
				}
				break;
			case 2: //skills
				actions[s].children[array_length(actions[s].children)]=
				{name:n,
					action:castStandard,
					mp: costs[i],
					element:i,
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