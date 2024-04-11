function get_controls(_local)
{
	if _local {
	//Directions inputs
	rightKey = keyboard_check(vk_right) ||keyboard_check(ord("D")) || gamepad_button_check( 0, gp_padr );
	rightKey = clamp( rightKey, 0, 1 );
	leftKey  = keyboard_check(vk_left) || keyboard_check(ord("A")) || gamepad_button_check( 0, gp_padl );
	leftKey  = clamp( leftKey, 0, 1 );
	downKey  = keyboard_check(vk_down) || keyboard_check(ord("S")) || gamepad_button_check( 0, gp_padd );
	downKey  = clamp( downKey, 0, 1 );
	upKey  = keyboard_check(vk_up) || keyboard_check(ord("W")) || gamepad_button_check( 0, gp_padu );
	upKey  = clamp( upKey, 0, 1 );
	allDir = rightKey+leftKey+downKey+upKey
	//Action inputs
	runKey = keyboard_check(vk_shift) || gamepad_button_check( 0, gp_face3 );
	actionKey = keyboard_check(vk_space) || mouse_check_button(mb_left) || gamepad_button_check( 0, gp_face2 );
	}

}

function init_controls(){
	//Directions inputs
	rightKey	= 0
	leftKey		= 0
	downKey		= 0
	upKey		= 0
	
	//Action inputs
	runKey		= 0
	actionKey	= 0
		
}