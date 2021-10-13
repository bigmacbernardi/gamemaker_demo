// How Toby put the faces down.  Will merge in with something else
if !variable_global_exists("facechoice") global.facechoice=0;
if(global.facechoice == 1) {
    instance_create_depth(writer.x - 33, writer.y + 25,-10, obj_face); //originally character-specific, but why lol
    instance_create_depth(0, 0,-10, 764/* obj_torbody */);
}
if(global.facechoice == 2)
    instance_create_depth(writer.x - 36, writer.y + 25,-10, obj_face);
if(global.facechoice == 3)
    instance_create_depth(writer.x - 35, writer.y + 25,-10, obj_face);
if(global.facechoice == 4)
    instance_create_depth(writer.x - 35, writer.y + 25,-10, obj_face);
if(global.facechoice == 5)
    instance_create_depth(writer.x - 40, writer.y + 25,-10, obj_face);
if(global.facechoice == 6)
    instance_create_depth(writer.x - 39, writer.y + 25,-10, obj_face);
if(global.facechoice == 7)
    instance_create_depth(writer.x - 40, writer.y + 20,-10, obj_face);
if(global.facechoice == 8)
    instance_create_depth(writer.x - 18, writer.y + 45,-10, obj_face);
if(global.facechoice == 9)
    instance_create_depth(writer.x - 30, writer.y + 30,-10, obj_face);
