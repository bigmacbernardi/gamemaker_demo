with obj_persistentmusicplayer{
	if (playing){
		continue_position = audio_sound_get_track_position(songPlaying);
		audio_stop_sound(songPlaying);
		playing = false;
		songPlaying = audio_play_sound(make_this_funky,1,true);
	}	
}