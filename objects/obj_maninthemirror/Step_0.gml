/// @description
var curry = obj_player.y;
if curry <= y_limit{
	visible = false;	
}
else{
	visible = true;
	x = obj_player.x - (obj_player.sprite_width%2==1);
	y = y_limit - (curry-y_limit);
}
