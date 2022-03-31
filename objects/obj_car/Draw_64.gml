/// Draw player gui
//VHS PLAY
draw_set_color(c_ltgray)
draw_set_font(f_vhs)
draw_text(60, 100, "PLAY >")
draw_text(60, 1230, "SP")

//Gas Gas Gas i am gonna step on the gas tonight we'll fly
draw_sprite_ext(GasUI, 1, 146, 200, max(0, global.gasAmount/global.maxAmount), 1, 0, c_white, 1)
draw_sprite(UIBack, 1, 100, 200)

//Condition
draw_sprite_ext(s_condition_front, 1, 2286, 200, max(0, global.health/global.maxHealth), 1, 0, c_white, 1)
draw_sprite(s_condition_back, 1, 2240, 200)

//Speeeeeed
draw_text(100, 500, "Speed: " + string(phy_speed))
draw_text(100, 550, "MPH: " + string(round(global.mphSpeed)))
//Score
//draw_set_font(f_debug)
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
//Draw Time Clock
draw_set_color(c_ltgray)
draw_text(2240, 1200, string(global.army_time))
draw_text(2150, 1260, "MAR.0" + string(global.day) + ".2007")
