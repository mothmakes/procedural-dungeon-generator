///@arg0 a[x,y]
///@arg1 b[x,y]
function scr_distance_to_point() {

	// Finds length of line connecting points

	var _a = argument[0];
	var _b = argument[1];

	var _length = sqrt(sqr(_b[1]-_a[1])+sqr(_b[0]-_a[0]));

	return _length;


}
