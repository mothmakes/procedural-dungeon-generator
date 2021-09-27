// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function plotLineLow(x0,x1,y0,y1){
	///@arg0 x0
	///@arg1 x1
	///@arg2 y0
	///@arg3 y1
	
	var dx = x1 - x0;
    var dy = y1 - y0;
    var yi = 1;
    if (dy < 0) {
        yi = -1;
        dy = -dy;
	}
    var D = (2 * dy) - dx;
    var yy = y0;
	
	var points = [];

    for (var xx = x0;xx < x1;xx++) {
		points[array_length(points)] = [xx,yy];
        if D > 0 {
               yy = yy + yi;
               D = D + (2 * (dy - dx));
		} else {
               D = D + 2*dy;
		}
	}
	
	return points;
}
function plotLineHigh(x0,x1,y0,y1) {
	var dx = x1 - x0;
    var dy = y1 - y0;
    var xi = 1;
    if (dx < 0) {
        xi = -1;
        dx = -dx;
	}
    var D = (2 * dx) - dy;
    var xx = x0;
	
	var points = [];

    for (var yy = y0;yy < y1;yy++) {
        points[array_length(points)] = [xx,yy];
        if (D > 0) {
               xx = xx + xi;
               D = D + (2 * (dx - dy));
		}
        else {
               D = D + 2*dx;
		}
	}
	
	return points;
}