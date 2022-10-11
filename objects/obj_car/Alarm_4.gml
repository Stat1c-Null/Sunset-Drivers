/// @description Alarm for camera shake
if(o_camera.collisionWithDynamic) {//Collision with prop
	o_camera.shakeValue = 1.2
	alarm[5] = 1
} else if (o_camera.collisionWithCar){//Collision with car
	o_camera.shakeValue = 1.8
	alarm[5] = 1
} else {
	o_camera.shakeValue = 0.8//Collision with static object
	alarm[5] = 1
}