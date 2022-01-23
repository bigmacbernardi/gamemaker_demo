/// @description Yusuf battle init

index = YUSUF;//will make slotting easier
event_inherited();//will set stats based on INDEX
layer_sequence_destroy(unitSequence);
unitSequence = layer_sequence_create("Sequences",x,y,sYusuf);
//layer_shader(unitSequence,shd_Sepia);