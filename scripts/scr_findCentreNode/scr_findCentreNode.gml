function scr_findCentreNode() {

	// Returns the node closest to the centre of the dungeon

	var _translate_width = room_width/2;
	var _translate_height = room_height/2;

	var _minimum = 100000;
	for (var i = 0;i<array_length_1d(markers);i++) {
		var _node = markers[i]
		var _temp = scr_distance_to_point([_node.x,_node.y],[_translate_width,_translate_height])
		if _temp <= _minimum {
			_minimum = _temp;
			var _minNode = i;
		}
	}

	return _minNode;


}
