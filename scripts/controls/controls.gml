
function Controls(){
	key_forward = keyboard_check(ord("W")) or keyboard_check(vk_up)
	key_brake = keyboard_check(ord("S")) or keyboard_check(vk_down)
	key_left = keyboard_check(ord("A")) or keyboard_check(vk_left)
	key_right = keyboard_check(ord("D")) or keyboard_check(vk_right)
	key_handbrake = keyboard_check(vk_space)
	key_mb_left = mouse_check_button(mb_left)
	
	//Gamepad gas and break
	if(gamepad_is_connected(0)){
		//Do actions with controller
		gamepad_RT = gamepad_button_check(0, gp_shoulderrb)//Gas
		gamepad_LT = gamepad_button_check(0, gp_shoulderlb)//Brake
		gamepad_LS = gamepad_button_check(0, gp_shoulderl)//Handbrake
	}
}