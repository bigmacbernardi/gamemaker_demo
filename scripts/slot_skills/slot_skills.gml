//
function slotSkills(unit = global.selectedUnit){//temporary.  repurpose for initialization.
	var a; //"all" array
	var index = 0;
	var battling = instance_exists(battle_menu);
	//minimal version of later process to implement
	var atkFound=false; var deFound=false; var talkFound=false; var fleeFound=false;
	if battling {
		for (var i = 0; i<array_length(unit.actions);i++){//searching for commons
			if !atkFound and (unit.actions[i].name=="Attack" or unit.actions[i].name=="Smash" or unit.actions[i].name=="Play")
				atkFound = true;
			else if !deFound and (unit.actions[i].name=="Defend" or unit.actions[i].name=="Block" or unit.actions[i].name=="Guard")
				deFound = true;
			else if !talkFound and (unit.actions[i].name=="Talk" or unit.actions[i].name=="Speak" or unit.actions[i].name=="Bribe")
				talkFound = true;
			else if !fleeFound and unit.actions[i].name=="Flee"
				fleeFound = true;
		}
		//attack IF attack not on top level
		if !atkFound{
			var atkOpt = {
				name: "Attack",
				action: attack,
				selector: atk_selector,
				description: "Deal an ordinary physical blow.",
				mode: 0,
				lvl:0,children:[],element:-1,
				usable: global.selectedUnit>0 && !global.selectedUnit.status[2]// or something
			};
			a[index++] = atkOpt;
		}
	}
	//normal skills
	switch(battling?global.selectedUnit.index:global.selectedUnit){//cannot work permanently; use index, e
		case AOI:
			if (global.skills[AOI][0]){
				var aoiBurn = {
				name: "Burn",
				description: "Fire damage on all enemies.",
				mode: 2,
				lvl:0,children:[],element:2,
				usable: global.selectedUnit.current[MP]>=4,
				action: cast//temp test
				}
				a[index++] = aoiBurn;
			}
			if (global.skills[AOI][1]){
				var aoiFreeze = {
					name: "Freeze",
					description: "Ice damage on one enemy.",
					mode: 0,
					lvl:0,children:[],element:9,
					usable: global.selectedUnit.current[MP]>=4,
					action: freeze
				}
				a[index++]  = aoiFreeze;
			}
			break;
		case YUSUF:
			if (global.skills[YUSUF][0]){
				var yusufBold = {
					name: "Embolden",
					description: "Raise ally's strength and defense.  2 MP.",
					mode: 1,
					lvl:0,children:[],element:7,
					usable: global.selectedUnit.current[MP]>=2,
					action: embolden
				}
				a[index++] = yusufBold;
			}
			if (global.skills[YUSUF][1]){
				var yusufBalm = {
					name: "Balm",
					selector: rigid_selector,
					mode: 4,
					lvl:0,children:[],element:14,//rigid_selector:4 - team stuff
					usable: global.selectedUnit.current[MP]>=5,
					description: "Heals you and your teammate.  5 MP.",
					action: balm
				}
				a[index++] = yusufBalm;
			}
			if (global.skills[YUSUF][2]){
				var yusufIC = {
					name: "Intensive care",
					mode: 1.5,
					lvl:0,children:[],element:14,
					usable: global.party[global.selectedUnit][MP]>=10,
					description: "Raise fallen ally.  10 MP.",
					action: intensiveCare
				};
				a[index++] = yusufIC;
			}
			if (global.skills[YUSUF][3]){
				var yusufBurn = {
					name: "Ignite",
					description: "Fire damage on one enemy.",
					mode: 0,
					lvl:0,children:[],element:2,
					action: freeze,
					usable: global.selectedUnit.current[MP]>=4
				};
				a[index++]  = yusufBurn;
			}
			if (global.skills[YUSUF][4]){
				var yusufDetox = {
					name: "Cure Poison",
					description: "Cure Poison on a buddy! .",
					mode: 1,
					lvl:0,children:[],element:15,
					action: detox,
					usable: global.selectedUnit.current[MP]>=2
				}
				a[index++]  = yusufDetox;
			}
			break;
		default: //testing only
			var aoiBurn;
	}
	//common options
	if !deFound{
		var defOpt = {
			name: "Defend",
			description: "Stand firm and brace yourself for impact.",
			selector: rigid_selector,
			mode: 3,//self
			lvl:0,children:[],element:-1,
			usable: battling && global.selectedUnit>0 && !global.selectedUnit.status[1] && !global.selectedUnit.status[2],// or something
			action: defend
		};
		a[index++] = defOpt;
	}
	if !talkFound{
		var talkOpt = {
			name: "Talk...",
			description: "Use your words.",
			lvl:0,children:[],element:-1,
			usable: battling and global.selectedUnit>0 and !global.selectedUnit.status[1] ,// or something
			action: talk
		};
		a[index++] = talkOpt;
	}
	if !fleeFound{
		var fleeOpt = {
			name: "Flee",
			selector: rigid_selector,
			description: "Run away, boy.",
			mode: 1,
			lvl:0,children:[],element:-1,
			usable: battling && !instance_exists(micro_manager),// or something
			action: flee
		};
		a[index++] = fleeOpt;
	}
	if battling{
		obj_skillmenu.options = a;
	}
	return a;
}


function getDescription(action){
	switch(action){
		case attack: return "Deal an ordinary physical blow.";
        case burn:
        case cast: return "Fire damage on all enemies.";
		case freeze: return "Ice damage on one enemy.";
		case embolden: return "Raise ally's strength and defense.  2 MP.";
		case balm: return "Heals you and your teammate.  5 MP."; 
		case intensiveCare: return "Raise fallen ally.  10 MP.";
		case detox: return "Cure a buddy's poison.";
		case defend: return "Stand firm and brace yourself for impact.";
		case talk: return "Use your words.";
		case flee: return "Run away, boy.";
		default: return "Unrecognized action."
	}
}
function slot_skills(){//repurpose for initialization maybe?
	var ui_level = layer_exists("UI_Base")?"UI_Base":"Instances";
	var a; //"all" array
	var m = [],t = [],o = [],u = [],c = [];//more arrays. magic, trained, observed (enemy skills), unique, common
	var index = 0;
	var mIndex = 0; var tIndex = 0; /*var oIndex = 0;*/ var cIndex = 0; var uIndex = 0; 
	var battling = instance_exists(battle_menu);
	
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
					aoiBurn.script = cast;//temp test
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
			if (global.skills[YUSUF][4]){
				var yusufDetox = instance_create_layer(0,0,ui_level,obj_skill);
				yusufDetox.title = "Cure Poison";
				yusufDetox.description = "Cure Poison on a buddy! .";
				yusufDetox.mode = 1;
				if battling{
					yusufDetox.script = detox;
					yusufDetox.usable = global.selectedUnit.current[MP]>=2;
				}else yusufDetox.usable = false;
				a[index++]  = yusufDetox;
				u[uIndex++] = yusufDetox;
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
	if battling{
		obj_skillmenu.options = a;
		return a;
	}
	else return [m,t,o,u,c];
}