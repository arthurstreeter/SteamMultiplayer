/// @description Movement

// Lazy solution to mimic a random ball movement.
collision = collision_circle(x,y,16,obj_Entity,true,true)
if collision != noone and !instance_position(collision.x,collision.y,obj_Player){
	if x > room_width-32{
		direction = point_direction(collision.x,collision.y,0,room_height/2) + irandom(25);
	} else if x < 32{
		direction = point_direction(collision.x,collision.y,room_width,room_height/2) + irandom(25);
	} else if x > room_width/2 {
		direction = point_direction(collision.x,collision.y,room_width,room_height/2) + irandom(15);
	}else{
		direction = point_direction(collision.x,collision.y,0,room_height/2) + irandom(15);
	}
	++image_index
	if image_index > image_number then image_index = 0
} else if collision != noone{
	if  collision.x > room_width/2 {
		direction = point_direction(collision.x,collision.y,0,room_height/2) + irandom(5);
	}else {
		direction = point_direction(collision.x,collision.y,room_width,room_height/2) + irandom(5);
	}
	++image_index
	if image_index > image_number then image_index = 0
	
}

x += lengthdir_x(moveSpeed, direction)
y += lengthdir_y(moveSpeed, direction)

// Lazy solution to reset the ball if it leaves the boundaries.
if x < 0 or y < 0 or x > room_width or y > room_height {
	x = floor(room_width/2)
	y = floor(room_height/2)
}