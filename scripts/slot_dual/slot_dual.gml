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
				icyHeat.selector = rigid_selector;
				icyHeat.title = "Icy Heat";
				icyHeat.description = "Light ice damage on all enemies.  Warm healing to all allies.";
				icyHeat.mode = 2;
				icyHeat.usable = global.selectedUnit.current[MP]>=4;
				icyHeat.script = IcyHeat;
				a[index++] = icyHeat;
			//}
			//if (freezeLearned){
				var mugumugu = instance_create_layer(0,0,"UI_Base",obj_skill);
				mugumugu.title = "Mugu mugu";
				mugumugu.description = "Ice damage on one enemy.";
				mugumugu.mode = 0;
				mugumugu.usable = global.selectedUnit.current[MP]>=4;
				mugumugu.script = freeze;
				a[index++] = mugumugu;
			//}
			break;
		case ((AOI*32)-(JAMIR)):
			
			break;
		case ((AOI*32)-(BARDO)):
			
			break;
		case ((YUSUF*32)-(JAMIR)):
			
			break;
		case ((YUSUF*32)-(BARDO)):
			
			break;
		case ((JAMIR*32)-(BARDO)):
			
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