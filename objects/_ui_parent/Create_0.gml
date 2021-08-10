/// @description Insert description here
// You can write your code in this editor
/// @description Properties
#region Enums
enum Anchor
{
	top_left,top_center,top_right,
	middle_left,middle_center,middle_right,
	bottom_left,bottom_center,bottom_right
}

enum Alignment
{
	top=0,middle=1,bottom=2,
	left=0,center=1,right=2
}

enum Aspects
{
	_16x9,
	_21x9,
	_1x1,
	_4x3,
	_9x16	
}
#endregion

#macro mouse_gui_x device_mouse_x_to_gui(0)
#macro mouse_gui_y device_mouse_y_to_gui(0)

image_speed=0;

#region Positioning and State Animation Properties
enum VisualState
{
	active,
	deactivating,
	inactive,
	activating
}
state = VisualState.inactive;

length=15;
timer=length;
activate_ease=TwerpType.out_back;
deactivate_ease=TwerpType.in_back;
active_pos=[0,0];
inactive_offset=[0,0];
#endregion

//Update Position
event_user(0);