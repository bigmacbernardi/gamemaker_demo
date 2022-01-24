/// @description Self clean-up

if (!instance_exists(obj_skillmenu)&&!instance_exists(obj_pausemenu_skill)&&!instance_exists(obj_submenu)) instance_destroy();