draw_set_font(f_vhs)
draw_set_color(c_purple)
draw_text(x - 60, y - 120, "UNITS")
if(o_game_controller.range_units == "metric") {
	draw_text(x - 90, y - 50, "METRIC")
} else {
	draw_text(x - 90, y - 50, "IMPERIAL")	
}
draw_set_font(f_vhs_big_MENU)
draw_text(x - 120, y - 250, "GAME")