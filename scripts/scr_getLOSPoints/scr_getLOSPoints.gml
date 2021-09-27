// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_getLOSPoints(_length,maxRange,_dest,_start){
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
	}
	return points;
}