/// @description Ain't done this yet
/// @description Insert description here
// You can write your code in this editor
draw_self();
var drawX = x+10;
var drawY = y+12;
draw_set_color(c_white);
for (var i = scrollLevel; i < scrollLevel + 6; i++){
  if (i!=index) draw_set_color(file_exists("save"+string(i)+".ini")?c_yellow:c_black);
  else draw_set_color(c_white);
  draw_text_transformed(drawX,drawY,"Slot "+string(i),.5,.5,0);
  draw_text_transformed(drawX+100,drawY-1,options[|i].leader,.75,.75,0);
  if options[|i].level>0
	draw_text_transformed(drawX+200,drawY,"LV "+string(options[|i].level),.6,.6,0);
  if options[|i].location_name!="--"
  	draw_text_transformed(drawX+100,drawY+12,options[|i].location_name,.5,.5,0);
   //draw_text_transformed(drawX+104,drawY,options[|i].numOwned,.75,.75,0);
  //draw_set_color(c_white);//for other text
  //drawX = x+20;
  drawY += 24;
}
//display
drawY = y + camera_get_view_height(cam)-24;
draw_set_color(c_ltgray);
drawX = x + 8;
drawY += 13;
draw_text_transformed(drawX,drawY,"Accept: ENTER/L-click     Back: Bkspc/Shift/R-click",.4,.4,0);
