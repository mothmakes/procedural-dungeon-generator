// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_generator_room_init(){
	if(state_new) {
		// Start and end rooms
		startRoom = markers[scr_findCentreNode()];
		show_debug_message(startRoom)

		endRoom = scr_parseTree(tree,5,startRoom)
		show_debug_message(endRoom)
	} else if (click) {
		state_switch("Tile Conversion");	
	}
}