/// DRAW PLAYER GUI
//VHS PLAY
draw_set_color(c_ltgray)
draw_set_font(f_vhs)
draw_text(100, 100, "PLAY >")
draw_text(100, 1230, "SP")

//Gas Gas Gas i am gonna step on the gas tonight we'll fly
draw_sprite_ext(GasUI, 1, 146, 200, max(0, global.gasAmount/global.maxAmount), 1, 0, c_white, 1)
draw_sprite(UIBack, 1, 100, 200)

//Condition
draw_sprite_ext(s_condition_front, 1, 1656, 200, max(0, global.health/global.maxHealth), 1, 0, c_white, 1)
draw_sprite(s_condition_back, 1, 1610, 200)

//Speeeeeed
draw_text(1600, 400, "MPH: " + string(round(global.mphSpeed)) + "/" + string(round(global.phySpeed)))
//Score
//draw_set_font(f_debug)
draw_set_color(c_yellow)
draw_text(907, 100, "SCORE")
draw_text(905, 105, "_____")
draw_set_color(c_orange)
calculate_score(obj_car.player_score, obj_car.score_y_pos)
draw_text(930, 180, string(round(obj_car.player_score)))
draw_sprite(s_dollar_bill_ui, 1, 160, 425)
if(global.not_enough_money){
	global.not_enough_money = false
	draw_set_color(c_red)
	alarm[2] = room_speed * obj_car.money_timer
} else {
	draw_set_color(c_lime)
}
draw_text(260, 400, "$" + string(global.dollars))
//Draw Time Clock
draw_set_color(c_ltgray)
draw_text(1600, 1000, string(global.army_time))
draw_text(1600, 1060, "MAR.0" + string(global.day) + ".1997")
draw_text(1600, 1060, "MAR.0" + string(global.day) + ".1997")
//Draw Police Timer
draw_text(100,1000, "Police Arrives")
draw_text(100, 1060, "in " + string(floor(global.timer)) + " seconds")
