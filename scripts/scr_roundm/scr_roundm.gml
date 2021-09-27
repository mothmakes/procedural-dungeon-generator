///@arg0 number
///@arg1 multiple
function scr_roundm() {

	//Rounds a given number to the nearest given multiple.

	var _number = argument[0];
	var _multiple = argument[1];

	return floor(((_number + _multiple - 1)/_multiple))*_multiple


}
