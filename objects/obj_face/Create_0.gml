/// @description So other things don't have to keep redrawing face?
if(instance_exists(obj_dialoguer) && obj_dialoguer.count == 0) {
    visible= 0;
    alarm[9]= 1;
}