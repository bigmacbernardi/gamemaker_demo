/// @description Insert description here
// You can write your code in this editor

//debugging

draw_text_transformed(0,0,"Phase: "+curPhaseName(),.45,.45,0);
draw_text_transformed(90,6,"Selected target: "+(int64(global.targets[0])==-4?"no one":global.targets[0].title+" ("+string(global.targets[0])+")"),.45,.45,0);

//for (var i = 0; i < ds_list_size(global.units); i++){
//	var guy_type = (ds_list_find_index(global.allies,global.units[|i])!=-1?"(ally, alive)":
//					(ds_list_find_index(global.enemies,global.units[|i])!=-1?"(enemy, alive)":"(dead)"));
//	draw_text_transformed(280,2+(i*15),string(i)+": "+global.units[|i].title+"#"+string(global.units[|i])+" "+guy_type,.375,.375,0);
//}
var displayPurposesOnly = ds_priority_create();
ds_priority_copy(displayPurposesOnly,pq)
foreach_priority(displayPurposesOnly);
ds_priority_destroy(displayPurposesOnly);
/*for (var i = 0; i < ds_priori; i++){
	var guy_type = (ds_list_find_index(global.allies,global.units[|i])!=-1?"(ally, alive)":
					(ds_list_find_index(global.enemies,global.units[|i])!=-1?"(enemy, alive)":"(dead)"));
	draw_text_transformed(280,2+(i*15),string(i)+": "+global.units[|i].title+"#"+string(global.units[|i])+" "+guy_type,.375,.375,0);
}*/