///@arg0 reachSet
function scr_findMinimum() {

	// Basic get minimum algorithm. Compares weights of all edges and returns the two
	// nodes in the shortest edge.

	var _reachSet = argument[0];

	var _min = 100000;
	var _minNode = noone;
	var _node = noone;

	// Checks every visited node to see if an unvisited node has a smaller edge
	for (var j=0;j<array_length_1d(_reachSet);j++) {
		var X = _reachSet[j];
		var _edges = adjacency_list[?X];
		keysArray = [];
		keysArray[0] = ds_map_find_first(_edges);

		for (var i=0;i<ds_map_size(_edges);i++) {
			keysArray[i+1] = ds_map_find_next(_edges,keysArray[i])
		}

		for (var i=0;i<array_length_1d(keysArray);i++) {
			var temp = _edges[?keysArray[i]];
			if ds_list_find_index(unreachSet,keysArray[i]) != -1 {
				if temp <= _min {
					_min = temp;
					_node = X;
					_minNode = keysArray[i];
				}
			}
		}
	}

	return [_node,_minNode];


}
