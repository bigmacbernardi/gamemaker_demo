with obj_persistentmusicplayer{
	if (trackNo!=32){
		continue_position = audio_sound_get_track_position(songPlaying);
		audio_stop_sound(songPlaying);
		playing = false;
		songPlaying = audio_play_sound(torgo,1,true);
	}	
}