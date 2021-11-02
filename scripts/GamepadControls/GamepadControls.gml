// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GamepadControls(){
	//Gamepad Support
	if(gamepad_is_connected(0)){
		//Do actions with controller
		gamepad_RT = gamepad_button_check_pressed(gp_shoulderrb)
		gamepad_LT = gamepad_button_check_pressed(gp_shoulderlb)
	}
}