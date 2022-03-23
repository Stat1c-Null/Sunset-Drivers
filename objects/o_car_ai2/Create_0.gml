//Car Direction
hor = false
layer_id = layer_get_name(layer)//Find which layer this object is on 
if(layer_id == "RightLane"){
	hor = false
	decider = -70
	direc = -90
}else if(layer_id == "LeftLane"){
	hor = false
	decider = 70
	direc = 90
}else if(layer_id == "RightLaneHor"){
	hor = true
	decider = -70
	direc = -180
}
else if(layer_id == "LeftLaneHor"){
	hor = true
	decider = 70
	direc = 0
}
//Car movement
speed_var = choose(0.7, 0.45, 0.6, 0.4, 0.5, 0.55, 0.65) 
hit = false
hp = 3
collision_damage = 20
speed_previous = 0
angular_speed_previous = 0
show_debug_message(speed_var)
//Randomly choose sprite for car
sprites = [s_opel, s_zaporozech, s_bluecar, s_devyatka, s_volga, s_volga2, s_volga3, s_aston, s_bugatti, s_bugatti, s_challenger, s_corvett, s_ferrari, s_lambo, s_mclaren, s_audir8, s_merse, s_porshe, s_sportcar, s_jaguar,s_jaguar2, s_jaguar3, s_supra, s_astonMartin2, s_bmw, s_buggatti2, s_cabrioletPorshe, s_cabrioletPorsche2, s_futuristicCar, s_modernLambo, s_oldMclaren, s_scificar, s_fordGT, s_oldCar, s_oldFerrari, s_oldMers, s_oldPorshe, s_veryOldBens]
amount = array_length(sprites)
sprite_choice = random_range(0, amount - 1)
final = round(sprite_choice)
sprite_index = sprites[final]