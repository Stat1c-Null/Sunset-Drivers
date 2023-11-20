draw_set_font(f_vhs)
draw_set_color(c_lime)
if (o_game_controller.gas_lvl < o_game_controller.max_gas_lvl)
	draw_text(x - 60, y + 30, "$" + string(o_game_controller.gas_prices[o_game_controller.gas_lvl + 1]))
else
	draw_text(x - 60, y + 30,"MAX")