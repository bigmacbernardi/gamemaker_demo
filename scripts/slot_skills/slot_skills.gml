//
function slot_skills(){
	var a; //array
	var index = 0;
	switch(global.selectedUnit.index){//cannot work permanently; use index, e
		case AOI:
			//if (burnLearned){
				var aoiBurn = instance_create_layer(0,0,"UI_Base",obj_skill);
				aoiBurn.title = "Burn";
				aoiBurn.description = "Fire damage on all enemies.";
				aoiBurn.mode = 2;
				aoiBurn.usable = global.selectedUnit.current[MP]>=4;
				aoiBurn.script = burn;
				a[index++] = aoiBurn;
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
		case YUSUF:
			//if (boldLearned){
				var yusufBold = instance_create_layer(0,0,"UI_Base",obj_skill);
				yusufBold.title = "Embolden";
				yusufBold.description = "Raise ally's strength and defense.";
				yusufBold.mode = 1;
				yusufBold.usable = global.selectedUnit.current[MP]>=2;
				yusufBold.script = embolden;
				a[index++] = yusufBold;
			//}
			//if (balmLearned){
				var yusufBalm = instance_create_layer(0,0,"UI_Base",obj_skill);
				yusufBalm.title = "Balm";
				yusufBalm.selector = rigid_selector;
				yusufBalm.mode = 4;//rigid_selector:4 - team stuff
				yusufBalm.usable = global.selectedUnit.current[MP]>=5;
				yusufBalm.description = "Heals you and your teammate.  5 MP.";
				yusufBalm.script = balm;
				a[index++] = yusufBalm;
			//}
			//if (ICLearned){
				var yusufIC = instance_create_layer(0,0,"UI_Base",obj_skill);
				yusufIC.title = "Intensive care";
				yusufIC.mode = 1;
				yusufIC.usable = global.selectedUnit.current[MP]>=10;
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