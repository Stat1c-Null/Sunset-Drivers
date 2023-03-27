//Update physics speed
convert_speed(phy_speed)
global.phySpeed = phy_speed

//Keys
Controls()

//Sprites switching
if(key_forward and !key_left and !key_right and !destroyed) {
	image_index = 0	
	reverse_count = 0
	turn_left = false
	turn_right = false
	global.reverse = false
} else if(key_brake and reverse_count < reverse_detect and !destroyed) {
	image_index = 1	
	reverse_count += reverse_mult
} else if(key_brake and reverse_count >= reverse_detect and !destroyed){
	image_index = 2
	global.reverse = true
	global.gear = "R"
} else if(!key_forward and !key_left and !key_right and !key_brake and !destroyed) {
	turn_left = false
	turn_right = false
	reverse_count = 0
	global.reverse = false
	image_index = 0	
}

//Reset camera shake collision vars
if(not place_meeting(x, y, o_staticParent) or not place_meeting(x, y, obj_parent_physics)) {
	o_camera.collisionWithDynamic = false
	o_camera.collisionWithStatic = false
	o_camera.cameraShaking = false
	o_camera.cameraAlarmOn = false
}

//Switch score position depending on number of numbers
calculate_score(player_score)

//Calculate speedometer
arrow_rot = 360 - global.mphSpeed

//Movement
Vvoorx = Xvoor - Xvooroud
Xvooroud = Xvoor

Vvoory = Yvoor - Yvooroud
Yvooroud = Yvoor

Vachterx = Xachter - Xachteroud
Xachteroud = Xachter

Vachtery = Yachter - Yachteroud
Yachteroud = Yachter

//GAS CONSUMPTION VARIABLES
gasConsume = random_range(0.01, 0.06)
backGasConsume = random_range(0.01, 0.03)

if(global.gasAmount > 0 and o_pause_menu.pause == false) {
	//Reduce gas when car is just standing
	if(!key_forward and !key_brake)
	{
		global.gasAmount -= standing_consume
	}
	//Drive forward
	if ((key_forward or gamepad_RT) and !destroyed) {
		global.gasAmount -= gasConsume
		inc_speed += 0.1
		phy_speed_x += lengthdir_x(acceleration_speed,-phy_rotation)
		phy_speed_y += lengthdir_y(acceleration_speed,-phy_rotation)
	} else {
		inc_speed -= 0.3
	}
	
	//Stop
	if ((key_brake or gamepad_LT) and !destroyed) {
		global.gasAmount -= backGasConsume
		inc_speed -= 0.2
		phy_speed_x += lengthdir_x(-acceleration_speed/1.7,-phy_rotation)
		phy_speed_y += lengthdir_y(-acceleration_speed/1.7,-phy_rotation)
	}
}

if(global.gasAmount < 0 and global.final_dist < bust_dist) { 
	global.busted = true	
}

//Deactivate physics if the game is paused
if o_pause_menu.pause == true {
	phy_active = false
} else {
	phy_active = true	
}

//Reduce score if player's speed is not high enough
if(o_pause_menu.pause == false) {
	if(global.mphSpeed > speeds[0]) {
		player_score += 0.5
	} else if(global.mphSpeed > speeds[1]) {
		player_score += 1	
	}  else if(global.mphSpeed > speeds[2]) {
		player_score += 1.5
	} else if(global.mphSpeed > speeds[3]) {
		player_score += 2
	} else if(global.mphSpeed > speeds[4]) {
		player_score += 2.5
	} 
}

//Handbrake Drift
if((key_handbrake or gamepad_LS) and !destroyed){
	turn_multi = 8
	//turn_limit = 15
	phy_speed_x += lengthdir_x(-acceleration_speed/6,-phy_rotation)
	phy_speed_y += lengthdir_y(-acceleration_speed/6,-phy_rotation)
} else {
	turn_multi = 2
	turn_limit = 45
}

//Work with hand brake
//Turning
if (key_left) {
if richting < turn_limit {richting += turn_multi}
if richting > turn_limit {richting = turn_limit}}

if (key_right) {
if richting > -turn_limit {richting -= turn_multi}
if richting < -turn_limit {richting = -turn_limit}}


if not key_left {
	if richting > 0 {richting += angle_difference(0,richting)/turn_multi}}

if not key_right {
	if richting < 0 {richting += angle_difference(0,richting)/turn_multi}}

if not key_left and not key_right {
	if abs(richting) <= turn_multi {richting = 0}}

//As player loses health, his screen will turn more and more gray
fx_set_parameter(blackwhiteFilter, "g_Intensity", (global.maxHealth - global.health) * 0.01)
layer_set_fx("DeathFilter", blackwhiteFilter)
//If player gains his hp back set variable back to true
if global.health > lowHP and playerLowHp == true {
	playerLowHp = false	
}

//Wasted
if(global.health <= 0 and global.final_dist < bust_dist)
{
	global.busted = true	
}else if(global.health <= 0 and global.final_dist > bust_dist) {
	global.wasted = true
}
	
//Destroy car if there is no health
if(global.health <= 0 or global.busted == true)
{
	//Black and white filter for game ove
	fx_set_parameter(blackwhiteFilter, "g_Intensity", 1)
	layer_set_fx("DeathFilter", blackwhiteFilter)
	destroyed = true
	turn_left = false
	turn_right = false
	phy_speed_x = 0
	phy_speed_y = 0
	//Create copy of car so old GUI will get destroyed
	with(instance_create_layer(x, y, "Player", o_busted_car)) {	
		phy_rotation = obj_car.phy_rotation
	}
	instance_destroy(self)
}

//Car Physics
Xvoor = x+lengthdir_x(center_to_front,-phy_rotation)
Yvoor = y+lengthdir_y(center_to_front,-phy_rotation)

Lvoor = sqrt(sqr(Vvoorx) + sqr(Vvoory))

if abs(angle_difference(-phy_rotation + richting + 90, point_direction(0,0,Vvoorx,Vvoory))) < 90 {
Dvoor = angle_difference(-phy_rotation + richting + 90, point_direction(0,0,Vvoorx,Vvoory))}

if abs(angle_difference((-phy_rotation + richting + 90)+180, point_direction(0,0,Vvoorx,Vvoory))) < 90 {
Dvoor = angle_difference((-phy_rotation + richting + 90)+180, point_direction(0,0,Vvoorx,Vvoory))}

Vvoorh = cos((Dvoor/180)*pi)*Lvoor 

if abs(Vvoorh) > 0 {
	physics_apply_force(Xvoor,Yvoor,lengthdir_x(-Vvoorh*friction_strength,point_direction(0,0,Vvoorx,Vvoory) + Dvoor),lengthdir_y(-Vvoorh*friction_strength,point_direction(0,0,Vvoorx,Vvoory) + Dvoor))

	if abs(Vvoorh) > 5 {
		
		i = instance_create_layer(Xvoor+lengthdir_x(center_to_front/2-center_to_front/10,-phy_rotation+90),Yvoor+lengthdir_y(center_to_front/2-center_to_front/10,-phy_rotation+90),"UnderPlayer",obj_skid_mark)
		i.image_alpha = Vvoorh/60
		i.previd = previd[1]
		previd[1] = i
		alarm[0] = 2
	
		i = instance_create_layer(Xvoor+lengthdir_x(center_to_front/2-center_to_front/10,-phy_rotation-90),Yvoor+lengthdir_y(center_to_front/2-center_to_front/10,-phy_rotation-90),"UnderPlayer",obj_skid_mark)
		i.image_alpha = Vvoorh/60
		i.previd = previd[2]
		previd[2] = i
		alarm[0] = 2
	}
	
	if abs(Vvoorh) > 8 {
		//Create tire smoke
		part_particles_create(global.partSystemCar,Xvoor+lengthdir_x(center_to_front/2-center_to_front/10,-phy_rotation+90),Yvoor+lengthdir_y(center_to_front/2-center_to_front/10,-phy_rotation+90), global.ptSmoke, 2)
		part_particles_create(global.partSystemCar, Xvoor+lengthdir_x(center_to_front/2-center_to_front/10,-phy_rotation-90),Yvoor+lengthdir_y(center_to_front/2-center_to_front/10,-phy_rotation-90), global.ptSmoke, 2)
	}
}



Xachter = x+lengthdir_x(-center_to_front,-phy_rotation)
Yachter = y+lengthdir_y(-center_to_front,-phy_rotation)

Lachter = sqrt(sqr(Vachterx) + sqr(Vachtery))

if abs(angle_difference(-phy_rotation + 90, point_direction(0,0,Vachterx,Vachtery))) < 90 {
Dachter = angle_difference(-phy_rotation + 90, point_direction(0,0,Vachterx,Vachtery))}

if abs(angle_difference((-phy_rotation + 90)+180, point_direction(0,0,Vachterx,Vachtery))) < 90 {
Dachter = angle_difference((-phy_rotation + 90)+180, point_direction(0,0,Vachterx,Vachtery))}

Vachterh = cos((Dachter/180)*pi)*Lachter 

if abs(Vachterh) > 0 {
	physics_apply_force(Xachter,Yachter,lengthdir_x(-Vachterh*friction_strength,point_direction(0,0,Vachterx,Vachtery) + Dachter),lengthdir_y(-Vachterh*friction_strength,point_direction(0,0,Vachterx,Vachtery) + Dachter))

	if abs(Vachterh) > 3 {
		i = instance_create(Xachter+lengthdir_x(20,-phy_rotation)+lengthdir_x(center_to_front/2-center_to_front/10,-phy_rotation+90),Yachter+lengthdir_y(20,-phy_rotation)+lengthdir_y(center_to_front/2-center_to_front/10,-phy_rotation+90),obj_skid_mark)
		i.image_alpha = Vachterh/60
		i.previd = previd[3]
		previd[3] = i
		alarm[0] = 2
		i = instance_create(Xachter+lengthdir_x(20,-phy_rotation)+lengthdir_x(center_to_front/2-center_to_front/10,-phy_rotation-90),Yachter+lengthdir_y(20,-phy_rotation)+lengthdir_y(center_to_front/2-center_to_front/10,-phy_rotation-90),obj_skid_mark)
		i.image_alpha = Vachterh/60
		i.previd = previd[4]
		previd[4] = i
		alarm[0] = 2
	}
}

