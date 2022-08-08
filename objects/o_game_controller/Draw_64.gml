


//Game over GUI
if(global.wasted) {
	draw_set_font(f_vhs_big)
	if(TextColor == false){
		draw_set_color(c_olive)
		draw_text(win_width/2-250, 330, "WASTED")
	} else {
		draw_set_color(c_orange)
		draw_text(win_width/2-250, 330, "WASTED")	
	}
} else if(global.busted) {
	draw_set_font(f_vhs_big)
	if(TextColor == false){
		draw_set_color(c_aqua)
		draw_text(win_width/2-250, 330, "BUSTED")
	} else {
		draw_set_color(c_red)
		draw_text(win_width/2-250, 330, "BUSTED")	
	}
}

/// DRAW PLAYER GUI
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
