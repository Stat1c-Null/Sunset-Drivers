
//Create new car

with(instance_create_layer(choose(845, 940), spawn_y, "GameObjects", o_car_ai))
{
		direction = point_direction(x,y,x, y + room_height)
		image_angle = point_direction(x,y,x, y - room_height)
}


alarm[0] = room_speed * timer_length


