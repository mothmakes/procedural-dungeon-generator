/// @description Show progress of generator

//If MST completed, draw it.
if treed == true {
	draw_set_colour(c_green)
	for (var i = 0;i<array_length_1d(tree);i++) {
		//Get start and end markers for the current edge, draw line between them
		//var _denest = tree[0,i];
		var _start = tree[i,0];
		var _dest = tree[i,1];
		draw_line(_start.xx,_start.yy,_dest.xx,_dest.yy)
	}
	
//If graph completed, draw it.
} else if graphed == true {
	draw_set_colour(c_blue)
	for (var i = 0;i<instance_number(obj_marker);i++) {
		var _node = markers[i];
		var _edges = adjacency_list[?markers[i]];
	
		for (var j = 0;j<instance_number(obj_marker);j++) {
			if ds_map_exists(_edges,markers[j]) {
				var _destMarker = markers[j];
				draw_line(_node.x,_node.y,_destMarker.x,_destMarker.y)
			}
		}
	}
}