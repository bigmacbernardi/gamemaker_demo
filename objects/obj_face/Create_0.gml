/// @description So other things don't have to keep redrawing face?

//if (global.faceemotion == 0)sprite_index = spr_girl_face0;
if (global.faceemotion == 1)sprite_index = spr_girl_face1;
else if (global.faceemotion == 2)sprite_index = spr_girl_face2;
else if (global.faceemotion == 3)sprite_index = spr_girl_face3;
else if (global.faceemotion == 4)sprite_index = spr_girl_face4;
else if (global.faceemotion == 5)sprite_index = spr_girl_face5;
else if (global.faceemotion == 6)sprite_index = spr_girl_face6;
else if (global.faceemotion == 7)sprite_index = spr_girl_face7;
else if (global.faceemotion == 8)sprite_index = spr_girl_face8;
else if (global.faceemotion == 9)sprite_index = spr_girl_face9;
else if (global.faceemotion == 10)sprite_index = spr_girl_face10;
else if (global.faceemotion == 11)sprite_index = spr_girl_face11;
else if (global.faceemotion == 12)sprite_index = spr_girl_face12;

if(instance_exists(obj_dialoguer) && obj_dialoguer.count == 0) {
    visible= 0;
    alarm[9]= 1;
}