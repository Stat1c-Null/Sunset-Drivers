if abs(speed_previous - phy_speed) > 1 {
    hp -= abs(speed_previous - phy_speed)
}

if(water_splash == false) {
	instance_create_layer(x,y,"UnderPlayer", o_water_splash)
	water_splash = true
}

if abs(angular_speed_previous - phy_angular_velocity) > 50 {
    hp -= abs(angular_speed_previous - phy_angular_velocity)/50
}

