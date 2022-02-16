friction_strength = 6
acceleration_speed = 0.35
center_to_front = 40

richting = 0

//Controls
forward = true
left = false
right = false
brake = false
//Stats
car_hp = 100

//Keys

if not left {
    if richting > 0 {richting -= 3}} 
    
if not right {
    if richting < 0 {richting += 3}} 
    
if not left and not right {
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




