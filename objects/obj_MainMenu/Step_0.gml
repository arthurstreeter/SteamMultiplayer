///@description Main Menu Interaction Logic


// Highlight buttons
if (keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"))) {
    menuItems[selectedItem].selected = false
	selectedItem -= 1;
    if (selectedItem < 0) {
        selectedItem = array_length(menuItems) - 1;
    }
	menuItems[selectedItem].selected = true
}
if (keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"))) {
    menuItems[selectedItem].selected = false
    selectedItem += 1;
    if (selectedItem >= array_length(menuItems)) {
        selectedItem = 0;
    }
	menuItems[selectedItem].selected = true
}


// Confirm Action
if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space) ) {
	if !menuItems[selectedItem].disabled then menuItems[selectedItem].selectAction()
	for (var _i = 0; _i < array_length(menuItems); _i++){
		menuItems[_i].disabled = true
	}
}