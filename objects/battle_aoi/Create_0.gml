/// @description When Aoi spawns in battle

index = AOI;//so inherited event knows what to do
event_inherited();//see battle_player
layer_sequence_destroy(unitSequence);
unitSequence = layer_sequence_create("Sequences",x,y,sAoiBattle);
//layer_shader(unitSequence,shd_Sepia);