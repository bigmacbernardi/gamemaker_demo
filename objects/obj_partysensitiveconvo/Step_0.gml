/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y, obj_player)
	{
	obj_player.paused=!canWalk;
	obj_backwall.visible=0;
	if !instance_exists(obj_dialoguer){
		if curr < array_length(lineNos){
			global.lineNo = lineNos[curr];
			global.facechoice = global.currentParty[speakers[curr]]+2;
			global.faceemotion = emotions[curr];
			//instance_destroy(obj_dialoguer);
			instance_create_depth(0, 0, -9999, obj_dialoguer);
			curr++;
		}
		else{
			obj_backwall.visible=1;
			if correspondingFlag>-1
				global.flag[correspondingFlag]=true;
			instance_destroy();
		}
	}
}else if cascadeDelete>-1 and global.flag[cascadeDelete] instance_destroy();