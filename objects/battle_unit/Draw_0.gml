/// @description Selector/Indicators
// You can write your code in this editor
//draw_self();//I guess this isn't needed because of the sequence?
//draw_text(x,y-16,string(id)+", "+string(attackWillHit));

if(selected&&isPlayer){
	draw_sprite(spr_indicator, 0, x, y);
}

if(targeted){
		draw_sprite(spr_angryindicator,0,x,y);
}