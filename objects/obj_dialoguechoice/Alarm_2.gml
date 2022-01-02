/// @description Setting options
var s = optionString;
var p = string_pos(",", s);
var dl = string_length(d);
if (dl) while (p) {
	p -= 1;
	ds_list_add(options, string_copy(s, 1, p));
	s = string_delete(s, 1, p + dl);
	p = string_pos(",", s);
}
ds_list_add(options, s);