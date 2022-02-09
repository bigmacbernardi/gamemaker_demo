/// @description Pull up a savemenu
obj_player.paused = true;//redundant?
instance_create_depth(camera_get_view_x(cam),camera_get_view_y(cam),-6999,obj_savemenu);