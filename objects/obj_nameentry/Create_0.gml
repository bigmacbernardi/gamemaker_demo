///@description Set display crap
obj_player.paused =true;//SHOULDN'T be necessary
obj_player.visible =false;
black=false;
black_alpha = 1;
characters = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","'",".",",","!","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","?"]; //should be based on locale!
char_limit = 10;
name_so_far = "";
defaulted = false;
index = 0;//on name
index2 = 0;//on character menu
function saveName(){
	if naming_whom >= 0 and naming_whom <= array_length(global.names){
		obj_player.visible =true;
		global.names[naming_whom]=name_so_far;
		obj_player.paused =false;//SHOULDN'T be necessary
		instance_destroy();
	}
}