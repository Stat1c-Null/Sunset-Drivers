var lay = layer_create(-9999, "transition")//create transition above everything else -9999 depth
seq = layer_sequence_create(lay, room_width , global.last_y , sq_vig_fade_out)
layer_sequence_play(seq)
//UNCOMMENT SO THE VIGNETTE WILL STOP PULSING
//alarm[0] = 35
