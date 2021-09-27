function scr_detectLOS(maxRange) {
	var _player = obj_gameManager.player;
	var _start = [scr_roundm(x,16),scr_roundm(y,16)];
	var _dest = [scr_roundm(_player.x,16),scr_roundm(_player.y,16)];
	var _tilemap = obj_gameManager.CollisionMap;

	var _length = sqrt(sqr(_dest[0]-_start[0])+sqr(_dest[1]-_start[1]));

	var points = [];
	if (_length <=maxRange) {
		if abs(_dest[1] - _start[1]) < abs(_dest[0] - _dest[0]) {
	        if _start[0] > _dest[0] {
	            points = plotLineLow(_dest[0], _dest[1], _start[0], _start[1])
			} else {
	            points = plotLineLow(_start[0], _start[1], _dest[0], _dest[1])
			}
		} else {
	        if _start[1] > _dest[1] {
	            points = plotLineHigh(_dest[0], _dest[1], _start[0], _start[1])
			} else {
	            points = plotLineHigh(_start[0], _start[1], _dest[0], _dest[1])
			}
		}
	
		//show_debug_message(points);
		
		var _isTile = false;
		var i=0;
		while (_isTile == false) and (i<array_length(points)) {
			var _point = points[i];
			var _isTile = false;
			var tiledata = tilemap_get_at_pixel(_tilemap,_point[0],_point[1])
			var index = tile_get_index(tiledata);
			instance_create_layer(_point[0],_point[1],"Instances",obj_empty);
			if (index == 1) {
				_isTile = true;
				show_debug_message("wall");
				//instance_create_layer(_point[0],_point[1],"Instances",obj_empty);
			}
			i++;
		}
		
		if _isTile == true {
			return false;
		} else {
			return true;
		}
	} else {
		return false;
	}
}
