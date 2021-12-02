/// @description Insert description here
// You can write your code in this editor
if room==gameover{
	audio_stop_sound(battle_torgotemp);	
	audio_stop_sound(overworld_manostemp);
	if (!GOplaying){
		audio_play_sound(alteredbeast_gameover_as_placeholder,1000,true);
		GOplaying = true;
	}
}
else if (instance_exists(battle_manager)){
	if (playing){
	continue_position = audio_sound_get_track_position(overworld_manostemp);
	audio_stop_sound(overworld_manostemp);
	audio_play_sound(battle_torgotemp,1,true);
	playing = false;
	}
}
else if (instance_exists(obj_pausemenu_stat)||instance_exists(obj_pausemenu_team)){//gimmickier menus that will have a lot of reading
	if (playing){
	continue_position = audio_sound_get_track_position(overworld_manostemp);
	audio_stop_sound(overworld_manostemp);
	audio_play_sound(wooloop_lofi,1,true);
	playing = false;
	}	
}
else if !playing{
	audio_stop_sound(battle_torgotemp);
	audio_stop_sound(wooloop_lofi);
	audio_stop_sound(alteredbeast_gameover_as_placeholder);
	audio_play_sound(overworld_manostemp,1,true);
	audio_sound_set_track_position(overworld_manostemp,continue_position);
	playing = true;
}