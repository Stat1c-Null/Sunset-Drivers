draw_set_font(f_vhs)
draw_set_color(c_lime)
draw_text(1440,580, "Cash: $" + string(global.dollars))
draw_set_color(c_fuchsia)
draw_set_font(f_vhs_medium)
draw_text(1320, 650, "SPEED:" + string(o_game_controller.speed_lvl))
draw_text(1320, 750, "GAS:" + string(o_game_controller.gas_lvl))
draw_text(1320, 850, "HEALTH:" + string(o_game_controller.health_lvl))