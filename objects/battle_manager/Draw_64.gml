/// @description Debug stuff and message box
// You can write your code in this editor

//debugging

draw_text_transformed(0,0,"Phase: "+curPhaseName(),.45,.45,0);
draw_text_transformed(98,1,"Selected unit: "+(global.selectedUnit>0?global.selectedUnit.title:"no one"),.45,.45,0);
//draw_text_transformed(90,6,"Selected target: "+(int64(global.targets[0])==-4?"no one":global.targets[0].title+" ("+string(global.targets[0])+")"),.45,.45,0);
draw_text_transformed(60,14,"bools:",.45,.45,0);
draw_set_color(selectedFinished?c_white:c_dkgray);
draw_text_transformed(90,13,"selectedFinished",.45,.45,0);
draw_set_color(processFinished?c_white:c_dkgray);
draw_text_transformed(90,20,"processFinished",.45,.45,0);
draw_set_color(global.selectedUnit>0 && global.selectedUnit.turnFinished?c_white:c_dkgray);
draw_text_transformed(5,27,"global.selectedUnit.turnFinished",.45,.45,0);
draw_set_color(c_white);
draw_text_transformed(176,27,"("+string(unitsFinished) + " finished)",.45,.45,0);
draw_set_color(usingMouse?c_white:c_dkgray);
draw_text_transformed(90,34,"usingMouse",.45,.45,0);


draw_set_color(c_white);
//for (var i = 0; i < ds_list_size(global.units); i++){
//	var guy_type = (ds_list_find_index(global.allies,global.units[|i])!=-1?"(ally, alive)":
//					(ds_list_find_index(global.enemies,global.units[|i])!=-1?"(enemy, alive)":"(dead)"));
//	draw_text_transformed(280,2+(i*15),string(i)+": "+global.units[|i].title+"#"+string(global.units[|i])+" "+guy_type,.375,.375,0);
//}
/*if (typeof(pq)==ds_type_priority){//don't even have to change
	var displayPurposesOnly = ds_priority_create();
	ds_priority_copy(displayPurposesOnly,pq)
	foreach_priority(displayPurposesOnly);
	ds_priority_destroy(displayPurposesOnly);
}
else*/drawQueue();
/*for (var i = 0; i < ds_priori; i++){
	var guy_type = (ds_list_find_index(global.allies,global.units[|i])!=-1?"(ally, alive)":
					(ds_list_find_index(global.enemies,global.units[|i])!=-1?"(enemy, alive)":"(dead)"));
	draw_text_transformed(280,2+(i*15),string(i)+": "+global.units[|i].title+"#"+string(global.units[|i])+" "+guy_type,.375,.375,0);
}*/

if (currentMessage!=""){
	draw_sprite_stretched(spr_menu_temp,0,0,0,camera_get_view_width(cam),40);
	draw_set_color(c_white);
	draw_text_transformed(12,11,currentMessage,.6,.6,0);
}