/// @description Draws black box; unnecessary?  At least replaceable with sprite
if(side == 0) {
    yy= camera_get_view_y(cam);
    if(instance_exists(writer) && writer.writingy > yy + 80)
        writer.writingy-= 155;
    if(instance_exists(774/* obj_face */) && obj_face.y > yy + 80)
        obj_face.y-= 155;
    draw_set_color(16777215);
    draw_rectangle(camera_get_view_x(cam) + 16, camera_get_view_y(cam) + 5, camera_get_view_x(cam) + 304, camera_get_view_y(cam) + 80, 0);
    draw_set_color(0);
    draw_rectangle(camera_get_view_x(cam) + 19, camera_get_view_y(cam) + 8, camera_get_view_x(cam) + 301, camera_get_view_y(cam) + 77, 0);
} else  {
    yy= camera_get_view_y(cam);
    if(instance_exists(writer) && writer.writingy < yy + 80)
        writer.writingy+= 155;
    if(instance_exists(774/* obj_face */) && obj_face.y < yy + 80)
        obj_face.y+= 155;
    draw_set_color(16777215);
    draw_rectangle(camera_get_view_x(cam) + 16, camera_get_view_y(cam) + 160, camera_get_view_x(cam) + 304, camera_get_view_y(cam) + 235, 0);
    draw_set_color(0);
    draw_rectangle(camera_get_view_x(cam) + 19, camera_get_view_y(cam) + 163, camera_get_view_x(cam) + 301, camera_get_view_y(cam) + 232, 0);
}
count= 1;