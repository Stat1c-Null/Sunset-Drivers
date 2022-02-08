if abs(speed_previous - phy_speed) > 1 {
    hp -= abs(speed_previous - phy_speed)
	//Reduce health
	global.health -= collision_damage
}
    
if abs(angular_speed_previous - phy_angular_velocity) > 50 {
    hp -= abs(angular_speed_previous - phy_angular_velocity)/50
	//Reduce health
	global.health -= collision_damage	
}

