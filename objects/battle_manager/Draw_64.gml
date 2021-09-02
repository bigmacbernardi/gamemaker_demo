/// @description Insert description here
// You can write your code in this editor

//debugging

draw_text_transformed(0,0,"Phase: "+curPhaseName(),.6,.6,0);
draw_text_transformed(90,6,"Selected target: "+(int64(global.targets)==-4?"no one":global.targets.title+" ("+string(global.targets)+")"),.6,.6,0);

for (var i = 0; i < ds_list_size(global.units); i++){
	var guy_type = (ds_list_find_index(global.allies,global.units[|i])!=-1?"(ally, alive)":
					(ds_list_find_index(global.enemies,global.units[|i])!=-1?"(enemy, alive)":"(dead)"));
	draw_text_transformed(280,24+(i*15),string(i)+": "+global.units[|i].title+"#"+string(global.units[|i])+" "+guy_type,.5,.5,0);
}