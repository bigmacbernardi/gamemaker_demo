/// @description Can be used anywhere.
// You can write your code in this editor
image_xscale = camera_get_view_width(cam) / sprite_width;
image_yscale = camera_get_view_height(cam) / sprite_height;
//ds_grid_I'mthinkin
frameHasPassed = false;
//initialize options?

draw_set_font(Roses); //why would i call this every time?
//was spawning all in position for now, just in case we switch to having slots draw themselves
var drawX = 0;
var drawY = y;
options = ds_list_create(); 
for (var i =0;i<99;i++){
	var slot = instance_create_depth(drawX,drawY,depth-1,obj_savepreview);
	slot.index = i;
	ds_list_add(options,slot);
	drawY += 24;
}
/*for (var i = 0; i < ds_list_size(global.inventory); i++){
  ds_list_add(options,instance_create_depth(drawX,drawY,global.inventory[|i][1],global.inventory[|i][0]));
  drawY += 24;
}*/
selected=true;
portraits = [spr_aoi,spr_yusuf,spr_old_man44,spr_old_man44,spr_old_man44,spr_old_man44];
index = global.saveSlot;
if index>6 scrollLevel = floor(index/6)*6;

function saveGame(fname = "save0.ini"){
	ini_open(fname);
	for (var i = 0; i<array_length(global.party);i++){
		ini_write_string("party","p"+string(i)+"-name",global.names[i]);
		if i<array_length(global.points){
			ini_write_real("party","p"+string(i)+"-HP",global.points[i][HP]);
			//show_debug_message("Writing " + string(global.points[i][HP]) +" HP to " + "p"+string(i)+"-HP");
			ini_write_real("party","p"+string(i)+"-MP",global.points[i][MP]);
			//show_debug_message("Writing " + string(global.points[i][MP]) +" MP to " + "p"+string(i)+"-MP");	
		}
		for (var j = 0; j<array_length(global.party[i]);j++)
			ini_write_real("party","p"+string(i)+"-"+string(j),global.party[i][j]);
		for (var j = 0; j<array_length(global.equipped[i]);j++)
			ini_write_real("party","e"+string(i)+"-"+string(j),global.equipped[i][j]);
		for (var j = 0; j<array_length(global.statuses[i]);j++)
			ini_write_real("party","s"+string(i)+"-"+string(j),global.statuses[i][j]);
		var numActions = min(//DESTROYS bad code, with more bad code
					array_length(global.menuOptions[i][0]),
					array_length(global.menuOptions[i][1])
					);
		show_debug_message("Writing " + string(numActions) +" actions");
		ini_write_real("party","m"+string(i)+"actions",numActions);
		for (var j = 0; j<numActions;j++)	{
			ini_write_string("party","m"+string(i)+"n"+string(j),global.menuOptions[i][0][j]);
			ini_write_real("party","m"+string(i)+"a"+string(j),global.menuOptions[i][1][j]);
		}
		//stores array state in binary
		var skillNum = 0;
		var mag = 1;
		for (var j = 0;j<array_length(global.skills[i]);j++){
			if global.skills[i][j] skillNum+=mag;
			mag*=2;
		}
		show_debug_message("Skillnum: "+string(skillNum));
		ini_write_real("party","p"+string(i)+"skills",skillNum);
		skillNum = 0;
		mag = 1;
		for (var j = 0;j<array_length(global.passives[i]);j++){
			skillNum+=global.passives[i][j]*mag;
			mag*=10;
		}
		show_debug_message("Passnum: "+string(skillNum));
		ini_write_real("party","p"+string(i)+"passives",skillNum);
		ini_write_real("party","p"+string(i)+"totalSkills",array_length(global.skills[i]));
	}
	ini_write_string("global","availableParty",ds_list_write(global.availableParty));
	for (var i = 0; i<4;i++){
		ini_write_real("global","currentParty"+string(i),global.currentParty[i]);
	}
	//converting dualSkills and chests to binary
	var skillNum = 0;
	var mag = 1;
	for (var i = 0;i<array_length(global.dualSkills);i++){
		if global.dualSkills[i] skillNum+=mag;
		mag*=2;
	}
	ini_write_real("global","duals",skillNum);
	var chestNum = 0;
	mag = 1;
	for (var j = 0;j<array_length(global.chests);j++){
		if global.chests[j] chestNum+=mag;
		mag*=2;
	}
	ini_write_real("global","chests",chestNum);
	var flagNum = 0;
	mag = 1;
	for (var j = 0;j<array_length(global.flag);j++){
		if global.flag[j] flagNum+=mag;
		mag*=2;
	}
	ini_write_real("global","flags",flagNum);
	//ini_write_real("global","returnRoom",global.returnRoom);//set by the enemy YOU FOOL
	ini_write_real("global","electrum",global.electrum);
	ini_write_real("global","gold",global.gold);
	
	ini_write_real("global","sHS",variable_global_exists("shootHiScore")?global.shootHiScore:0 );
	ini_write_string("global","inventory",ds_list_write(global.inventory));
	ini_write_string("global","equipment",ds_list_write(global.equipment));
	if !instance_exists(obj_persistentmusicplayer)
		ini_write_real("states","trackNo",-1);
	else
		ini_write_real("states","trackNo",obj_persistentmusicplayer.trackNo);
	if variable_global_exists("spawnController")&&global.spawnController>0{
		ini_write_real("states","spawner",global.spawnController);
		ini_write_real("states","spawns",array_length(global.spawnController.scriptedFights));
		for (var i = 0; i<array_length(global.spawnController.scriptedFights);i++){
			
			ini_write_real("states","spawn"+string(i)+"amt",array_length(global.spawnController.scriptedFights[i]));
			for (var j = 0; j+2<array_length(global.spawnController.scriptedFights[i]);j+=3){
				ini_write_real("states","spawn"+string(i)+"-"+string(j),global.spawnController.scriptedFights[i][j]);
				ini_write_real("states","spawn"+string(i)+"x"+string(j),global.spawnController.scriptedFights[i][j+1]);
				ini_write_real("states","spawn"+string(i)+"y"+string(j),global.spawnController.scriptedFights[i][j+2]);
			}
		}
	}
	else{
		ini_write_real("states","spawner",noone);
		ini_write_real("states","spawns",0);
	}
	ini_write_real("position","room",room);
	ini_write_string("position","name",global.location_name);
	ini_write_real("position","x",obj_player.x);
	ini_write_real("position","y",obj_player.y);
	ini_close();
}