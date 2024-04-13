/// @descrip
switch(async_load[?"event_type"])
{ 
	
	case "p2p_session_request":
		var _fromID = async_load[?"user_id"]; //SteamID
		var _fromName = steam_get_user_persona_name_sync(_fromID); //Steam Player Name
		var _slot = array_length(playerList)
		array_push(playerList, 
		{
			steamID: _fromID,
			steamName: _fromName,
			character: undefined,
			startPos: grab_spawn_point(_slot)
		})
		send_player_sync(_fromID);
		send_player_spawn(_fromID, _slot);
		break
}



