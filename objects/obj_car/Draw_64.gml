///@description DRAW HUD
//Draw text unless player is busted
if(global.busted == false and global.wasted == false) {
	//Gas Gas Gas i am gonna step on the gas tonight we'll fly
	draw_sprite_ext(GasUI, 1, 146, 200, max(0, global.gasAmount/global.maxAmount), 1, 0, c_white, 1)
	draw_sprite(UIBack, 1, 100, 200)

	//Condition
	draw_sprite_ext(s_condition_front, 1, 1656, 200, max(0, global.health/global.maxHealth), 1, 0, c_white, 1)
	draw_sprite(s_condition_back, 1, 1610, 200)

	//Speeeeeed
	draw_sprite(s_speedometer, 1, 1710, 500)
	draw_sprite_ext(s_speed_arrow, 1, 1710, 500, image_xscale, image_yscale, arrow_rot, image_blend, image_alpha)
	draw_set_color(c_green)
	draw_text(1750, 630, round(global.mphSpeed))
	draw_set_color(c_red)
	draw_text(1775, 585, global.gear)
	draw_sprite(s_gear_m, 1,1855, 630)
	//Score
	draw_set_color(c_yellow)
	draw_text(907, 100, "SCORE")
	draw_text(905, 105, "_____")
	draw_set_color(c_orange)
	//calculate_score(obj_car.player_score, obj_car.score_x_pos)
	draw_text(score_x_pos, 180, string(round(obj_car.player_score)))
	draw_sprite(s_dollar_bill_ui, 1, 160, 425)
	if(global.not_enough_money){
		global.not_enough_money = false
		draw_set_color(c_red) 
		alarm[2] = room_speed * obj_car.money_timer
	} else {
		draw_set_color(c_lime)
	}
	draw_text(260, 400, "$" + string(global.dollars))
} else {
	draw_clear(c_green)	
}
