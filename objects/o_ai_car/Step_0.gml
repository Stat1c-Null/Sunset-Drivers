//Keys


Vvoorx = Xvoor - Xvooroud
Xvooroud = Xvoor

Vvoory = Yvoor - Yvooroud
Yvooroud = Yvoor

Vachterx = Xachter - Xachteroud
Xachteroud = Xachter

Vachtery = Yachter - Yachteroud
Yachteroud = Yachter



//Drive forward
if (forward) {

phy_speed_x += lengthdir_x(acceleration_speed,-phy_rotation)
phy_speed_y += lengthdir_y(acceleration_speed,-phy_rotation)}
	
//Stop
if (brake) {

phy_speed_x += lengthdir_x(-acceleration_speed/2,-phy_rotation)
phy_speed_y += lengthdir_y(-acceleration_speed/2,-phy_rotation)}

//Turning
if (left) {
if richting < 45 {richting += 3}
if richting > 45 {richting = 45}}

if (right) {
if richting > -45 {richting -= 3}
if richting < -45 {richting = -45}}


if not left {
	if richting > 0 {richting += angle_difference(0,richting)/3}}

if not right {
	if richting < 0 {richting += angle_difference(0,richting)/3}}

if not left and not right {
	if abs(richting) <= 3 {richting = 0}}
	
//Destroy car if there is no health
if(car_hp <= 0)
{
	instance_destroy(obj_car)	
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

