//
function keyValue(mate_one,mate_two){ //sorts and converts to key
	return (min(mate_one,mate_two) * 32) + max(mate_one,mate_two);
}
//function dualFromChars(key){	
//}

function slot_dual(){
	var key = keyValue(global.selectedUnit.index,global.selectedUnit.teammate.index);
	var a;//array
	switch(key){
		case ((AOI*32)-(YUSUF)):
			//if (icyHeatLearned){
				var icyHeat = instance_create_layer(0,0,"UI_Base",obj_skill);
				icyHeat.title = "Icy Heat";
				icyHeat.description = "Light ice damage on all enemies.  Warm healing to all allies.";
				icyHeat.mode = 2;
				icyHeat.usable = global.selectedUnit.current[MP]>=4;
				icyHeat.script = burn;
				a[index++] = icyHeat;
			//}
			//if (freezeLearned){
				var aoiFreeze = instance_create_layer(0,0,"UI_Base",obj_skill);
				aoiFreeze.title = "Freeze";
				aoiFreeze.description = "Ice damage on one enemy.";
				aoiFreeze.mode = 0;
				aoiFreeze.usable = global.selectedUnit.current[MP]>=4;
				aoiFreeze.script = freeze;
				a[index++] = aoiFreeze;
			//}
			break;
		case ((AOI*32)-(STRAVSKY)):
			
			break;
		case ((AOI*32)-(POLO)):
			
			break;
		case ((YUSUF*32)-(STRAVSKY)):
			
			break;
		case ((YUSUF*32)-(POLO)):
			
			break;
		case ((STRAVSKY*32)-(POLO)):
			
			break;
		default: //testing only
		
				var aoiBurn = instance_create_layer(0,0,"UI_Base",obj_skill);
				aoiBurn.title = "Burn";
				aoiBurn.description = "Fire damage on all enemies.";
				aoiBurn.script = burn;
				a[index++] = aoiBurn;
			var yusufBalm = instance_create_layer(0,0,"UI_Base",obj_skill);
				yusufBalm.title = "Balm";
				yusufBalm.description = "Heals you and your teammate.  5 MP.";
				yusufBalm.script = balm;
				a[index++] = yusufBalm;
			//a = [];
	}
	obj_dualmenu.options = a;
	
}