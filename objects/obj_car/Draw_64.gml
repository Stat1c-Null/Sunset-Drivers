//Gas Gas Gas i am gonna step on the gas tonight we'll fly

draw_sprite_ext(GasUI, 1, 146, 100, max(0, global.gasAmount/global.maxAmount), 1, 0, c_white, 1)
draw_sprite(UIBack, 1, 100, 100)

//Speeeeeed
draw_text(100, 300, "Speed: " + string(speed))