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

	current[DEF] = base[@ DEF] + (offhand>0?offhand.defBonus:0)+ (helmet>0?helmet.defBonus:0)+ (armor>0?armor.defBonus:0)+ (digs>0?digs.defBonus:0)+ (acc1?acc1.defBonus:0)+ (acc2?acc2.defBonus:0);
	current[SPD] = base[@ SPD] + (offhand>0?offhand.spdBonus:0)+ (digs>0?digs.spdBonus:0)+ (acc1?acc1.spdBonus:0)+ (acc2?acc2.spdBonus:0);
	current[STR] = base[@ STR] + (weapon>0?weapon.ATK:0);//just for safety
	current[AGI] = base[@ AGI] + (armor>0?armor.agiBonus:0);
	current[CHA] = base[@ CHA];
	current[DEX] = base[@ DEX] + (acc1?acc1.dexBonus:0)+ (acc2?acc2.dexBonus:0);
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
//mpBarWidth = sprite_get_width(ui_mp);
//mpBarHeight = sprite_get_height(ui_mp);