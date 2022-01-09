// How Toby put the faces down.  Will merge in with something else
if !variable_global_exists("facechoice") global.facechoice=0;
if(global.facechoice == 1) {
    instance_create_depth(writer.x - 55, writer.y + 2,-1000, obj_face_elder);//givin character specificity a shot
}
if(global.facechoice == AOI+2)
    instance_create_depth(writer.x - 36, writer.y + 25,-1000, obj_face);//originally character-specific, but why lol
if(global.facechoice == YUSUF+2)
    instance_create_depth(writer.x - 35, writer.y + 25,-1000, obj_face_yusuf);
if(global.facechoice == 4)
    instance_create_depth(writer.x - 35, writer.y + 25,-1000, obj_face);
if(global.facechoice == 5)
    instance_create_depth(writer.x - 40, writer.y + 25,-1000, obj_face);
if(global.facechoice == 6)
    instance_create_depth(writer.x - 39, writer.y + 25,-1000, obj_face);
if(global.facechoice == 7)
    instance_create_depth(writer.x - 40, writer.y + 20,-1000, obj_face);
if(global.facechoice == 8)
    instance_create_depth(writer.x - 18, writer.y + 45,-1000, obj_face);
if(global.facechoice == 9)
    instance_create_depth(writer.x - 30, writer.y + 30,-1000, obj_face);
