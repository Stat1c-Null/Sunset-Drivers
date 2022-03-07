//Car Direction
if(y < 9000){
	decider = 1	//Down	
} else {
	decider = -1//Up
}


//Car movement
speed_var = choose(8, 9, 10, 11, 12, 13, 14) 
speed = speed_var * decider

//Randomly choose sprite for car
sprites = [s_opel, s_zaporozech, s_bluecar, s_civcar, s_devyatka, s_volga, s_volga2, spr_car, s_aston, s_bugatti, s_bugatti2, s_challenger, s_corvett, s_ferrari, s_lambo, s_lambo2, s_lambo3, s_merse, s_porshe, s_sportcar, s_sportcar2, s_sportcar3, s_supra]
amount = array_length(sprites)
sprite_choice = random_range(0, amount - 1)
final = round(sprite_choice)
sprite_index = sprites[final]