
//Gas Gas Gas i am gonna step on the gas tonight we'll fly
draw_sprite_ext(GasUI, 1, 146, 130, max(0, global.gasAmount/global.maxAmount), 1, 0, c_white, 1)
draw_sprite(UIBack, 1, 100, 130)

//Condition
draw_sprite_ext(s_condition_front, 1, 2286, 130, max(0, global.health/global.maxHealth), 1, 0, c_white, 1)
draw_sprite(s_condition_back, 1, 2240, 130)

//Speeeeeed
//draw_text(100, 300, "Speed: " + string(speed))
//Score
draw_set_font(f_debug)
draw_set_color(c_yellow)
draw_text(1217, 100, "SCORE")
draw_text(1215, 105, "_____")
draw_set_color(c_orange)
draw_text(score_y_pos, 180, string(round(player_score)))
draw_sprite(s_dollar_bill_ui, 1, 100, 425)
if(global.not_enough_money){
	global.not_enough_money = false
	draw_set_color(c_red)
	alarm[2] = room_speed * money_timer
} else {
	draw_set_color(c_lime)
}
draw_text(200, 400, "$" + string(global.dollars))
draw_text(200, 500, "Time " + string(global.time))
