/// @description Insert description here
// You can write your code in this editor
if !instance_exists(obj_pausemenu_stat) instance_destroy();
var i = obj_pausemenu_stat.options[|obj_pausemenu_stat.index];

//FOLLOWING VALUES ARE JUST PLACEHOLDERS
var mins = [[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1]];
var maxs = [[99,99,99,99,99,99,99],[99,99,99,99,99,99,99],[99,99,99,99,99,99,99]];
var incs = [[1,1,1,1,1,1,1],[1,1,1,1,1,1,1],[1,1,1,1,1,1,1]];


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
	
	var calcX = x+(4*(st-2));
	var calcY = startY + (endY-startY)*(mR-curmin[st-2]/curmax[st-2]-curmin[st-2]);
	perks[j] = instance_create_depth(calcX,calcY,depth-1,obj_perkexplain);
	perks[j].stat = st;
	perks[j].minRequired = mR;
	//perks[j].title = t;
	//perks[j].description = d;
}