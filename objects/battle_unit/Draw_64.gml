var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var xx = (x-cx)*Display_ScaleX;
var yy = (y-cy)*Display_ScaleY;


var _hp = current[@ HP]/base[@ HP];

draw_sprite(ui_hp,0,xx,yy-20);
draw_sprite_part(ui_hp,1,0,0,hpBarWidth*_hp,hpBarHeight,xx,yy-20);