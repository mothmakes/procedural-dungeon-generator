// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_generator_tiles(){
	if(state_new) {
		//Triggers the tile conversion
		event_user(0);
	} else if (click) {
		state_switch("Player Generation");
	}
}