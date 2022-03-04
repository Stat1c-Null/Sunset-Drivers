//Keys
var key_forward = keyboard_check(ord("W")) or keyboard_check(vk_up)
var key_brake = keyboard_check(ord("S")) or keyboard_check(vk_down)
var key_left = keyboard_check(ord("A")) or keyboard_check(vk_left)
var key_right = keyboard_check(ord("D")) or keyboard_check(vk_right)
var key_handbrake = keyboard_check(vk_space)

//Gamepad gas and break
if(gamepad_is_connected(0)){
	//Do actions with controller
	gamepad_RT = gamepad_button_check(0, gp_shoulderrb)//Gas
	gamepad_LT = gamepad_button_check(0, gp_shoulderlb)//Brake
	gamepad_LS = gamepad_button_check(0, gp_shoulderl)//Handbrake
}
//Sprites switching
if(key_forward and !key_left and !key_right and !destroyed) {
	image_index = 0	
	reverse_count = 0
	turn_left = false
	turn_right = false
} else if(key_brake and reverse_count < reverse_detect and !destroyed) {
	image_index = 1	
	reverse_count += reverse_mult
} else if(key_brake and reverse_count >= reverse_detect and !destroyed){
	image_index = 2
} else if(!key_forward and !key_left and !key_right and !key_brake and !destroyed) {
	turn_left = false
	turn_right = false
	reverse_count = 0
	image_index = 0	
}


//Movement
Vvoorx = Xvoor - Xvooroud
Xvooroud = Xvoor

Vvoory = Yvoor - Yvooroud
Yvooroud = Yvoor

Vachterx = Xachter - Xachteroud
Xachteroud = Xachter

Vachtery = Yachter - Yachteroud
Yachteroud = Yachter

gasConsume = random_range(0.01, 0.08)
backGasConsume = random_range(0.01, 0.04)

if(global.gasAmount > 0) {

	//Drive forward
	if ((key_forward or gamepad_RT) and !destroyed) {
	global.gasAmount -= gasConsume
	inc_speed += 0.1
	phy_speed_x += lengthdir_x(acceleration_speed,-phy_rotation)
	phy_speed_y += lengthdir_y(acceleration_speed,-phy_rotation)} else {
		inc_speed -= 0.3
	}
	
	//Stop
	if ((key_brake or gamepad_LT) and !destroyed) {
	global.gasAmount -= backGasConsume
	inc_speed -= 0.2
	phy_speed_x += lengthdir_x(-acceleration_speed/2,-phy_rotation)
	phy_speed_y += lengthdir_y(-acceleration_speed/2,-phy_rotation)} 
	//show_debug_message(inc_speed)
}
//Reduce score if player's speed is not high enough
if(inc_speed > min_speed) {
	player_score += 0.3	
} else if(inc_speed > good_speed) {
	player_score += 0.6	
}

if(inc_speed > 60) {
	inc_speed = 60
}
else if(inc_speed <= 0) {
	inc_speed = 0	
}

//Handbrake Drift
if((key_handbrake or gamepad_LS) and !destroyed){
	phy_speed_x += lengthdir_x(-acceleration_speed/4,-phy_rotation)
	phy_speed_y += lengthdir_y(-acceleration_speed/4,-phy_rotation)
}

//Turning
if (key_left) {
if richting < 45 {richting += turn_multi}
if richting > 45 {richting = 45}}

if (key_right) {
if richting > -45 {richting -= turn_multi}
if richting < -45 {richting = -45}}


if not key_left {
	if richting > 0 {richting += angle_difference(0,richting)/turn_multi}}

if not key_right {
	if richting < 0 {richting += angle_difference(0,richting)/turn_multi}}

if not key_left and not key_right {
	if abs(richting) <= turn_multi {richting = 0}}
	
//Destroy car if there is no health
if(global.health <= 0)
{
	destroyed = true
	turn_left = false
	turn_right = false
	if(alarm[1] == 0) {
		alarm[1] = signal_timer * room_speed
	}
	phy_speed_x = 0
	phy_speed_y = 0
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

if abs(Vvoorh) > 3 {
i = instance_create(Xvoor+lengthdir_x(center_to_front/2-center_to_front/10,-phy_rotation+90),Yvoor+lengthdir_y(center_to_front/2-center_to_front/10,-phy_rotation+90),obj_skid_mark)
i.image_alpha = Vvoorh/60
i.previd = previd[1]
previd[1] = i
alarm[0] = 2
i = instance_create(Xvoor+lengthdir_x(center_to_front/2-center_to_front/10,-phy_rotation-90),Yvoor+lengthdir_y(center_to_front/2-center_to_front/10,-phy_rotation-90),obj_skid_mark)
i.image_alpha = Vvoorh/60
i.previd = previd[2]
previd[2] = i
alarm[0] = 2}
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
alarm[0] = 2}
}

