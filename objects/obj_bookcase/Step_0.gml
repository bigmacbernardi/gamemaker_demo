/// @description Insert description here
// You can write your code in this editor
var invisrange = 70;
var mini = 0;//(image_yscale/8);
if obj_player.x > x - (sprite_width/2) and obj_player.x <= (x+(sprite_width/2)) and obj_player.y<y-mini{
	//show_debug_message("PLAYER Y "+string(obj_player.y)+", MY Y ADJUSTED "+string(y-(sprite_height/4)));
	var gap = y-obj_player.y;
	if gap>invisrange target_opacity = 0
	else target_opacity = 1-((gap-mini)/(invisrange-mini));
}
else{
	target_opacity=1;
}
image_alpha = lerp(image_alpha,target_opacity,.1);