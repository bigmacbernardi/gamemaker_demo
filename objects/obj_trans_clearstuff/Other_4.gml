/// @description Set layer "clearstuff" to be shaded with lower alpha
var i = layer_get_id("clearstuff");
if layer_exists(i) and shader_is_compiled(shd_clear){
	layer_shader(i,shd_clear);
}