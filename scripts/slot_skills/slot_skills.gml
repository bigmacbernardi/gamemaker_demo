//
function slot_skills(){
	var ui_level = layer_exists("UI_Base")?"UI_Base":"Instances";
	var a; //"all" array
	var m = [],t = [],o = [],u = [],c = [];//more arrays. magic, trained, observed (enemy skills), unique, common
	var index = 0;
	var mIndex = 0; var tIndex = 0; var oIndex = 0; var uIndex = 0; var cIndex = 0;
	var battling = instance_exists(battle_manager);
	switch(battling?global.selectedUnit.index:global.selectedUnit){//cannot work permanently; use index, e
		case AOI:
			if (global.skills[AOI][0]){
				var aoiBurn = instance_create_layer(0,0,ui_level,obj_skill);
				aoiBurn.title = "Burn";
				aoiBurn.description = "Fire damage on all enemies.";
				aoiBurn.mode = 2;
				if battling{
					aoiBurn.usable = global.selectedUnit.current[MP]>=4;
					aoiBurn.script = burn;
				}else aoiBurn.usable = false;
				a[index++] = aoiBurn;
				m[mIndex++] = aoiBurn;
			}
			if (global.skills[AOI][1]){
				var aoiFreeze = instance_create_layer(0,0,ui_level,obj_skill);
				aoiFreeze.title = "Freeze";
				aoiFreeze.description = "Ice damage on one enemy.";
				aoiFreeze.mode = 0;
				if battling{
					aoiFreeze.usable = global.selectedUnit.current[MP]>=4;
					aoiFreeze.script = freeze;
				}
				else aoiBurn.usable = false;
				a[index++]  = aoiFreeze;
				m[mIndex++] = aoiFreeze;
			}
			break;
		case YUSUF:
			if (global.skills[YUSUF][0]){
				var yusufBold = instance_create_layer(0,0,ui_level,obj_skill);
				yusufBold.title = "Embolden";
				yusufBold.description = "Raise ally's strength and defense.";
				yusufBold.mode = 1;
				if battling{
					yusufBold.usable = global.selectedUnit.current[MP]>=2;
					yusufBold.script = embolden;
				}else yusufBold.usable = false;
				a[index++] = yusufBold;
				m[mIndex++] = yusufBold;
			}
			if (global.skills[YUSUF][1]){
				var yusufBalm = instance_create_layer(0,0,ui_level,obj_skill);
				yusufBalm.title = "Balm";
				yusufBalm.selector = rigid_selector;
				yusufBalm.mode = 4;//rigid_selector:4 - team stuff
				if battling{
					yusufBalm.usable = global.selectedUnit.current[MP]>=5;
				}else yusufBalm.usable = global.party[global.selectedUnit][MP]>=5;
				yusufBalm.description = "Heals you and your teammate.  5 MP.";
				yusufBalm.script = balm;
				a[index++] = yusufBalm;
				t[tIndex++] = yusufBalm;
			}
			if (global.skills[YUSUF][2]){
				var yusufIC = instance_create_layer(0,0,ui_level,obj_skill);
				yusufIC.title = "Intensive care";
				yusufIC.mode = 1.5;
				if battling
					yusufIC.usable = global.selectedUnit.current[MP]>=10;
				else yusufIC.usable = global.party[global.selectedUnit][MP]>=10;
				
				yusufIC.description = "Raise fallen ally.  10 MP.";
				yusufIC.script = intensiveCare;
				a[index++] = yusufIC;
				t[tIndex++] = yusufIC;
			}
			if (global.skills[YUSUF][3]){
				var yusufBurn = instance_create_layer(0,0,ui_level,obj_skill);
				yusufBurn.title = "Ignite";
				yusufBurn.description = "Fire damage on one enemy.";
				yusufBurn.mode = 0;
				if battling{
					yusufBurn.script = freeze;
					yusufBurn.usable = global.selectedUnit.current[MP]>=4;
				}else yusufBurn.usable = false;
				a[index++]  = yusufBurn;
				m[mIndex++] = yusufBurn;
			}
			break;
		default: //testing only
		
				var aoiBurn = instance_create_layer(0,0,ui_level,obj_skill);
				aoiBurn.title = "Burn";
				aoiBurn.description = "Fire damage on all enemies.";
				aoiBurn.script = burn;
				a[index++] = aoiBurn;
				m[mIndex++] = aoiBurn;
			var yusufBalm = instance_create_layer(0,0,ui_level,obj_skill);
				yusufBalm.title = "Balm";
				yusufBalm.description = "Heals you and your teammate.  5 MP.";
				yusufBalm.script = balm;
				a[index++] = yusufBalm;
				t[tIndex++] = yusufBalm;
			//a = [];
	}
	var fleeOpt = instance_create_layer(0,0,ui_level,obj_skill);
	fleeOpt.title = "Flee";
	fleeOpt.selector = rigid_selector;
	fleeOpt.description = "Run away, boy.";
	fleeOpt.mode = 1;
	fleeOpt.usable = battling && !instance_exists(micro_manager);// or something
	fleeOpt.script = flee;
	a[index++] = fleeOpt;
	c[cIndex++] = fleeOpt;
	if battling
		obj_skillmenu.options = a;
	else return [m,t,o,u,c];
}