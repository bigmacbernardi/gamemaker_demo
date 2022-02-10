/// @description Insert description here
// You can write your code in this editor
if !instance_exists(obj_pausemenu_stat) instance_destroy();
var i = obj_pausemenu_stat.options[|obj_pausemenu_stat.index];

//FOLLOWING VALUES ARE JUST PLACEHOLDERS
var mins = [[1,3,6,3,3,3,5],[1,4,5,5,3,3,3],[1,1,1,1,1,1,1]];
var maxs = [[99,101,104,101,101,101,103],[99,102,103,103,101,101,101],[99,99,99,99,99,99,99]];
var incs = [[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1]];

amounts = [global.party[i][2],global.party[i][3],global.party[i][4],global.party[i][5],global.party[i][6],global.party[i][7],global.party[i][8],global.party[i][9]];
startY = y+63;
endY = y+camera_get_view_height(cam)-60;
curmax = maxs[i];
curmin = mins[i];
curinc = incs[i];
index = -1;
var data = slot_perks(i);
for (var j = 0;j<16;j++){
	var st = data[j][0];
	var mR = data[j][1];
	//var t = data[j][2];
	//var d = data[j][3];
	
	var calcX = x+(24*(st-1))-2.5;
	var calcY = startY + (endY-startY)*(mR-curmin[st-2])/(curmax[st-2]-curmin[st-2]+24);
	perks[j] = instance_create_depth(calcX,calcY,depth-1,obj_perkexplain);
	perks[j].stat = st;
	perks[j].minRequired = mR;
	if global.party[i][st]>=mR perks[j].sprite_index=spr_perk_got;
	if data[j][2]!="" perks[j].title = data[j][2];
	if data[j][3]!="" perks[j].description = data[j][3];
	//perks[j].title = t;
	//perks[j].description = d;
}
frameHasPassed=false;