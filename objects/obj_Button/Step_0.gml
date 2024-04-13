///@description ButtonLogic
// Button is being hovered

if ((point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom) or selected == true) && !disabled ) {
	// The buttom was clicked (flicker for 1 frame)
	
	if (mouse_check_button(mb_left)) {
		image_index = 2
		if mouse_check_button_pressed(mb_left) then selectAction();
		
	} else {
	// Set the hover image index
	image_index = 1
	}
}
// Button is in it's normal state
else if disabled {
	image_index = 3
} else {
	image_index = 0
}