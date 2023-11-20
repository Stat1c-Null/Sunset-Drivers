x += hspeed
y += vspeed

if(place_meeting(x,y,o_car_ai2) or place_meeting(x,y, o_police_car)){
	var amount = irandom_range(1, 4)
	repeat(amount) {
		var length = 7	
		var angleRand = random_range(-15, 15) 
		var xRand = x + lengthdir_x(length, direction - 180 + angleRand)
		var yRand = y + lengthdir_y(length, direction - 180 + angleRand)
		
		part_type_size(particle_trail, 1, 3, 0.3, 0.8)
		part_type_orientation(particle_trail, direction, direction, 0, 0, 0)
		part_particles_create(particle_syst, xRand, yRand, particle_trail, 1)
	}
	//Count kill for cop if player hits them with a bullet
	with(o_police_car) {
		if hp < 1 and cop_killed == false{
			global.cops_kills += 1
			cop_killed = true
		}
	}
	instance_destroy(self)
}