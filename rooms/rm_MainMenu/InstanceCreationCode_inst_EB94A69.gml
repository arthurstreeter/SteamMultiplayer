selectAction = function () {
		// Disable other buttons
		for (var _i = 0; _i < 5; _i++){
			var _inst = instance_find(obj_Button,_i)
			if _inst != noone then _inst.disabled = true;
		}
		
		var lobby_list = instance_create_depth(416,208,-10,obj_LobbyList)
		lobby_list.image_xscale = 25
		lobby_list.image_yscale = 16
		var lobby_item = instance_create_depth(lobby_list.x, lobby_list.bbox_top+40,-20,obj_LobbyItem)
		lobby_list.lobby_list[0] = lobby_item
		lobby_list.alarm[0] = 1
	
}