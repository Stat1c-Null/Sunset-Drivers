friction_strength = 6
acceleration_speed = 0.7
center_to_front = 40

richting = 0

//Gas gas gas
global.maxAmount = 100
global.gasAmount = global.maxAmount
global.maxSpeed = 285
gasConsume = random_range(0.5, 1.5)
//Score
player_score = 0
min_speed = 15
good_speed = 35
inc_speed = 0

//Keys

var key_left = keyboard_check(ord("A"))
var key_right = keyboard_check(ord("D"))
gamepad_RT = gamepad_button_check(0, gp_shoulderrb)
gamepad_LT = gamepad_button_check(0, gp_shoulderlb)
gamepad_LS = gamepad_button_check(0, gp_shoulderl)//Handbrake

if not key_left {
    if richting > 0 {richting -= 3}} 
    
if not key_right {
    if richting < 0 {richting += 3}} 
    
if not key_left and not key_right {
    if abs(richting) < 3 {richting = 0}}
	

    
Vvoorx = 0
Xvoor = x+lengthdir_x(center_to_front,-phy_rotation)
Xvooroud = Xvoor
Vvoory = 0
Yvoor = y+lengthdir_y(center_to_front,-phy_rotation)
Yvooroud = Yvoor
Lvoor = 0
Dvoor = 0
Vvoorh = 0

Vachterx = 0
Xachter = x+lengthdir_x(-center_to_front,-phy_rotation)
Xachteroud = Xachter
Vachtery = 0
Yachter = y+lengthdir_y(-center_to_front,-phy_rotation)
Yachteroud = Yachter
Lachter = 0
Dachter = 0
Vachterh = 0

Vvoorx = Xvoor - Xvooroud
Xvooroud = Xvoor

Vvoory = Yvoor - Yvooroud
Yvooroud = Yvoor

Vachterx = Xachter - Xachteroud
Xachteroud = Xachter

Vachtery = Yachter - Yachteroud
Yachteroud = Yachter

previd[1] = 0
previd[2] = 0
previd[3] = 0
previd[4] = 0

controller = 0//Detect if controller is connected




