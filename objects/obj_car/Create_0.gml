//Clear effects

friction_strength = 6
acceleration_speed = 0.4
center_to_front = 45//Number of pixels from your cars center to it's front wheels

richting = 0

phy_rotation = 270
image_index = 0
global.teleport_collision = false //Turn on when colliding with teleport so skid mark will get destroyed
//Turn signal timer
signal_timer = 0.35
turn_left = false
turn_right = false
destroyed = false
//Reverse
reverse_count = 0
reverse_detect = 13
reverse_mult = 0.3
global.reverse = false//Determine whether player is reversing right now or no
turn_multi = 2
turn_limit = 60
//Time
global.time = 0.00//What time in the world is it
global.army_time = "AM 12:00"
global.night = false
global.day = 1
global.minutes_survived = 0
global.seconds_survived = 0
alarm[3] = 1 * room_speed
//Gas gas gas
global.maxAmount = 100
global.gasAmount = global.maxAmount
gasFrame = 0
global.mphSpeed = 0
global.phySpeed = 0
global.gear = 1
//Condition
global.maxHealth = 100
global.health = global.maxHealth
//Black and white filter for health. The lower the health the greater the fitler 
blackwhiteFilter = fx_create("_filter_greyscale")
fx_set_parameter(blackwhiteFilter, "g_Intensity", 0)
layer_set_fx("DeathFilter", blackwhiteFilter)
standing_consume = 0.02
//Score
player_score = 0
score_x_pos = 1270//Score position on the screen, it changes depending on how big score is
speeds = [10, 30, 50, 70, 90]//Different speeds depending on which score will increase. The faster the speed bigger your pen.... score
inc_speed = 0
arrow_rot = 360//Control in which direction speedometer arrow is turned

//Money
global.dollars = 0
money_timer = 4

//Music
global.music_on = false
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




