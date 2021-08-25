/// @description Insert description here
// You can write your code in this editor

//debugging

draw_text(0,0,"Phase: "+curPhaseName());
draw_text(0,16,"Selected target: "+(int64(global.selectedTargets)==-4?"no one":string(global.selectedTargets)));

for (var i = 0; i < ds_list_size(global.units); i++){
	var guy_type = (ds_list_find_index(global.allies,global.units[|i])!=-1?"(ally, alive)":
					(ds_list_find_index(global.enemies,global.units[|i])!=-1?"(enemy, alive)":"(dead)"));
	draw_text(0,32+(i*16),string(global.units[|i])+" "+guy_type);
}