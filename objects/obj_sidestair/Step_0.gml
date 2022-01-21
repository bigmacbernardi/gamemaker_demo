/// @description Insert description here
var plaX = obj_player.x;
var plaY = obj_player.y;
if place_meeting(x,y,obj_player){
	//var hiX = x;//top of the stairs
	//var hiY = y;//top of the stairs
	//var loX=x+sprite_width;//bottom
	//var loY = y + sprite_height;
	if plaX!=lastX{
		plaY =y+abs(2*image_yscale*floor((plaX-x)/(2*image_xscale)));
		obj_player.y = plaY;
		if plaX<lastX obj_player.facing=4;
		else if plaX>lastX obj_player.facing=6;
		show_debug_message("Vert: from ("+string(lastX)+","+string(lastY)+") to ("+string(plaX)+","+string(plaY)+")");
	}else if plaY!=lastY{
		plaX =x+(2*image_xscale*(1+floor((plaY-y)/(2*image_yscale))));
		obj_player.x = plaX;
		if plaX<lastX obj_player.facing=4;
		else if plaX>lastX obj_player.facing=6;
		show_debug_message("Horiz: from ("+string(lastX)+","+string(lastY)+") to ("+string(plaX)+","+string(plaY)+")");
		
	}
}
lastX = plaX;
lastY = plaY;