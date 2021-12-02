/// @description Selector/Indicators
// You can write your code in this editor
//draw_self();//I guess this isn't needed because of the sequence?
//draw_text(x,y-16,string(id)+", "+string(attackWillHit));

if(selected&&isPlayer){
	draw_sprite(spr_indicator, 0, x, y);
}

if(targeted){
		var targetCenter = x+unitSequence.activeTracks[0].width/2;
		draw_sprite(spr_select_down,0,targetCenter-5,y-2);
}