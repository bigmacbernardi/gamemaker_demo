/// @description Track current room's enemies OR reset to last position
if !instance_exists(battle_manager){
	var tribbles = instance_count(obj_enemy_tribble);
	var ghosts = instance_count(obj_enemy);
	var plants = instance_count(obj_enemy_plant);
	var found=false;
	for (var i =0;i<ds_list_size(rooms_visited);i++){	
		if rooms_visited[|i]==room{
			found=true;
			break;
		}
	}
	if !found{
		xs=[];
		ys=[];
		var index = -1;
		for (var i = 0;i<tribbles;i++){
			var unit = instance_find(obj_enemy_tribble,i);
			xs[++index]=unit.x;
			ys[index]=unit.y;
		}
		for (var i = 0;i<ghosts;i++){
			var unit = instance_find(obj_enemy,i);
			xs[++index]=unit.x;
			ys[index]=unit.y;
		}
		for (var i = 0;i<plants;i++){
			var unit = instance_find(obj_enemy_plant,i);
			xs[++index]=unit.x;
			ys[index]=unit.y;
		}
		ds_list_add(rooms_visited,room);
	}
	else{
		var index = -1;
		for (var i = 0;i<tribbles;i++){
			var unit = instance_find(obj_enemy_tribble,i);
			unit.x = xs[++index];
			unit.y = ys[index];
		}
		for (var i = tribbles;i<tribbles+ghosts;i++){
			var unit = instance_find(obj_enemy,i-tribbles);
			unit.x = xs[++index];
			unit.y = ys[index];
		}
		for (var i = tribbles+ghosts;i<tribbles+ghosts+plants;i++){
			var unit = instance_find(obj_enemy_plant,i-(tribbles+ghosts));
			unit.x = xs[++index];
			unit.y = ys[index];
		}
	}
}