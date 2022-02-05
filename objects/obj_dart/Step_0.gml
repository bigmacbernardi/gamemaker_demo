if !instance_exists(obj_shootygame_go) instance_destroy();
y-=7;
if place_meeting(x,y,obj_shootytarget){
	audio_play_sound(chainmail2,100,false);
	obj_shootygame_go.points++;
	instance_destroy();
}