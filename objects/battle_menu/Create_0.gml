/// @description Update: DO ACTION(CHILDREN) IF LEN(CHILDREN)>1
// Spawn by manager, after setup

menuDisplaying = false;
submenuDisplaying = false;
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
players = [];
parent = noone;
for (var i=0;i<battle_manager.totalUnits;i++){
	if !global.units[|i].isPlayer break;
	else players[i]=global.units[|i];
}
function openSubmenu(newOptions,clear=true){
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
}
/*function getAction(indy=index){
	
}*/

/*function doAMagic(){
	
}*/