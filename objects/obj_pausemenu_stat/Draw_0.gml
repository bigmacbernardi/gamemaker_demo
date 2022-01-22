/// @description Insert description here
// You can write your code in this editor
draw_self();//should be PARCHMENT background
draw_set_font(Roses); //should be DIFFERENT font
var drawX = x+10;
var drawY = y+12;
draw_set_color(c_black);

/*drawing character header*/

draw_text_transformed(drawX,drawY,global.names[options[|index]],.8,.8,0);
draw_text_transformed(drawX+94,drawY,"Level "+string(global.party[options[|index]][LV]),.7,.7,0);
drawY +=16;
draw_text_transformed(drawX,drawY,classes[options[|index]],.7,.7,0);
/*used to draw stats AND stat tree here; now just draws stats*/

//var mins = [0,0,0,0,0,0,0];//should match seven stats at level 1
//var maxs = [99,99,99,99,99,99,99];//should match seven stats at level 99
drawX = x+20;
drawY+=15;//total: y+43

for (var i = 0; i < 7; i++){
  //var bendY = lineY+((jointY-lineY)/2)+(10*i);
  //if (i!=index) draw_set_color(c_black);//maybe re-enable for guide mode
  draw_set_color(statColors[i]);
  draw_text_transformed(drawX,drawY,stats[i],.5,.5,0);
  draw_set_color(c_black);
  draw_text_transformed(drawX,drawY+8,global.party[options[|index]][i+2],.75,.75,0);
  //draw_text_transformed(drawX+104,drawY,options[|i].numOwned,.75,.75,0);
  drawX += 24;
  
}
/* dividing line */
var halfway = x+camera_get_view_width(cam)/2;
draw_line(halfway,y,halfway,y+camera_get_view_height(cam));
  

/* right side: showing ALL statuses (can multipage if needed) */
//passives
drawX = halfway+20;
drawY = y+12;
draw_set_color(c_black);
draw_text_transformed(drawX,drawY-8,"Passives",.75,.75,0);
drawY+=10;
drawX-=10;
var passiveNames =
	["Scan","Auto-Reflect","Revenate","Son o' Soil","Undead","Berserk","Rage","Stinky","Auto-Float","Counter","Hellborne","Mysterious","Enlightened","Drunk","Zonked","Bullet","???","???","???","???"];
for (var i = 0;i<array_length(passiveNames);i++){
	draw_text_transformed(drawX-(i%5==1?6:0),drawY,passiveNames[i],.34,.34,0);
	if i%5==4{
		drawY+=8;
		drawX = halfway+10;
	}else drawX+=(halfway/5);
}
//immunities
drawX = halfway+20;
drawY = y+70;
draw_text_transformed(drawX,drawY-8,"Affinities",.75,.75,0);
drawY+=10;
drawX-=10;
var elementNames =
["Earth","Wind","Fire","Water","Shadow","Light","Energy","Nullspace","Poison","Ice","Crystal","Magma","Acid","Rainbow","Slash","Stab","Bash","Jab","Bullet","Hydra"];
for (var i = 0;i<array_length(elementNames);i++){
	draw_text_transformed(drawX-(i%5==1 or i%5==2?4:0),drawY,elementNames[i],.34,.34,0);
	if i%5==4{
		drawY+=8;
		drawX = halfway+10;
	}else drawX+=(halfway/5);
}
//Negative status qlippoths
draw_set_color(c_white);
drawX = halfway+20;
drawY = y+146;
draw_circle(drawX,drawY,11,true);
draw_circle(drawX,drawY,10.5,true);
drawX+=40;
drawY-=20;
draw_circle(drawX,drawY,11,true);
draw_circle(drawX,drawY,10.5,true);
drawY+=40;
draw_circle(drawX,drawY,11,true);
draw_circle(drawX,drawY,10.5,true);
drawX+=40;
drawY-=40;
draw_circle(drawX,drawY,11,true);
draw_circle(drawX,drawY,10.5,true);
drawY+=40;
draw_circle(drawX,drawY,11,true);
draw_circle(drawX,drawY,10.5,true);
drawX+=40;
drawY-=40;
draw_circle(drawX,drawY,11,true);
draw_circle(drawX,drawY,10.5,true);
drawY+=40;
draw_circle(drawX,drawY,11,true);
draw_circle(drawX,drawY,10.5,true);
drawX+=30;
drawY-=20;
draw_circle(drawX,drawY,11,true);
draw_circle(drawX,drawY,10.5,true);



/* bottom: showing characters and which is selected */
//drawing submenu
draw_sprite(spr_menu_temp,0,x,y+camera_get_view_height(cam)-42);
drawX = x+30;
drawY = y+camera_get_view_height(cam)-30;
//draw_set_color(c_white);
for (var i = scrollLevel; i < min(8+scrollLevel,ds_list_size(options)); i++){
  if (i!=index) draw_sprite_ext(front_sprites[options[|i]],0,drawX,drawY+23,1,1,0,c_dkgray,.8); //do different indicator
  else draw_sprite(front_sprites[options[|i]],0,drawX,drawY+23);
  //draw_text_transformed(drawX+104,drawY,options[|i].numOwned,.75,.75,0);
  if ((i%4)==3){
	drawX = x+30;
	drawY += 30;
  }else drawX += 30
}