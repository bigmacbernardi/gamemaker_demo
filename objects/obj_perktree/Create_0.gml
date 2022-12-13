/// @description Replacing obj_stattree

if object_exists(obj_pausemenu_stat)
	char = obj_pausemenu_stat.options[|obj_pausemenu_stat.index];
else char = global.currentParty[0];//tracks config 

perkState=global.perkState[char];
ptsToSpend=global.dust[char];

// You can write your code in this editor
if !instance_exists(obj_pausemenu_stat) instance_destroy();
var i = obj_pausemenu_stat.options[|obj_pausemenu_stat.index];

//FOLLOWING VALUES ARE JUST PLACEHOLDERS
amounts = [global.party[i][2],global.party[i][3],global.party[i][4],global.party[i][5],global.party[i][6],global.party[i][7],global.party[i][8],global.party[i][9]];
startY = y+63;
endY = y+camera_get_view_height(cam)-60;
switch (char){//sets pattern for config
	case MUSA:
			xs=[camera_get_view_width(cam)/4,camera_get_view_width(cam)/8,3*camera_get_view_width(cam)/8];
			ys=[endY-15,endY-30,endY-30,endY-45,endY-45,endY-60,endY-60];
			break;
	case MORI:
	default:
			xs=[camera_get_view_width(cam)/4,camera_get_view_width(cam)/4,camera_get_view_width(cam)/8,3*camera_get_view_width(cam)/8];
			ys=[endY-15,endY-30,endY-45,endY-45,endY-60,endY-60];
			break;
}
index = -1;
var data = slot_perks(i);
for (var j = 0;j<array_length(data);j++){
	var st = data[j][0];//REMOVE THIS LOGIC
	var mR = data[j][1];//REPLACE THIS WITH FLOW LOGIC
	//var t = data[j][2];
	//var d = data[j][3];
	
	var calcX = xs[min(array_length(xs)-1,j)];
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