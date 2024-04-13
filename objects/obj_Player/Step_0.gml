/// @description Movement & Actions based off of Input
get_controls(isLocal)

paddle_movement()


// Logic for shooting a bullet
if (actionKey == 1 && currentCooldown <= 0){
	instance_create_layer(x > room_width/2 ? bbox_left-10 : bbox_right+10,y, "Instances", obj_Bullet)
	currentCooldown = fireCooldown
}

