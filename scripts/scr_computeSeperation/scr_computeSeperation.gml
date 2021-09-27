///@arg0 agent
///@arg1 number_of_agents
function scr_computeSeperation() {

	//Calculates a vector to move a room away, if it is too close.
	//Uses seperation steering behavior.

	var _myAgent = argument[0];
	var _number = argument[1];

	var _vector = [0,0];
	var _neighbourCount = 0;

	//How far each room should be spaced
	var _proximity = global.tile_size * 4;

	var _tile = global.tile_size;

	//Compounds a vector based on the number of close rooms
	for(var i = 0;i < _number;i++) {
		var _agent = instance_find(obj_marker,i);
		if _agent != _myAgent {
		
			// Dramatically increases vector if the rooms occupy the same space
			// Necessary due to tile rounding
			if _agent.x == _myAgent.x and _agent.y == _myAgent.y {
				_vector[0] += 32;
				_vector[1] += 32;
			}
		
			// Since the rooms themselves should be spaced out, not just points,
			// I had to determine minimum distance between the rooms to determine
			// whether the room is a neighbour
		
			// Assemble Bounding Boxes
			var _rectA = [_myAgent.x,_myAgent.y,_myAgent.x+(_myAgent.width*_tile),_myAgent.y+(_myAgent.height*_tile)]
			var _rectB = [_agent.x,_agent.y,_agent.x+(_agent.width*_tile),_agent.y+(_agent.height*_tile)]
		
			// Assemble total bounding rectangle
			var _outLeft = min(_rectA[0],_rectB[0]);
			var _outRight = max(_rectA[2],_rectB[2]);
			var _outWidth =  _outRight-_outLeft;
		
			var _outTop = min(_rectA[1],_rectB[1]);
			var _outBottom = max(_rectA[3],_rectB[3]);
			var _outHeight = _outBottom - _outTop;
		
			// Assemble internal bounding rectangle (0 if overlapping)
			var _innerWidth = max(0,(_outWidth - (_myAgent.width*_tile) - (_agent.width*_tile)));
			var _innerHeight = max(0,(_outHeight - (_myAgent.height*_tile) - (_agent.height*_tile)));
		
			// Calculate Distance Between Rooms (diagonal of inner rectangle)
			var _minDistance = sqrt(sqr(_innerWidth) + sqr(_innerHeight));
		
			// Increases vector if found to be neighbours
			if _minDistance < _proximity {
				_vector[0] += _agent.x - _myAgent.x;
				_vector[1] += _agent.y - _myAgent.y;
				_neighbourCount++;
			}
		}
	}

	// Returns 0 if already distant
	if _neighbourCount == 0 {
		return _vector;
	} else {
		// Deals with odd cases (not sure of cause). This fixes it.
		if (_vector[0] == 0 and _vector[1] == 0) {
			return _vector;
		}
	
		// Means middle rooms don't move as much as outer rooms.
		_vector[0] /= _neighbourCount;
		_vector[1] /= _neighbourCount;
	
		// Ensures rooms move away.
		_vector[0] *= -1;
		_vector[1] *= -1;

		// Converts vector to unit vector
		var _sqrd0 = _vector[0]*_vector[0];
		var _sqrd1 = _vector[1]*_vector[1];
		var _length = sqrt(_sqrd0+_sqrd1);
		_vector[0] /= _length;
		_vector[1] /= _length;

		return _vector;
	}


}
