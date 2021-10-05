/// @description Another Undertale obj. Will likely merge into something else.

count= 0;
side= 0;
global.facechange= 1;
xx= camera_get_view_x(cam);
yy= camera_get_view_y(cam);
if(instance_exists(obj_player)) {
    if(obj_player.y > yy + 130) {
        side= 0;
        if(global.facechoice != 0) {
            writer= instance_create(xx + 68, yy - 5, obj_dialogue);
            script_execute(144/* scr_facechoice */);
        } else  writer= instance_create(xx + 10, yy - 5, obj_dialogue);
    } else  {
        side= 1;
        if(global.facechoice != 0) {
            writer= instance_create(xx + 68, yy + 150, obj_dialogue);
            script_execute(144/* scr_facechoice */);
        } else  writer= instance_create(xx + 10, yy + 150, obj_dialogue);
    }
}