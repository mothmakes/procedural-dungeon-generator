///@arg0 tree
///@arg1 maxDistanceFromStart
///@arg2 startNode
function scr_parseTree() {

	var _tree = argument[0];
	var _maxDistance = argument[1];
	var _nextNode = argument[2];

	for (var i = 0;i<_maxDistance;i++) {
		//var _denest = _tree[0,i];
		if _nextNode = _tree[i,0] {
			_nextNode = _tree[i,1];
		}
	}

	return _nextNode;
	


}
