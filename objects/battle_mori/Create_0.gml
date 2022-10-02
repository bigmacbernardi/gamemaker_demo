/// @description When Mori spawns in battle

index = MORI;//so inherited event knows what to do
event_inherited();//see battle_player
layer_sequence_destroy(unitSequence);
unitSequence = layer_sequence_create("Sequences",x,y,sMoriBattle);
//layer_shader(unitSequence,shd_Sepia);