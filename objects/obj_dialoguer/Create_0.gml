/// @description Another Undertale obj. Will likely merge into something else.
depth = -999;
count= 0;
side= 0;
global.facechange= 1;
xx= camera_get_view_x(cam);
yy= camera_get_view_y(cam);
myname = "";
if(instance_exists(obj_player)) {
    if(obj_player.y > yy + 130) {
        side= 0;
        if(global.facechoice != 0) {
            writer= instance_create_depth(xx + 68, yy - 5, -5000,obj_writer);
            script_execute(scr_facechoice);
        } else  writer= instance_create_depth(xx + 10, yy - 5,-5000, obj_writer);//X OF WRITER OBJECT DETERMINES STARTING POINT OF TEXT-- changing doesn't work here though.  SEE STEP:15 INSTEAD
		
    } else  {
        side= 1;
        if(global.facechoice != 0) {
            writer= instance_create_depth(xx + 68, yy + camera_get_view_height(cam) - 87,-5000, obj_writer);
            script_execute(scr_facechoice);
		} else  writer= instance_create_depth(xx + 10, yy + camera_get_view_height(cam) - 87,-5000, obj_writer);
    }
	if (global.nameplate == noone){
				if global.facechoice == 1
					myname="Elder";
				else if global.facechoice > 2 and global.facechoice<20{
					myname = global.names[global.facechoice-2];
				}
			}
	else myname = global.nameplate;
}