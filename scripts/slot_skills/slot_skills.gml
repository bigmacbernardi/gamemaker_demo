//
function slot_skills(){
	var ui_level = layer_exists("UI_Base")?"UI_Base":"Instances";
	var a; //"all" array
	var m = [],t = [],o = [],u = [],c = [];//more arrays. magic, trained, observed (enemy skills), unique, common
	var index = 0;
	var mIndex = 0; var tIndex = 0; var oIndex = 0; var cIndex = 0;//var uIndex = 0; 
	var battling = instance_exists(battle_manager);
	
	//minimal version of later process to implement
	var atkFound=false;
	var deFound=false;
	var talkFound=false;
	var fleeFound=false;
	var dualFound=false;
	if battling {
		for (var i = 0; i<array_length(battle_menu.names);i++){//searching for commons
			if !atkFound and (battle_menu.names[i]=="Attack" or battle_menu.names[i]=="Smash" or battle_menu.names[i]=="Play")
				atkFound = true;
			else if !deFound and (battle_menu.names[i]=="Defend" or battle_menu.names[i]=="Block" or battle_menu.names[i]=="Guard")
				deFound = true;
			else if !talkFound and (battle_menu.names[i]=="Talk" or battle_menu.names[i]=="Speak" or battle_menu.names[i]=="Bribe")
				talkFound = true;
			else if !fleeFound and battle_menu.names[i]=="Flee"
				fleeFound = true;
				//if dualFound break;
			else if !dualFound and battle_menu.names[i]=="Dual"
				dualFound = true;
				//if fleeFound break;
		}
		//attack IF attack not on top level
		if !atkFound{
			var atkOpt = instance_create_layer(0,0,ui_level,obj_skill);
			atkOpt.title = "Attack";
			atkOpt.selector = atk_selector;
			atkOpt.description = "Deal an ordinary physical blow.";
			atkOpt.mode = 0;
			atkOpt.usable = battling && global.selectedUnit>0 && !global.selectedUnit.status[2];// or something
			atkOpt.script = attack;
			a[index++] = atkOpt;
			c[cIndex++] = atkOpt;
		}
	}
	//normal skills
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
				yusufBold.description = "Raise ally's strength and defense.  2 MP.";
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
	}
	//common options
	if !deFound{
		var defOpt = instance_create_layer(0,0,ui_level,obj_skill);
		defOpt.title = "Defend";
		defOpt.description = "Stand firm and brace yourself for impact.";
		defOpt.selector = rigid_selector;
		defOpt.mode = 3;//self
		defOpt.usable = battling && global.selectedUnit>0 && !global.selectedUnit.status[1] && !global.selectedUnit.status[2];// or something
		defOpt.script = defend;
		a[index++] = defOpt;
		c[cIndex++] = defOpt;
	}
	if !talkFound{
		var talkOpt = instance_create_layer(0,0,ui_level,obj_sub);
		talkOpt.title = "Talk";
		talkOpt.description = "Use your words.";
		talkOpt.mode=-1;
		talkOpt.usable = battling and global.selectedUnit>0 and !global.selectedUnit.status[1] ;// or something
		talkOpt.script = talk;
		a[index++] = talkOpt;
		c[cIndex++] = talkOpt;
	}
	if !fleeFound{
		var fleeOpt = instance_create_layer(0,0,ui_level,obj_skill);
		fleeOpt.title = "Flee";
		fleeOpt.selector = rigid_selector;
		fleeOpt.description = "Run away, boy.";
		fleeOpt.mode = 1;
		fleeOpt.usable = battling && !instance_exists(micro_manager);// or something
		fleeOpt.script = flee;
		a[index++] = fleeOpt;
		c[cIndex++] = fleeOpt;
	}
	if battling && !dualFound{
		var dualOpt = instance_create_layer(0,0,ui_level,obj_sub);
		dualOpt.title = "Dual";
		dualOpt.description = "Dual techniques";
		dualOpt.mode=-1;
		dualOpt.usable = battling && battle_manager.checkForReadiness();// or something
		dualOpt.script = dual;
		a[index++] = dualOpt;
		c[cIndex++] = dualOpt;
	}
	if battling
		obj_skillmenu.options = a;
	else return [m,t,o,u,c];
}