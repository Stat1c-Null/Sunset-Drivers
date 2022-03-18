if abs(speed_previous - phy_speed) > 1 {
    hp -= abs(speed_previous - phy_speed)
}
    
if abs(angular_speed_previous - phy_angular_velocity) > 50 {
    hp -= abs(angular_speed_previous - phy_angular_velocity)/50
}
