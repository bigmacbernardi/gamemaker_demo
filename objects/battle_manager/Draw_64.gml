/// @description Debug stuff and message box
// You can write your code in this editor
var debug_key = keyboard_check(ord("V"));
//debugging
draw_set_color(c_black);
draw_text_transformed(0,0,"Phase: "+curPhaseName(),.45,.45,0);
draw_text_transformed(98,1,"Selected unit: "+(global.selectedUnit>0?global.selectedUnit.title:"no one"),.45,.45,0);
//draw_text_transformed(90,6,"Selected target: "+(int64(global.targets[0])==-4?"no one":global.targets[0].title+" ("+string(global.targets[0])+")"),.45,.45,0);
if debug_key{
	draw_text_transformed(60,14,"bools:",.45,.45,0);
	draw_set_color(selectedFinished?c_white:c_dkgray);
	draw_text_transformed(90,13,"selectedFinished",.45,.45,0);
	draw_set_color(processFinished?c_white:c_dkgray);
	draw_text_transformed(90,20,"processFinished",.45,.45,0);
	draw_set_color(global.selectedUnit>0 && global.selectedUnit.turnFinished?c_white:c_dkgray);
	draw_text_transformed(5,27,"global.selectedUnit.turnFinished",.45,.45,0);
	draw_set_color(c_white);
	draw_text_transformed(176,27,"("+string(unitsFinished) + "/"+string(totalUnits)+ " 'finished')",.45,.45,0);
	//draw_set_color(usingMouse?c_white:c_dkgray);
	//draw_text_transformed(90,34,"usingMouse",.45,.45,0);
	draw_set_color(c_ltgray);
	draw_text_transformed(45,43,string(alarm1s)+" alarm(s) triggered.    BROADCASTS:",.42,.42,0);
	draw_text_transformed(74,50,"ATK: "+string(atkBroadcasts)+" ITM: "+string(itmBroadcasts)+" H/M: "+string(hitMissBroadcasts)+" DEAD: "+string(deathBroadcasts),.42,.42,0);
}
draw_set_color(c_white);
drawQueue();

if (currentMessage!=""){
	draw_sprite_stretched(spr_menu_temp,0,0,0,camera_get_view_width(cam),40);
	draw_set_color(c_white);
	draw_text_transformed(12,11,currentMessage,.6,.6,0);
}