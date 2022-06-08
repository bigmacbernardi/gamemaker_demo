/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();//consists of the following
/*if(selected&&isPlayer){
	draw_sprite(spr_indicator, 0, x, y);
}

if(targeted){
		var targetCenter = x+unitSequence.activeTracks[0].width/2;
		draw_sprite(spr_select_down,0,targetCenter-5,y-2);
}

layer_sequence_x(unitSequence,x);
layer_sequence_y(unitSequence,y);*/
draw_set_alpha(0.6);
draw_sprite(myceliumanweb,layer_sequence_get_headpos(unitSequence),x,y);
draw_set_alpha(1);

