/// @description Insert description here
// You can write your code in this editor

if obj_generatorManager.startRoom == id {
	draw_set_colour(c_purple)
} else if obj_generatorManager.endRoom == id {
	draw_set_colour(c_orange)
} else {
	draw_set_colour(c_white)
}

draw_rectangle(x,y,x+(global.tile_size*width),y+(global.tile_size*height),true);
draw_self();