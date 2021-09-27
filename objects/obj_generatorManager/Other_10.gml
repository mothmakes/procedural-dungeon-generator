/// @description Converts the data structures into a basic tilemap for later parsing

var _tile = global.tile_size;

//Initialise the tilemap
Map = layer_tilemap_create("Tiles_1",0,0,tileset_basic,room_width div _tile,room_height div _tile)
with obj_gameManager Map = obj_generatorManager.Map;
CollisionMap = layer_tilemap_create("Collisions",0,0,tileset_collisions,room_width div _tile,room_height div _tile)
with obj_gameManager CollisionMap = obj_generatorManager.CollisionMap;

//Fill the tilemap with blank tiles
for (var i=0;i<room_width div _tile;i++) {
	for (var j=0;j<room_height div _tile;j++) {
		tilemap_set(Map,1,i,j)
	}
}

//Tiles the corridors
for (var i = 0;i<array_length_1d(tree);i++) {	
	//var _denest = tree[0,i];
	var _start = tree[i,0];
	var _dest = tree[i,1];
	
	// Find direction and if aligned, randomise
	var _x_diff = sign(_dest.xx-_start.xx);
	var _y_diff = sign(_dest.yy-_start.yy);
	if _x_diff == 0 {
		_x_diff = power(-1,irandom_range(1,2))
	}
	if _y_diff == 0 {
		_y_diff = power(-1,irandom_range(1,2))
	}

	// Pick whether across or up first (random)
	if irandom(1) == 0 {
		var _x_y = _start;
		var _y_x = _dest;
	} else {
		var _x_y = _dest;
		var _y_x = _start;
	}
	
	//Checks if increasing or decreasing (for loop derps)
	if _x_diff == 1 {
		for (var _xx=(_start.xx div _tile);_xx<(_dest.xx div _tile);_xx+=_x_diff) {
			tilemap_set(Map,3,_xx,(_x_y.yy div _tile))
			tilemap_set(Map,3,_xx,(_x_y.yy div _tile)+_y_diff)
		}
	} else {
		for (var _xx=(_start.xx div _tile);_xx>(_dest.xx div _tile);_xx+=_x_diff) {
			tilemap_set(Map,3,_xx,(_x_y.yy div _tile))
			tilemap_set(Map,3,_xx,(_x_y.yy div _tile)+_y_diff)
		}
	}
	
	//Checks if increasing or decreasing (for loop derps)
	if _y_diff == 1 {
		for (var _yy=(_start.yy div _tile);_yy<(_dest.yy div _tile);_yy+=_y_diff) {
			tilemap_set(Map,3,(_y_x.xx div _tile),_yy)
			tilemap_set(Map,3,(_y_x.xx div _tile)+_x_diff,_yy)
		}
	} else {
		for (var _yy=(_start.yy div _tile);_yy>(_dest.yy div _tile);_yy+=_y_diff) {
			tilemap_set(Map,3,(_y_x.xx div _tile),_yy)
			tilemap_set(Map,3,(_y_x.xx div _tile)+_x_diff,_yy)
		}
	}
	
}

//Tiles the rooms
for (var i=0;i<array_length_1d(markers);i++) {
	var _start = [markers[i].x/_tile,markers[i].y/_tile]
	//var _denest = roomDimensions[0,i]
	var _width = roomDimensions[i,0]
	var _height = roomDimensions[i,1]
	for (var xx=0;xx<_width;xx++) {
		for (var yy=0;yy<_height;yy++) {
			tilemap_set(Map,2,_start[0]+xx,_start[1]+yy)
		}
	}
}

//Generates collision tiles
for (var xx = 0;xx<room_width div _tile;xx++) {
	for (var yy = 0;yy<room_height div _tile;yy++) {
		var _tileData = tilemap_get(Map,xx,yy);
		if _tileData == 1 {
			tilemap_set(CollisionMap,1,xx,yy)
		}
	}
}

//Tiles the rooms edges
for (var i=0;i<array_length_1d(markers);i++) {
	var _start = [markers[i].x/_tile,markers[i].y/_tile]
	//var _denest = roomDimensions[0,i]
	var _width = roomDimensions[i,0]
	var _height = roomDimensions[i,1]
	for (var xx=0;xx<_width;xx++) {
		for (var yy=0;yy<_height;yy++) {
			if xx == 0 {
				if (tilemap_get(Map,_start[0]+xx-1,_start[1]+yy) != 3) tilemap_set(Map,4,_start[0]+xx-1,_start[1]+yy);
			} 
			if xx == _width-1 {
				var _mirroredEdge = tile_set_mirror(4,true);
				if (tilemap_get(Map,_start[0]+xx+1,_start[1]+yy) != 3) tilemap_set(Map,_mirroredEdge,_start[0]+xx+1,_start[1]+yy);
			} 
			if yy == 0 {
				var _rotatedEdge = tile_set_rotate(4,true);
				if (tilemap_get(Map,_start[0]+xx,_start[1]+yy-1) != 3) tilemap_set(Map,_rotatedEdge,_start[0]+xx,_start[1]+yy-1);
			} 
			if yy == _height-1 {
				var _rotatedEdge = tile_set_rotate(4,true);
				var _mirroredEdge = tile_set_mirror(_rotatedEdge,true);
				if (tilemap_get(Map,_start[0]+xx,_start[1]+yy+1) != 3) tilemap_set(Map,_mirroredEdge,_start[0]+xx,_start[1]+yy+1);
			}
						
			//Corners
			if xx = 0 and yy = 0 {
				if (tilemap_get(Map,_start[0]+xx-1,_start[1]+yy-1) != 3) tilemap_set(Map,5,_start[0]+xx-1,_start[1]+yy-1);
			}
			if xx = _width-1 and yy = 0 {
				var _mirroredEdge = tile_set_mirror(5,true);
				if (tilemap_get(Map,_start[0]+xx+1,_start[1]+yy-1) != 3) tilemap_set(Map,_mirroredEdge,_start[0]+xx+1,_start[1]+yy-1);
			}
			if xx = 0 and yy = _height-1 {
				var _flippedEdge = tile_set_flip(5,true);
				if (tilemap_get(Map,_start[0]+xx-1,_start[1]+yy+1) != 3) tilemap_set(Map,_flippedEdge,_start[0]+xx-1,_start[1]+yy+1);
			}
			if xx = _width-1 and yy = _height-1 {
				var _rotatedEdge = tile_set_rotate(5,true);
				var _mirroredEdge = tile_set_mirror(_rotatedEdge,true);
				if (tilemap_get(Map,_start[0]+xx+1,_start[1]+yy+1) != 3) tilemap_set(Map,_mirroredEdge,_start[0]+xx+1,_start[1]+yy+1);
			}
		}
	}
}