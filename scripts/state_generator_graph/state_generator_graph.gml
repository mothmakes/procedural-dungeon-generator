// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_generator_graph(){
	if(state_new) {
		//Creates array of room markers
		for (var i=0;i<instance_number(obj_marker);i++) {
			markers[i] = instance_find(obj_marker,i);	
		}

		//Creates a dictionary (edges) within adjacency list, accesible by the marker (node)
		for (var i=0;i<array_length_1d(markers);i++) {
			var _edges = ds_map_create();
			ds_map_add_map(adjacency_list,markers[i],_edges);
		}

		//Connect graph
		for (var i=0;i<array_length_1d(markers);i++) {
			var _marker = markers[i];
			//Connect each other node to current node
			for (var k=0;k<array_length_1d(markers);k++) {
				var _tempMarker = markers[k]
				if _tempMarker != _marker {
					//Calculate distance between current node, and node to be connected
					var _weight = scr_distance_to_point([_marker.x,_marker.y],[_tempMarker.x,_tempMarker.y])
			
					//Adds edge by using node to be connected as a key for it's distance
					ds_map_add(adjacency_list[?markers[i]],_tempMarker,_weight);
				}
			}
		}

		//Updates stage for Draw event
		graphed = true;
	} else if(click) {
		state_switch("Tree");
	}
}