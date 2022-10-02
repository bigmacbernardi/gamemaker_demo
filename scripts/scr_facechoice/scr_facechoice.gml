// How Toby put the faces down.  Will merge in with something else
if !variable_global_exists("facechoice") global.facechoice=0;
switch (global.facechoice){
	case 0://none
	    break;
	case 1:
	    instance_create_depth(writer.x - 55, writer.y + 2,-1000, obj_face_elder);//givin character specificity a shot
		break;
	case MORI+2:
	    instance_create_depth(writer.x - 50, writer.y + 8,-1000, obj_face_mori);//originally character-specific, but why lol
		break;
	case MUSA+2:
	    instance_create_depth(writer.x - 50, writer.y + 7,-1000, obj_face_musa);
		break;
	case 4:
	    instance_create_depth(writer.x - 35, writer.y + 25,-1000, obj_face);
		break;
	case 5:
	    instance_create_depth(writer.x - 40, writer.y + 25,-1000, obj_face);
		break;
	case 6:
	    instance_create_depth(writer.x - 39, writer.y + 25,-1000, obj_face);
		break;
	case 7:
	    instance_create_depth(writer.x - 40, writer.y + 20,-1000, obj_face);
		break;
	case 8:
	    instance_create_depth(writer.x - 18, writer.y + 45,-1000, obj_face);
		break;
	case 9:
	    instance_create_depth(writer.x - 30, writer.y + 30,-1000, obj_face);
		break;
	case 20+2://mom
	    instance_create_depth(writer.x - 30, writer.y + 30,-1000, obj_face);
		break;
	default:
	    instance_create_depth(writer.x - 30, writer.y + 30,-1000, obj_face);
		break;
}