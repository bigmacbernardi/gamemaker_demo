/// @description Show the menu
// You can write your code in this editor
//draw_self(); //enable if bkgd sprite is chosen
var drawY = y;
for (var i = 0; i < 4; i++){
   draw_set_color((i!=index)?c_black:c_white);
   draw_text_transformed(x+8,drawY,sortOptions[i],.75,.75,0);
   drawY+=12;
}
