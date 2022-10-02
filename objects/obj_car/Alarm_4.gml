/// @description Alarm for camera shake
if(o_camera.collisionWithDynamic) {
	o_camera.shakeValue = 2
	alarm[5] = 1
} else if (o_camera.collisionWithCar){
	o_camera.shakeValue = 3
	alarm[5] = 1
} else {
	o_camera.shakeValue = 1
	alarm[5] = 1
}

