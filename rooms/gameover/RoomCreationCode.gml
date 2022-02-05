
with obj_persistentmusicplayer{
	audio_stop_sound(songPlaying);
	songPlaying = audio_play_sound(alteredbeast_gameover_as_placeholder,1,true);
	trackNo = -1;
}