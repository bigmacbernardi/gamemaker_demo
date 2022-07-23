/// @description Menu pops back up, so turn starts

//Save this block for when menus are customizable
if global.selectedUnit>0{
	var ind = global.selectedUnit.index;
	//names = global.menuOptions[ind][0];
	//actions = global.menuOptions[ind][1];
	//CHANGE TO:
	unit = global.selectedUnit;
	/*for (var i = 0; i<array_length(unit.actions);i++){
		names[i]=unit.actions[i].name;
		actions[i]=unit.actions[i].action;	
		childrens[i]=unit.actions[i].children;	
	}*/
	parent = noone;
	openSubmenu(unit.actions);
}
menuDisplaying = true;
menuActive = true;