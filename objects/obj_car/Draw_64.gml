///@description DRAW HUD
//Draw text unless player is busted
if(global.busted == false and global.wasted == false) {
	//Gas Gas Gas i am gonna step on the gas tonight we'll fly
	draw_sprite_ext(s_VerticalGasUI, 1, 170, 880, 1, max(0, global.gasAmount/global.maxAmount), 0, c_white, 1)
	draw_sprite(s_VerticalGasUIBorder, 1, 170, 900)
	//Speeeeeed
	draw_sprite(s_speedometer, 1, 2390, 600)
	draw_sprite_ext(s_speed_arrow, 1, 2390, 600, image_xscale, image_yscale, arrow_rot, image_blend, image_alpha)
	draw_set_color(c_green)
	draw_text(2435, 735, round(global.mphSpeed))
	draw_set_color(c_red)
	draw_text(2435, 690, global.gear)
	draw_sprite(s_gear_m, 1,2515, 735)
	//Score
	draw_set_color(c_yellow)
	draw_text(1227, 100, "SCORE")
	draw_text(1220, 115, "______")
	draw_set_color(c_orange)
	//calculate_score(obj_car.player_score, obj_car.score_x_pos)
	//put score_x_pos instead of 1220
	draw_text(score_x_pos, 180, string(round(obj_car.player_score)))
	draw_sprite(s_dollar_bill_ui, 1, 2460, 150)
	if(global.not_enough_money){
		global.not_enough_money = false
		draw_set_color(c_red) 
		alarm[2] = room_speed * obj_car.money_timer
	} else {
		draw_set_color(c_lime)
	}
	draw_text(2400, 200, "$" + string(global.dollars))
} else {
	draw_clear(c_green)	
}
