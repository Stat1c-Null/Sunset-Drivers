draw_set_font(f_vhs_big)
draw_set_color(c_fuchsia)
draw_text(x - 400, y - 420, "Statistics")
draw_set_font(f_vhs)
draw_set_color(c_aqua)
draw_text(x - 420,y - 280, "Cash Earned: ")

draw_text(x - 420,y - 220, "Jobs done: ")

draw_text(x - 420,y - 160, "Streets driven: ")

draw_text(x - 420,y - 100, "Cops destroyed: ")

draw_text(x - 420,y - 40, "People's days ruined: ")

draw_text(x - 420,y + 20, "Props annihilated:  ")

draw_text(x - 420,y + 80, "Bullets fired:  ")

draw_text(x - 420,y + 140, "Gas used:  ")

draw_text(x - 420,y + 200, "Money spent:  ")

draw_text(x - 420,y + 260, "Biggest score:  ")
draw_set_color(c_fuchsia)
draw_text(x + 280,y + 260, "$" + string(global.money_highscore))


