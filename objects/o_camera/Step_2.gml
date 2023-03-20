/// @description 
// Get current camera position
var camX = camera_get_view_x(camera)
var camY = camera_get_view_y(camera)
var camW = camera_get_view_width(camera)
var camH = camera_get_view_height(camera)
var zoom_in_w_max = 1280
var zoom_in_h_max = 720
var zoom_out_w_max = 1920
var zoom_out_h_max = 1080

//Set cam width and height to max allowed zoom out
if(camW > zoom_out_w_max or camH > zoom_out_h_max) {
	camW = zoom_out_w_max
	camH = zoom_out_h_max
}

//Panning
if(instance_exists(object_following)) {
	if (mouse_check_button(mb_middle)) {
		var move_x = device_mouse_x_to_gui(0) - mouse_x_previous
		var move_y = device_mouse_y_to_gui(0) - mouse_y_previous
	
		camX -= move_x
		camY -= move_y
	} else {
		//Follow the player 
		//Set the target camera position
		var targetX = object_following.x - camW/2
		var targetY = object_following.y - camH/1.3
	
		//Clamp the target to room bounds
		targetX = clamp(targetX, 0, room_width - camW)
		targetY = clamp(targetY, 0, room_height - camH)
	
		//Smoothly move the camera to the target position
		camX = lerp(camX, targetX, CAM_SMOOTH)
		camY = lerp(camY, targetY, CAM_SMOOTH)
	}
}

//Zooming
var wheel = mouse_wheel_down() - mouse_wheel_up()

if (wheel != 0 and o_pause_menu.pause == false){
	wheel *= zoom_speed
	
	// Add to size
	var addW = camW * wheel
	var addH = camH * wheel
	
	//Max Zoom Out
	if (camW < zoom_out_w_max and camH < zoom_out_h_max) {
		camW += addW
		camH += addH
	} else {
		camW = zoom_out_w_max
		camH = zoom_out_h_max
	}
	
	//Max Zoom In
	if (camW > zoom_in_w_max and camH > zoom_in_h_max) {
		camW += addW
		camH += addH
	} else {
		camW = zoom_in_w_max
		camH = zoom_in_h_max
	}
	
	// Position
	camX -= addW / 2
	camY -= addH / 2
}

//Apply shake
var shake = power(shakeValue, 2) * shakePower
if(global.gameover == false){ 
	camX += random_range(-shake, shake)
	camY += random_range(-shake, shake)
}

//Apply camera position
camera_set_view_pos(camera, camX, camY)
camera_set_view_size(camera, camW, camH)
camera_set_view_angle(camera, random_range(-shake, shake) * shakeAngle)

//Store previous position
mouse_x_previous = device_mouse_x_to_gui(0)
mouse_y_previous = device_mouse_y_to_gui(0)

//Reduce shake
if (shakeValue > 0) shakeValue -= 0.1