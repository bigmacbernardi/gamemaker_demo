/// @description Menu pops back up

//Save this block for when menus are customizable
if global.selectedUnit>0{
	var ind = global.selectedUnit.index;
	names = global.menuOptions[ind][0];
	actions = global.menuOptions[ind][1];
}
menuDisplaying = true;
menuActive = true;