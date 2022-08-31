obj_player.image_blend=c_white;
with obj_persistentmusicplayer{
	if (trackNo != 13){
		audio_stop_sound(songPlaying);
		songPlaying = audio_play_sound(aoi_piano_rough,1,true);
		trackNo = 13;	
	}
}