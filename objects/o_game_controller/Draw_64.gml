
if(global.wasted) {
	draw_set_font(f_vhs_big)
	draw_set_color(c_red)
	draw_text(win_width/2-170, 200, "WASTED")
	draw_sprite(s_vignett,1, room_width/2, 600)
} else if(global.busted) {
	draw_set_font(f_vhs_big)
	draw_set_color(c_maroon)
	draw_text(win_width/2-170, 200, "BUSTED")	
	draw_sprite(s_vignett,1, room_width/2, 600)
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
