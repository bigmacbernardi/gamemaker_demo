//
function slot_skills(){
	var a; //array
	var index = 0;
	switch(global.selectedUnit.title){//cannot work permanently bc characters can share names.
		case "Aoi":
			//if (burnLearned){
				var aoiBurn = instance_create_layer(0,0,"UI_Base",obj_skill);
				aoiBurn.title = "Burn";
				aoiBurn.description = "Fire damage on all enemies.";
				aoiBurn.mode = 2;
				aoiBurn.script = burn;
				a[index++] = aoiBurn;
			//}
			//if (freezeLearned){
				var aoiFreeze = instance_create_layer(0,0,"UI_Base",obj_skill);
				aoiFreeze.title = "Freeze";
				aoiFreeze.description = "Ice damage on one enemy.";
				aoiFreeze.mode = 0;
				aoiFreeze.script = freeze;
				a[index++] = aoiFreeze;
			//}
			break;
		case "Yusuf":
			//if (boldLearned){
				var yusufBold = instance_create_layer(0,0,"UI_Base",obj_skill);
				yusufBold.title = "Embolden";
				yusufBold.description = "Raise ally's strength and defense.";
				yusufBold.mode = 1;
				yusufBold.script = embolden;
				a[index++] = yusufBold;
			//}
			//if (balmLearned){
				var yusufBalm = instance_create_layer(0,0,"UI_Base",obj_skill);
				yusufBalm.title = "Balm";
				yusufBalm.mode = 3;
				yusufBalm.description = "Heals you and your teammate.  5 MP.";
				yusufBalm.script = balm;
				a[index++] = yusufBalm;
			//}
			//if (ICLearned){
				var yusufIC = instance_create_layer(0,0,"UI_Base",obj_skill);
				yusufIC.title = "Intensive care";
				yusufIC.mode = 1;
				yusufIC.description = "Raise fallen ally.  10 MP.";
				yusufIC.script = intensiveCare;
				a[index++] = yusufIC;
			//}
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
	obj_skillmenu.options = a;
}