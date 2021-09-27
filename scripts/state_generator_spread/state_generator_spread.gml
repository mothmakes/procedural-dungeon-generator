function state_generator_spread() {
	//Number of rooms
	var _number = instance_number(obj_marker);
	
	
	if(key_space) time_held++;

	//Determines length of simulation based on number of rooms
	if(key_space && time_held < seperation_time) { 
		
		//Loops through each room
		for(var i = 0;i < _number;i++) {
			var _agent = instance_find(obj_marker,i);
			
			//Performs seperation steering algorithm to determine a vector to add to the current
			//position
			var _seperation = scr_computeSeperation(_agent,_number);
	
			with _agent {
				//Adds seperation vector
				x += _seperation[0] * base_speed;
				y += _seperation[1] * base_speed;
			}
		}
	} else if(time_held > seperation_time) {
		// Ensures all rooms are snapped to grid. Better results than rounding each move (stops overlap)
		for(var i = 0;i < _number;i++) {
				var _agent = instance_find(obj_marker,i);
		
				with _agent {
					//Snaps to tilegrid
					x = scr_roundm(x,16);
					y = scr_roundm(y,16);
			
					//Updates room centres, rounds to grid
					xx = scr_roundm(x+((width*16)/2),global.tile_size);
					yy = scr_roundm(y+((height*16)/2),global.tile_size);
				}
		}
		spread = true;
		if(click) state_switch("Graph");
	}
}