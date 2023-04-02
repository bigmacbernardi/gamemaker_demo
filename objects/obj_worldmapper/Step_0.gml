/// @description Movement wrap and other stuff
var leftBound = 384;
var rightBound = 3840;
var highBound = 384;
var lowBound = 3840;
if(obj_player.x < leftBound) { obj_player.x = rightBound; }
if(obj_player.x > rightBound){ obj_player.x = leftBound; }
if(obj_player.x < highBound) { obj_player.x = lowBound; }
if(obj_player.x > lowBound){ obj_player.x = highBound; }