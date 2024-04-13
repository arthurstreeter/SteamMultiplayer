switch(async_load[?"event_type"])
{ 
	case "lobby_chat_update":
		var _fromID = async_load[?"user_id"]; //SteamID
		var _fromName = steam_get_user_persona_name_sync(_fromID); //Steam Player Name
		if (async_load[?"change_flags"] & steam_lobby_member_change_entered){
			show_debug_message("Player Joined: " + _fromName)
			var _slot = array_length(playerList)
			array_push(playerList, 
			{
				steamID: _fromID,
				steamName: _fromName,
				character: undefined,
				startPos: grab_spawn_point(_slot),
				lobbyMemberID: _slot
			})
			send_player_sync(_fromID);
			send_player_spawn(_fromID, _slot);
		}
		break
}



