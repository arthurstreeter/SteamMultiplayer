/// @description Listen for Server List Query

switch(async_load[?"event_type"])
{	
	
	case "lobby_list":
		resetLobbyList()
		if steam_lobby_list_get_count() == 0 {
			lobbyList[0] = instance_create_depth(x, bbox_top+40,-20,obj_LobbyItem);
		} else {
			for(var _i = 0 ; _i < steam_lobby_list_get_count() ; _i++)
			{
				var _ins = instance_create_depth(x, bbox_top+40+80*_i,-20,obj_LobbyItem, {
					lobby_index : _i,
					lobby_id : steam_lobby_list_get_lobby_id(_i),
					lobby_creator : steam_lobby_list_get_data(_i, "Creator")
				});
				array_push(lobbyList, _ins)
			}
		}
		
	break
	
}







