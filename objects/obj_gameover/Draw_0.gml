/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_text_transformed(490,200,"Game over...",3.5,3.5,0);
draw_text_transformed(550,300,"Try again?",2.5,2.5,0);

draw_set_color(index==0?c_yellow:c_white)
draw_text_transformed(560,500,"Yes",2,2,0);
draw_set_color(index==1?c_yellow:c_gray)
draw_text_transformed(760,500,"No",2,2,0);