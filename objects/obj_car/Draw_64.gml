
//Gas Gas Gas i am gonna step on the gas tonight we'll fly
draw_sprite_ext(GasUI, 1, 146, 100, max(0, global.gasAmount/global.maxAmount), 1, 0, c_white, 1)
draw_sprite(UIBack, 1, 100, 100)

//Condition
draw_sprite_ext(s_condition_front, 1, 2286, 100, max(0, global.health/global.maxHealth), 1, 0, c_white, 1)
draw_sprite(s_condition_back, 1, 2240, 100)

//Speeeeeed
//draw_text(100, 300, "Speed: " + string(speed))
//Score
draw_set_font(f_debug)
draw_set_color(c_black)
draw_text(100, 300, "Score: " + string(round(player_score)))