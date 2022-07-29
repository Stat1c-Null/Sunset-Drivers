/// @description

var amount = irandom_range(1, 2)
repeat(amount) {
	var length = 10

	var angleRand = random_range(-15, 15)
	var xRand = random_range(x - 30, x + 30)
	var yRand = random_range(y - 60, y + 30)
	var xRand = xRand + lengthdir_x(length, direction - 180 + angleRand)
	var yRand = yRand + lengthdir_y(length, direction - 180 + angleRand)

	part_type_orientation(particle_trail, direction , direction, 0, 0, 0)
	part_particles_create(particle_syst, xRand, yRand, particle_trail, 1)


}
var randLoop = irandom_range(loopAlarmMin, loopAlarmMax)

alarm_set(0, randLoop)