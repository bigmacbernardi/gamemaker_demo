//
function keyValue(mate_one,mate_two){ //sorts and converts to key
	show_debug_message("Keying "+string(mate_one)+" with "+string(mate_two));
	return (min(mate_one,mate_two) * 32) + max(mate_one,mate_two);
}
//function dualFromChars(key){	
//}

function slot_dual(){
	var dualReady = battle_manager.checkForReadiness();//need to put here now
	var key = keyValue(global.selectedUnit.index,global.selectedUnit.teammate.index);
	var a;//array
	switch(key){
		case ((AOI*32)+(YUSUF)):
			if (global.dualSkills[0]){//just put them in order
				var icyHeat = instance_create_layer(0,0,"UI_Base",obj_dual);
				icyHeat.selector = rigid_selector;
				icyHeat.title = "Icy Heat";
				icyHeat.description = "Light ice damage on all enemies.  Warm healing to all allies.";
				icyHeat.mode = 2;
				icyHeat.usable = global.selectedUnit.current[MP]>=4 and dualReady;
				icyHeat.script = IcyHeat;
				a[index++] = icyHeat;
			}
			if (global.dualSkills[1]){
				var mugumugu = instance_create_layer(0,0,"UI_Base",obj_dual);
				mugumugu.title = "Mugu mugu";
				mugumugu.description = "Some kinda status thing?  Idk";
				mugumugu.mode = 2;//all enemies
				mugumugu.usable = global.selectedUnit.current[MP]>=4 and dualReady;
				mugumugu.script = MuguMugu;
				a[index++] = mugumugu;
			}
			break;
		case ((AOI*32)+(JAMIR)):
			
			break;
		case ((AOI*32)+(BARDO)):
			
			break;
		case ((YUSUF*32)+(JAMIR)):
			
			break;
		case ((YUSUF*32)+(BARDO)):
			
			break;
		case ((JAMIR*32)+(BARDO)):
			
			break;
		default: //testing only
		
				var aoiBurn = instance_create_layer(0,0,"UI_Base",obj_dual);
				aoiBurn.title = "Burn";
				aoiBurn.description = "Fire damage on all enemies.";
				aoiBurn.script = burn;
				a[index++] = aoiBurn;
			var yusufBalm = instance_create_layer(0,0,"UI_Base",obj_dual);
				yusufBalm.title = "Balm";
				yusufBalm.description = "Heals you and your teammate.  5 MP.";
				yusufBalm.script = balm;
				a[index++] = yusufBalm;
			//a = [];
	}
	obj_dualmenu.options = a;
	
}