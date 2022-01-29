// Defensive maneuvers
function defend(){
	with global.selectedUnit!=noone?global.selectedUnit:global.allies[|0]
			current[DEF] = 1.5* current[@ DEF]; //needs corresponding reset
	with battle_manager
		alarm[1]=1;
}
function block(target=global.targets[0]){
	if target==noone
		with battle_manager
			alarm[1]=1;

}
function meditate(){
	with battle_manager alarm[1]=1;
}