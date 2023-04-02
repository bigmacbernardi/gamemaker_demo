/// @description Updates positions!  Will skip indexes of destroyed items, so I guess watch out?

var tribbles = obj_enemy_tribble.instance_count;
var ghosts = obj_enemy.instance_count;
var plants = obj_enemy_plant.instance_count;
var index = -1;
for (var i = 0;i<tribbles;i++){
	var unit = instance_find(obj_enemy_tribble,i);
	xs[++index]=unit.x;
	ys[index]=unit.y;
}
for (var i = tribbles;i<tribbles+ghosts;i++){
	var unit = instance_find(obj_enemy,i-tribbles);
	xs[++index] = unit.x;
	ys[index]=unit.y;
}
for (var i = tribbles+ghosts;i<tribbles+ghosts+plants;i++){
	var unit = instance_find(obj_enemy_plant,i-(tribbles+ghosts));
	xs[++index]=unit.x;
	ys[index]=unit.y;
}