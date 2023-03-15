var dir = point_direction(x, y, x, y - 70);
if global.busted == false 
	physics_apply_impulse(x, y, lengthdir_x(0.8/2.5, dir), lengthdir_y(0.8/2.5, dir))

