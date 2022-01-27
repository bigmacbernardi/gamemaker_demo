// Defensive maneuvers
function defend(){
	with battle_manager{
			current[DEF] = 1.5* current[@ DEF]; //needs corresponding reset
			alarm[1]=1;
		}
}
function block(target=global.targets[0]){
	if target==noone
		with battle_manager
			alarm[1]=1;

}
function meditate(){
	with battle_manager alarm[1]=1;
}