obj_player.image_blend=c_white;
with obj_persistentmusicplayer{
	if (trackNo != 0){
		audio_stop_sound(songPlaying);
		songPlaying = audio_play_sound(yusufDayTheme_needsADSR,1,true);
		trackNo = 0;	
	}
}