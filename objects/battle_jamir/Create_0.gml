/// @description Jamir battle init

index = JAMIR;//will make slotting easier
event_inherited();//will set stats based on INDEX
layer_sequence_destroy(unitSequence);
unitSequence = layer_sequence_create("Sequences",x,y,sMusa);
//layer_shader(unitSequence,shader regularColor);