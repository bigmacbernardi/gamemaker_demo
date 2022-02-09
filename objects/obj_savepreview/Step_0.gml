/// @description Load data once index is set
if (index!=-1 && leader == ""){
	var name = "save"+string(index)+".ini";
	//load the info to preview
	if !file_exists(name){
		leader = "Empty slot";
	}else{
		ini_open(name);
		level = ini_read_real("party","p0-"+string(LV),0);
		var leader_int =  ini_read_real("global","currentParty0",0);
		leader = ini_read_string("party","p"+string(leader_int)+"-name",0);
		location_name=ini_read_string("position","name","--");
		ini_close();
	}
}