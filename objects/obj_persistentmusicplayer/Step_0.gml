/// @description Insert description here
// You can write your code in this editor
if (instance_exists(battle_manager)){
	if (playing){
	continue_position = audio_sound_get_track_position(overworld_manostemp);
	audio_stop_sound(overworld_manostemp);
	audio_play_sound(battle_torgotemp,1,true);
	playing = false;
	}
}
else if !playing{
	audio_stop_sound(battle_torgotemp);
	audio_play_sound(overworld_manostemp,1,true);
	audio_sound_set_track_position(overworld_manostemp,continue_position);
	playing = true;
}