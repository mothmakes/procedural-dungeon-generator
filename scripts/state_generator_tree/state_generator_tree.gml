// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_generator_tree(){
	if(state_new) {
		tree = [];

		//Returns the edges in the MST. An MST is a tree that connects all nodes using the shortest
		//connection available after adding a node. No loops, but all rooms are accessible.
		tree = scr_minimumSpanningTree();

		//Cleanup data structures
		ds_map_destroy(adjacency_list);
		ds_list_destroy(unreachSet);

		//Starts MST stage for Draw event.
		treed = true;
	} else if(click) {
		state_switch("Room Init");
	}
}