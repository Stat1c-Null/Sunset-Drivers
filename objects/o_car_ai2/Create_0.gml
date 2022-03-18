//Car Direction
layer_id = layer_get_name(layer)//Find which layer this object is on 
if(layer_id == "RightLane"){
	decider = -70
	direc = -90
}else if(layer_id == "LeftLane"){
	decider = 70
	direc = 90
}
//Car movement
speed_var = choose(0.1, 0.2, 0.3, 0.4, 0.5) 
hit = false
hp = 3
collision_damage = 20
speed_previous = 0
angular_speed_previous = 0

//Randomly choose sprite for car
sprites = [s_opel, s_zaporozech, s_bluecar, s_devyatka, s_volga, s_volga2, s_volga3, s_aston, s_bugatti, s_bugatti, s_challenger, s_corvett, s_ferrari, s_lambo, s_mclaren, s_audir8, s_merse, s_porshe, s_sportcar, s_jaguar,s_jaguar2, s_jaguar3, s_supra]
amount = array_length(sprites)
sprite_choice = random_range(0, amount - 1)
final = round(sprite_choice)
sprite_index = sprites[final]