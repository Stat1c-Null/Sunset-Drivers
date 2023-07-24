///@description DRAW HUD
//Draw text unless player is busted
if(global.busted == false and global.wasted == false) {
	//Gas Gas Gas i am gonna step on the gas tonight we'll fly
	//Animate gas fluid
	if gasFrame < 29 {
		draw_sprite_ext(s_VerticalGasUI, gasFrame, 170, 880, 1, max(0, global.gasAmount/global.maxAmount), 0, c_white, 1)
		gasFrame++
	} else { 
		draw_sprite_ext(s_VerticalGasUI, gasFrame, 170, 880, 1, max(0, global.gasAmount/global.maxAmount), 0, c_white, 1)
		gasFrame = 0	
	}
	
	draw_sprite(s_VerticalGasUIBorder, 1, 170, 900)
	//Speeeeeed
	draw_sprite(s_speedometer, 1, 2390, 600)
	draw_sprite_ext(s_speed_arrow, 1, 2390, 600, image_xscale, image_yscale, arrow_rot, image_blend, image_alpha)
	draw_set_color(c_aqua)
	if instance_exists(o_game_controller)
		if(o_game_controller.range_units == "imperial")
			draw_text(2420, 735, round(global.mphSpeed))
		else 
			draw_text(2420, 735, round(global.kphSpeed))
	draw_set_color(c_red)
	draw_text(2435, 690, global.gear)
	if instance_exists(o_game_controller)
		if(o_game_controller.range_units == "imperial")
			draw_sprite(s_gear_m, 0,2515, 735)//mph
		else if(o_game_controller.range_units == "metric")
			draw_sprite(s_gear_km, 1,2505, 735)//kph
	//Score
	draw_set_color(c_yellow)
	draw_text(1227, 100, "SCORE")
	draw_text(1220, 115, "______")
	draw_set_color(c_orange)
	//calculate_score(obj_car.player_score, obj_car.score_x_pos)
	//put score_x_pos instead of 1220
	draw_text(score_x_pos, 180, string(round(obj_car.player_score)))
	//Draw Low hp warning
	if global.health < lowHP and playerLowHp == false and global.gameover == false{
		draw_set_color(c_red)
		draw_set_font(f_vhs_medium)
		draw_text(525, 1250, "YOU ARE BADLY DAMAGED, LOOK FOR REPAIR SHOP")
		if alarmSet == false {
			alarmSet = true
			alarm[6] = 5 * room_speed
		}
	}
	draw_sprite(s_dollar_bill_ui, 1, 2460, 150)
	draw_set_font(f_vhs)
	if(global.not_enough_money){
		global.not_enough_money = false
		draw_set_color(c_red) 
		alarm[2] = room_speed * obj_car.money_timer
	} else {
		draw_set_color(c_lime)
	}
	draw_text(2400, 200, "$" + string(global.current_dollars))
	
} else {
	draw_clear(c_green)	
}
