/// @description Insert description here
// You can write your code in this editor
//if(countdown--)<=0{
//	countdown = 200;
show_debug_message("Thar be an obj_shader in "+string(room));
//index = abs(floor(obj_player.x- obj_sign.x)*2);
if(index)<array_length(colors){
	obj_player.image_blend = colors[index];
	index++;
}
//}