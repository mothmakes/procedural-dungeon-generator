///@arg0 radius
function scr_getRandomPointInCircle() {

	var _radius = argument[0];

	var _t = 2*pi*random(1);
	var _u = random(1)+random(1)
	var _r = noone;

	if _u > 1 {
		_r = 2-_u
	} else {
		_r = _u
	}

	var _point = [scr_roundm(_radius*_r*cos(_t),global.tile_size)+translate_width, scr_roundm(_radius*_r*sin(_t),global.tile_size)+translate_height];

	return _point;


}
