//Car Direction
hor = false
rightLane = false
leftLane = false
turning = false
layer_id = layer_get_name(layer)//Find which layer this object is on 
if(layer_id == "RightLane"){
	hor = false
	decider = -70
	direc = -90
	rightLane = true
	leftLane = false
}else if(layer_id == "LeftLane"){
	hor = false
	decider = 70
	direc = 90
	rightLane = false
	leftLane = true
}else if(layer_id == "RightLaneHor"){
	hor = true
	decider = -70
	direc = -180
	rightLane = true
	leftLane = false
}
else if(layer_id == "LeftLaneHor"){
	hor = true
	decider = 70
	direc = 0
	rightLane = false
	leftLane = true
}
//Car movement
speed_var = choose(0.85, 0.8, 0.75, 0.7, 0.65) 
hit = false
hp = 7
collision_damage = 15
current_speed = 0//Physics speed
brake_power = 0.6
max_speed = choose(10, 12, 14, 16, 18, 20, 22, 24, 26)
speed_previous = 0
angular_speed_previous = 0
hit_reset = false
hit_time = 2//Time before another hit will give damage

//Randomly choose sprite for car
sprites = [s_opel, s_zaporozech, s_bluecar, s_devyatka, s_volga, s_volga2, s_volga3, s_aston, s_bugatti, s_bugatti, s_challenger, s_corvett, s_ferrari, s_lambo, s_mclaren, s_audir8, s_merse, s_porshe, s_sportcar, s_jaguar,s_jaguar2, s_jaguar3, s_supra, s_astonMartin2, s_bmw, s_buggatti2, s_cabrioletPorshe, s_cabrioletPorsche2, s_futuristicCar, s_modernLambo, s_oldMclaren, s_scificar, s_fordGT, s_oldCar, s_oldFerrari, s_oldMers, s_oldPorshe, s_veryOldBens]
amount = array_length(sprites)
sprite_choice = random_range(0, amount - 1)
final = round(sprite_choice)
sprite_index = sprites[final]