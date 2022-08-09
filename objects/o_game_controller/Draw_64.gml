


//Game over GUI
if(global.wasted) {
	draw_set_font(f_vhs_big)
	if(TextColor == false){
		draw_set_color(c_olive)
		draw_text(win_width/2-250, 200, "WASTED")
	} else {
		draw_set_color(c_orange)
		draw_text(win_width/2-250, 200, "WASTED")	
	}
} else if(global.busted) {
	draw_set_font(f_vhs_big)
	if(TextColor == false){
		draw_set_color(c_aqua)
		draw_text(win_width/2-250, 200, "BUSTED")
	} else {
		draw_set_color(c_red)
		draw_text(win_width/2-250, 200, "BUSTED")	
	}
}

if (global.gameover){
	draw_set_font(f_vhs_medium)
	//Draw final score
	draw_set_color(c_yellow)
	draw_sprite(s_speedometer_half_smol, 1, win_width/2-380, 480)
	draw_text(win_width/2-280, 450, "FINAL SCORE-" + string(round(global.final_score)))
	//Draw final money
	draw_set_color(c_lime)
	draw_sprite(s_dollar_bill_ui, 1, win_width/2-380, 590)
	draw_text(win_width/2-280, 550, "MONEY SAVED-$" + string(global.final_money))
	//Draw final time
	draw_set_color(c_fuchsia)
	draw_sprite(s_clockUI, 1, win_width/2-380, 690)
	if(global.final_seconds < 10)
		draw_text(win_width/2-280, 650, "TIME SURVIVED-" + string(global.final_minutes) + ":0" + string(round(global.final_seconds)))
	else
		draw_text(win_width/2-280, 650, "TIME SURVIVED-" + string(global.final_minutes) + ":" + string(round(global.final_seconds)))
}

/// DRAW GAME GUI
//VHS PLAY
draw_set_color(c_ltgray)
draw_set_font(f_vhs)
draw_text(100, 100, "PLAY >")
draw_text(100, 1230, "SP")
//Draw Time Clock
draw_set_color(c_ltgray)
draw_text(1600, 1000, string(global.army_time))
draw_text(1600, 1060, "MAR.0" + string(global.day) + ".1997")
draw_text(1600, 1060, "MAR.0" + string(global.day) + ".1997")
//Draw Police Timer
draw_text(100, 1000, "Distance to Police: ")
draw_set_color(c_fuchsia)
draw_text(550, 1000, string(floor(global.final_dist)) + " feet")