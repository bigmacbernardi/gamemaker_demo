// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Helper(){

}


/*function checkForHit(){
	var number = random(1);
	var unit = global.selectedUnit;
	show_debug_message("Checking for hit (ACC "+string(10*global.selectedUnit.current[@ ACC])
			+", rolled a "+string(10-(number*10))+")");
	if (number < unit.current[@ ACC])
		unit.attackWillHit = true;
	else
		unit.attackWillHit = false;
}*/

function checkForHit(){
	var number = random(1);
	var unit = global.selectedUnit;
	show_debug_message("Checking for hit (ACC "+string(10*global.selectedUnit.current[@ ACC])
			+", rolled a "+string(10-(number*10))+")");
	if (number < unit.current[@ ACC])
		unit.attackWillHit = true;
	else
		unit.attackWillHit = false;
}

function useItem(){
	show_debug_message(global.selectedUnit.title+" using "+ global.itemInUse[0].title +" on " + global.targets[0].title);
	/*	with(global.targets[0]){
			state = MISS;
			//getting-healed animation?
		}*/
	
}
function unitAttack(){
	show_debug_message(global.selectedUnit.title+" attacking "+global.targets[0].title+"#"+string(global.targets[0]));
	var unit = global.selectedUnit;
	if (unit.attackWillHit){
		for (var i = 0; i < array_length(global.targets); i++){ //should recalculate and put outside, but that's not how attack works rn
			with(global.targets[i]){
					incomingDamage = unit.current[@ STR] ;
					show_debug_message("INCOMING DAMAGE: "+string(incomingDamage));
					state = HIT;
					layer_sequence_headpos(unitSequence,hitStart);
			}
		}
	}
	else{
		for (var i = 0; i < array_length(global.targets); i++){
			with(global.targets[i]){
				show_debug_message("OFFICIALLY MISSING");
				state = MISS;
				if (!isPlayer) path_start(enemy_dodge,5,path_action_stop,false);	
				layer_sequence_headpos(unitSequence,missStart);
			}
		}
	
	}

}
function setParticle(int){
	var debug_names = ["Healing","Wind","Fire","Water","Shadow","Light","Electric","Ice","Spirit"];
	show_debug_message("Casting "+debug_names[int]+" magic");
	switch(int){
		case 0: //heal
				part_type_shape(global.Particle1, pt_shape_spark);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_green);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,359,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
		case 1:	//wind
				part_type_shape(global.Particle1, pt_shape_line);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_ltgrey);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,269,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
		case 2: //fire
				part_type_shape(global.Particle1, pt_shape_spark);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_red);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,359,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
		case 3:	//Water
				part_type_shape(global.Particle1, pt_shape_cloud);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_blue);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,359,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
		case 4:	//Shadow
				part_type_shape(global.Particle1, pt_shape_smoke);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_dkgrey);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,359,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
		case 5:	//Light
				part_type_shape(global.Particle1, pt_shape_spark);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_green);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,359,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
		case 6:	//Electric
				part_type_shape(global.Particle1, pt_shape_spark);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_green);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,359,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
		case 7:	//Ice
				part_type_shape(global.Particle1, pt_shape_snow);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_aqua);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,359,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
		case 8:	//Fighting spirit (Shadow + energy + fire + earth)
				part_type_shape(global.Particle1, pt_shape_spark);
				part_type_size(global.Particle1,1,1,0,2);
				part_type_color1(global.Particle1,c_yellow);
				part_type_alpha1(global.Particle1,1);
				part_type_speed(global.Particle1,0.50,2,-0.10,0);
				part_type_direction(global.Particle1,0,359,0,20);
				part_type_orientation(global.Particle1,0,0,0,0,true);
				part_type_blend(global.Particle1,1);
				part_type_life(global.Particle1,5,30);
				break;
	}

}