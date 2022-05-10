obj_player.image_blend=c_white;
with obj_persistentmusicplayer{
	if (trackNo != 3){
		audio_stop_sound(songPlaying);
		songPlaying = audio_play_sound(overworld_manotemp,1,true);
		trackNo = 3;	
	}
}