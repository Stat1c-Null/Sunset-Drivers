draw_set_font(f_vhs)
draw_set_color(c_lime)
if (o_game_controller.speed_lvl < o_game_controller.max_speed_lvl)
	draw_text(x - 60, y + 30, "$" + string(o_game_controller.speed_prices[o_game_controller.speed_lvl + 1]))
else 
	draw_text(x - 60, y + 30,"MAX")