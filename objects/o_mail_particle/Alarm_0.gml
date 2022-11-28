var amount = irandom_range(5, 35)

if(instance_exists(obj_car)) {
	repeat(amount) {
		image_index = random_range(0, 3)
	
		var angleDiff = random_range(-35, 35)
		
		//obj_car.direction - angleDiff, obj_car.direction + angleDiff
		
		part_type_direction(particle_trail,75, 135 ,0, 5)
	
		part_particles_create(particle_syst,obj_car.x, obj_car.y, particle_trail, 1)
	
	}
}

alarm[1] = room_speed * 2
