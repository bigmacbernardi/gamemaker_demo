// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function ui_element_toggle_active(argument0) {
	var _active = argument0;

	if(!_active && state != VisualState.inactive)
	{
		timer=0;
		state = VisualState.deactivating;
	}
	else if(_active && state != VisualState.active)
	{
		timer=0;
		state = VisualState.activating;
	}


}