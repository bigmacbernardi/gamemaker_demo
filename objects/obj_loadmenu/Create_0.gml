/// @description Insert description here
frameHasPassed=false;
index = 0;
image_blend=c_black;
scrollLevel=0;

options = ds_list_create(); 
for (var i =0;i<99;i++){
	var slot = instance_create_depth(0,0,depth-1,obj_savepreview);
	slot.index = i;
	ds_list_add(options,slot);
}
/*** reinitializing everything so i don't have to count 
	 or go back over future party members ***/
if !variable_global_exists("party"){
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
}
if !variable_global_exists("flag"){
	global.flag=[0,0,0,0,0,0,0,0,0,0,//Elder has gotten your attention
			0,0,0,0,0,0,0,0,0,0,//
			0,0,0,0,0,0,0,0,0,0];//some writer thing, , , , some dialogue thing
}
if !variable_global_exists("chests"){
	global.chests = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,
	false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,
	false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,
	false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
}
if !variable_global_exists("dualSkills"){
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
}
if !variable_global_exists("names"){
	global.names=["Aoi","Yusuf","Jamir","Bardo","Prison Jane","Luchador","Server","Nikolai","Atta","Pat","Wormwood"];
}
if !variable_global_exists("statuses")
	global.statuses=[[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0]];
//if !variable_global_exists("equipped")
//	global.equipped=[[]];

if !variable_global_exists("points")
	global.points=[[]];
if !variable_global_exists("availableParty")
	global.availableParty=ds_list_create();
if !variable_global_exists("inventory")
	global.inventory=ds_list_create();
if !variable_global_exists("equipment")
	global.equipment=ds_list_create();
if !variable_global_exists("passives")
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
function loadGame(fname = "save0.ini"){
	global.equipped=[ [noone,noone,noone,noone,noone,noone,noone,noone], [noone,noone,noone,noone,noone,noone,noone,noone]];
	//^ for debugging weird equipment bug
	ini_open(fname);
	for (var i = 0; i<array_length(global.party);i++){
		global.names[i] = ini_read_string("party","p"+string(i)+"-name",global.names[i]);
		global.points[i][HP] = ini_read_real("party","p"+string(i)+"-HP",1);
		//show_debug_message("Read " + string(global.points[i][HP]) +" HP from " + "p"+string(i)+"-HP");
		global.points[i][MP] = ini_read_real("party","p"+string(i)+"-MP",1);
		//show_debug_message("Read " + string(global.points[i][MP]) +" MP from " + "p"+string(i)+"-MP");
		for (var j = 0; j<12;j++)
			global.party[i][j] = ini_read_real("party","p"+string(i)+"-"+string(j),0);
		for (var j = 0; j<array_length(global.equipped[i]);j++)
			global.equipped[i][j] = ini_read_real("party","e"+string(i)+"-"+string(j),noone);
		for (var j = 0; j<8;j++)
			global.statuses[i][j] = ini_read_real("party","s"+string(i)+"-"+string(j),0);
		var numActions = ini_read_real("party","m"+string(i)+"actions",0);
		show_debug_message("Reading " + string(numActions) +" actions");
		
		for (var j = 0; j<numActions;j++)	{
			global.menuOptions[i][0][j]=ini_read_string("party","m"+string(i)+"n"+string(j),"Go");
			global.menuOptions[i][1][j]=ini_read_real("party","m"+string(i)+"a"+string(j),attack);
		}
		//stores array state in binary
		var skillNum = ini_read_real("party","p"+string(i)+"skills",0);
		var skillTot = ini_read_real("party","p"+string(i)+"totalSkills",1);
		//show_debug_message("Skillnum: "+string(skillNum))
		//show_debug_message("Total skills: "+string(skillTot))
		for (var j = 0;j<=skillTot;j++){
			global.skills[i][j]= (skillNum%2)==1;
			//show_debug_message("Bit "+string(j)+":" +string(skillNum%2))
			skillNum=floor(skillNum/2);
		}
		skillNum = ini_read_real("party","p"+string(i)+"passives",0);
		for (var j = 0;j<array_length(global.passives[i]);j++){
			global.passives[i][j]=skillNum%10;
			skillNum=floor(skillNum/10);
		}
		
		
	}
	var emptiness_string = ds_list_write(global.availableParty);
	ds_list_read(global.availableParty,ini_read_string("global","availableParty",emptiness_string));
	for (var i = 0; i<4;i++){
		global.currentParty[i]=ini_read_real("global","currentParty"+string(i),noone);
	}
	//reading dualSkill and chests from binary
	var skillNum = ini_read_real("global","duals",0);
	for (var i = 0;i<array_length(global.dualSkills);i++){
		global.dualSkills[i]= skillNum%2;
		skillNum=floor(skillNum/2);
	}
	var chestNum = ini_read_real("global","chests",0)
	for (var j = 0;j<array_length(global.chests);j++){
		global.chests[j]=chestNum%2;
		chestNum=floor(chestNum/2);
	};
	var flagNum = ini_read_real("global","flags",0)
	for (var j = 0;j<array_length(global.flag);j++){
		global.flag[j]=flagNum%2;
		flagNum=floor(flagNum/2);
	};
	//ini_write_real("global","returnRoom",global.returnRoom);//set by the enemy YOU FOOL
	global.electrum = ini_read_real("global","electrum",0);
	global.gold = ini_read_real("global","gold",0);
	global.shootHiScore = ini_read_real("global","sHS",0);
	var empty_example = ds_list_create();
	ds_list_read(global.inventory,ini_read_string("global","inventory",ds_list_write(empty_example)));
	ds_list_read(global.equipment,ini_read_string("global","equipment",ds_list_write(empty_example)));
	if !instance_exists(obj_persistentmusicplayer) instance_create_depth(0,0,10,obj_persistentmusicplayer); //can just put in room but i do not trust
	var readNum = ini_read_real("states","trackNo",-1);
	if readNum>-1 obj_persistentmusicplayer.trackNo = readNum;	
	with obj_persistentmusicplayer{
		var possible_tracks = [yusufDayTheme,overworld_breezetemp,d1music1,overworld_manotemp,bouncerock_shoptheme];
		audio_stop_sound(songPlaying);
		songPlaying = audio_play_sound(possible_tracks[trackNo],1,true);
		//audio_sound_set_track_position(songPlaying,continue_position);
		playing = true;	
	}
	if !variable_global_exists("spawnController")||global.spawnController<=0{
		var spawner = ini_read_real("states","spawner",spawn_controller1);
		instance_create_depth(0,0,0,spawner>0?spawner:spawn_controller1);
		global.spawnController = spawner>0?spawner:spawn_controller1;//should just be unique object identifier, hence not assigning instance id
		
		var spawns = ini_write_real("states","spawns",0);
		for (var i = 0; i<spawns;i++){
			var spawnAmt = ini_write_real("states","spawn"+string(i)+"amt",0);
			for (var j = 0; j+2<spawnAmt;j+=3){
				global.spawnController.scriptedFights[i][j] = ini_read_real("states","spawn"+string(i)+"-"+string(j),noone);
				global.spawnController.scriptedFights[i][j+1] = ini_read_real("states","spawn"+string(i)+"x"+string(j),250);
				global.spawnController.scriptedFights[i][j+2] = ini_read_real("states","spawn"+string(i)+"y"+string(j),125);
			}
		}
	}
	else{
		ini_write_real("states","spawner",noone);
		ini_write_real("states","spawns",0);
	}
	if !instance_exists(obj_player){
		instance_create_layer(ini_read_real("position","x",0),ini_read_real("position","y",0),"Instances",obj_player);
	}
	else{
		obj_player.x = ini_read_real("position","x",obj_player.x);
		obj_player.y = ini_read_real("position","y",obj_player.y);
	}
	var rom = ini_read_real("position","room",room);
	ini_close();
	set_sprites();//needed?
	global.lineNo= 0;
	global.dialogueLine=0;
	global.lastSortOpt = 0;
	global.fightNo = -6;
	room_goto(rom);
}