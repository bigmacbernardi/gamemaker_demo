/// @description Insert description here
// You can write your code in this editor
#region State Animations
switch(state)
{
	case VisualState.deactivating: 
	{
		timer++;
		
		x=twerp(deactivate_ease,
						active_pos[0],
						active_pos[0]+inactive_offset[0],
						timer/length);
		y=twerp(deactivate_ease,
						active_pos[1],
						active_pos[1]+inactive_offset[1],
						timer/length);
		image_alpha=twerp(deactivate_ease,1,0,timer/length);
		if(timer>=length)
			state = VisualState.inactive;
	}break;
	
	case VisualState.activating: 
	{
		timer++;
		
		x=twerp(activate_ease,
					active_pos[0]+inactive_offset[0],
					active_pos[0],
					timer/length);
		y=twerp(activate_ease,
					active_pos[1]+inactive_offset[1],
					active_pos[1],
					timer/length);
		image_alpha=twerp(activate_ease,0,1,timer/length);
		if(timer>=length)
			state = VisualState.active;
	}break;
	
	case VisualState.active:
	{
		x=active_pos[0];
		y=active_pos[1];
		image_alpha=1;
	}break;
	
	case VisualState.inactive:
	{
		x=active_pos[0]+inactive_offset[0];
		y=active_pos[1]+inactive_offset[1];
		image_alpha=0;
	}break;
}
#endregion

//detect time since last movement, and if something should be done
/*
if ((isSelected)&&(timer - stopwatch)>6){
if	
}
*/

//else stopwatch = timer;

//we'll do this later

//Detect Clicks
if (state != VisualState.active) exit;

if((script != noone)&&(isSelected)&&(battle_manager.allowInput))// && position_meeting(mouse_gui_x,mouse_gui_y,id))
{	//Selected with an existing script
	image_index=1;
	if((mouse_check_button_pressed(mb_left)) || keyboard_check_pressed(vk_space)|| keyboard_check_pressed(vk_enter))
	{	//Left button is being pressed
		show_debug_message("Button Pressed");
		battle_manager.allowInput = false; //done before to prevent shenanigans
		script_execute(script);
		//if we just had a way to automatically iterate through children, this could be easier
		button_attack.visible = 0;
		button_skill.visible = 0;
		button_dual_wait.visible = 0;
		button_item.visible = 0;
	}
}
else
	image_index=0;