/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y, obj_player)
	{
	obj_player.paused=!canWalk;
	if instance_exists(obj_backwall) obj_backwall.visible=0;
	if !instance_exists(obj_dialoguer){
		if curr < array_length(lineNos){
			global.lineNo = lineNos[curr];
			global.facechoice = speakers[curr];
			global.faceemotion = emotions[curr];
			//instance_destroy(obj_dialoguer);
			instance_create_depth(0, 0, -9999, obj_dialoguer);
			curr++;
		}
		else{
			if instance_exists(obj_backwall) obj_backwall.visible=1;
			if correspondingFlag>-1
				global.flag[correspondingFlag]=true;
			instance_destroy();
		}
	}
}