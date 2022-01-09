/// @description Draws black box; unnecessary?  At least replaceable with sprite
if(side == 0) {
    yy= camera_get_view_y(cam);
    if(instance_exists(writer) && writer.writingy > yy + 80)
        writer.writingy-= 155;
    if(instance_exists(774/* obj_face */) && obj_face.y > yy + 80)
        obj_face.y-= 155;
    draw_set_color(16777215);//border color?
    draw_rectangle(camera_get_view_x(cam) + 16, camera_get_view_y(cam) + 5, camera_get_view_x(cam) +  camera_get_view_width(cam) - 16, camera_get_view_y(cam) + 80, 0);
    draw_set_color(c_navy/*was 0*/);
    draw_rectangle(camera_get_view_x(cam) + 19, camera_get_view_y(cam) + 8, camera_get_view_x(cam) +  camera_get_view_width(cam) - 19, camera_get_view_y(cam) + 77, 0);
	if global.facechoice==1 {
		draw_rectangle(camera_get_view_x(cam) + 100, camera_get_view_y(cam) + 5, camera_get_view_x(cam) +  140, camera_get_view_y(cam) + 8, 0);
		draw_set_color(c_white);
//		draw_set_font(web);
		draw_text_transformed(camera_get_view_x(cam) + 102, camera_get_view_y(cam) + 5,"Elder",.5,.5,0);
	}
	else if global.facechoice > 1 and global.facechoice < 20{
		draw_rectangle(camera_get_view_x(cam) + 100, camera_get_view_y(cam) + 5, camera_get_view_x(cam) +  140, camera_get_view_y(cam) + 8, 0);
		draw_set_color(c_white);
		//draw_set_font(web);
		draw_text_transformed(camera_get_view_x(cam) + 102, camera_get_view_y(cam) + 5,global.names[global.facechoice-2],.5,.5,0);
	}
} else  {
    yy= camera_get_view_y(cam);
    if(instance_exists(writer) && writer.writingy < yy + 80)
        writer.writingy+= 155;
    if(instance_exists(774/* obj_face */) && obj_face.y < yy + 80)
        obj_face.y+= 155;
    draw_set_color(16777215);
    draw_rectangle(camera_get_view_x(cam) + 16, camera_get_view_y(cam)  + camera_get_view_height(cam) - 77,  camera_get_view_x(cam) +  camera_get_view_width(cam) - 16, camera_get_view_y(cam) +  camera_get_view_height(cam) - 2, 0);
    draw_set_color(c_navy/*was 0*/);
    draw_rectangle(camera_get_view_x(cam) + 19, camera_get_view_y(cam)  + camera_get_view_height(cam) - 74,  camera_get_view_x(cam) +  camera_get_view_width(cam) - 19, camera_get_view_y(cam) + camera_get_view_height(cam) - 5, 0);
	if global.facechoice==1 {
		draw_rectangle(camera_get_view_x(cam) + 100, camera_get_view_y(cam)  + camera_get_view_height(cam) - 77, camera_get_view_x(cam) +  140, camera_get_view_y(cam)  + camera_get_view_height(cam) - 74, 0);
		draw_set_color(c_white);
		//draw_set_font(web);
		draw_text_transformed(camera_get_view_x(cam) + 102, camera_get_view_y(cam)  + camera_get_view_height(cam) - 80,"Elder",.5,.5,0);
		//draw_set_font(1);
	}
	else if global.facechoice > 1 and global.facechoice < 20{
		draw_rectangle(camera_get_view_x(cam) + 100, camera_get_view_y(cam)  + camera_get_view_height(cam) - 78, camera_get_view_x(cam) +  140, camera_get_view_y(cam)  + camera_get_view_height(cam) - 74, 0);
		draw_set_color(c_white);
		//draw_set_font(web);
		draw_text_transformed(camera_get_view_x(cam) + 102, camera_get_view_y(cam)  + camera_get_view_height(cam) - 80,global.names[global.facechoice-2],.5,.5,0);
		//draw_set_font(Font2);
	}
}
count= 1;