/// @description Insert description here
// You can write your code in this editor
if place_meeting(x, y, obj_player)
	{
	global.lineNo = lineNo;
	global.facechoice = speaker;
	global.faceemotion = emotion;
	if instance_exists(obj_dialoguer) instance_destroy(obj_dialoguer);
	if instance_exists(obj_writer) instance_destroy(obj_writer);
	if instance_exists(obj_face) instance_destroy(obj_face);
	var inst = instance_create_depth(0, 0, -9999, obj_dialoguer);
	if correspondingFlag>-1
		global.flag[correspondingFlag]=true;
	instance_destroy();
}