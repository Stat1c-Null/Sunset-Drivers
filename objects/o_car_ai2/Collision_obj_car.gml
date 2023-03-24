///@description STOP if got into heavy collision with another car
if abs(speed_previous - phy_speed) > 1 {
    hp -= abs(speed_previous - phy_speed)
	global.health -= (abs(speed_previous - phy_speed))/2
}
    
if abs(angular_speed_previous - phy_angular_velocity) > 50 {
    hp -= abs(angular_speed_previous - phy_angular_velocity)/50
}
