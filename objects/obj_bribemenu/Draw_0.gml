/// @description Insert description here
// You can write your code in this editor
//draw_self();
draw_set_color(c_green);
draw_rectangle(x+20,y+15,x+150,y+55,false);
draw_set_color(c_white);
draw_rectangle(x+20,y+15,x+150,y+55,true);
draw_rectangle(x+19.75,y+14.75,x+150.25,y+55.25,true);
draw_rectangle(x+19.5,y+14.5,x+150.5,y+55.5,true);
draw_set_font(Roses);
draw_text_transformed(x+48,y+20,"Throw in a bribe?",.4,.4,0);
draw_text_transformed(x+30,y+30,string(electrumAmount)+" E's",.5,.5,0);
draw_set_color(c_yellow);
draw_text_transformed(x+30,y+43,string(goldAmount)+" G",.5,.5,0);
draw_sprite(spr_select_right,0,x+15,y+(changingGold?38:25));
