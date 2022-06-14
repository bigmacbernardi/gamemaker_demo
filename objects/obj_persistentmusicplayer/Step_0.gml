/// @description Insert description here
// You can write your code in this editor
/*if room==gameover{//none of this logic is needed
	audio_stop_sound(songPlaying);	
	//audio_stop_sound(overworld_breezetemp);//idr why songPlaying doesn't work here
	if (!GOplaying){
		songPlaying = audio_play_sound(alteredbeast_gameover_as_placeholder,1000,true);
		GOplaying = true;
	}
}*/
/*else if (instance_exists(battle_manager)){
	if (playing){
	continue_position = audio_sound_get_track_position(songPlaying);
	audio_stop_sound(songPlaying);
	songPlaying = audio_play_sound(battle_torgotemp,1,true);
	playing = false;
	}
}*/
/*else */if (instance_exists(obj_pausemenu_stat)||instance_exists(obj_pausemenu_team)){//gimmickier menus that will have a lot of reading
	if (playing){
	continue_position = audio_sound_get_track_position(songPlaying);
	show_debug_message("Before stop continue is"+string(continue_position));
	audio_stop_sound(songPlaying);
	show_debug_message("Continue is now "+string(continue_position));
	
	songPlaying = audio_play_sound(wooloop_lofi,1,true);
	playing = false;
	}	
}
else if !(instance_exists(battle_manager) || playing || room==gameover){
	var possible_tracks = [yusufDayTheme,overworld_breezetemp,d1music1,overworld_manotemp,bouncerock_shoptheme,d1music2,noone,noone,noone,noone,
							icecavetake1];
	//audio_stop_sound(battle_torgotemp);
	audio_stop_sound(songPlaying);
	//audio_stop_sound(alteredbeast_gameover_as_placeholder);
	songPlaying = audio_play_sound(possible_tracks[trackNo],1,true);
	show_debug_message("Setting track "+string(trackNo)+" to "+string(continue_position));
	audio_sound_set_track_position(songPlaying,continue_position);
	playing = true;
}