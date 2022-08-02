/// @description Update: DO ACTION(CHILDREN) IF LEN(CHILDREN)>1
// Spawn by manager, after setup
show_debug_message("BATTLE MENU CREATED!  REJOICE!");
menuDisplaying = false;
submenuDisplaying = false;
descriptionsOn = false;//global var
bigSubmenu = false;//covers up more
menuActive = false;
selected = false;//leftover
index = 0;
secondIndex = 0;
names = ["Attack","Skills","Talk","Items","Wait","Flee"];//should be loaded from character?  slot?
unit = global.selectedUnit and global.selectedUnit.isPlayer? global.selectedUnit : noone ;
//actions = [attack,skills,talk,item,wait,flee];//
usability=[];
elementals=[];//-1 - Nonelemental, no dot
levels=[];//0 - no levels; 1-3 - levels accessible
//selectedChildren = noone;
actions = [];
players = [];
rows=0;
cols=2;
parent = noone;
for (var i=0;i<battle_manager.totalUnits;i++){
	if !global.units[|i].isPlayer break;
	else players[i]=global.units[|i];
}
function openSubmenu(newOptions,clear=true){//doesn't update parent
	if clear{//useless now
		actions = [];
	}
	usability=[];
	elementals=[];
	levels=[];
	var i = array_length(usability);//was (names) when this did something lol
	actions = newOptions;
	var limit = array_length(newOptions)+i;
	for (; i<limit;i++){//was clear?array_length(names):0; redundant!
		//actions[i]=newOptions[i];
		if actions[i].action==dual usability[i] = battle_manager.checkForReadiness();
		else if variable_struct_exists(actions[i],"mp"){
			if is_array(actions[i].mp){//for multiple levels!
				usability[i] = [];
				for (var j = 0; j<array_length(actions[i].mp);j++){
					usability[i][j]= unit.current[MP]>=actions[i].mp[j];
				}
			}
			else usability[i] = unit.current[MP]>=actions[i].mp;
		}
		else usability[i] = true;
		elementals[i] = actions[i].element;
		levels[i] = actions[i].lvl;
	}
	index=0;
	secondIndex=0;
	var len =  array_length(newOptions);
	rows = 4 + (len>12) + (len>16);
	cols = ceil(len/rows);
	bigSubmenu = array_length(newOptions)>8;
}
/*function getAction(indy=index){
	
}*/

/*function doAMagic(){
	
}*/
element_colors = [c_maroon,c_ltgray,c_red,c_aqua,c_black,c_white,c_yellow,c_black,c_fuchsia,c_aqua,
					c_fuchsia,c_silver,c_lime,c_green,c_lime,c_gray,c_olive,c_navy,c_dkgray,c_orange];
