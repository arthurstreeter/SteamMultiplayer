/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


selectAction = function () {
		// Disable other buttons
		for (var _i = 0; _i < 5; _i++){
			var _inst = instance_find(obj_Button,_i)
			if _inst != noone then _inst.disabled = true;
		}
		
		var lobby_list = instance_create_depth(416,208,-10,obj_LobbyList)
	
}