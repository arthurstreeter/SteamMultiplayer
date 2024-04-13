/// @description Listening for Activity as Client

// Receive Packets
while(steam_net_packet_receive()){
	
	var _sender = steam_net_packet_get_sender_id();
	steam_net_packet_get_data(inbuf);
	buffer_seek(inbuf, buffer_seek_start, 0);
	var _type = buffer_read(inbuf, buffer_u8);
	
	switch _type{
		case NETWORK_PACKETS.SYNC_PLAYERS:
			var _playerList = buffer_read(inbuf, buffer_string);
			_playerList = json_parse(_playerList)
			sync_players(_playerList)
			break
		case NETWORK_PACKETS.SPAWN_OTHER:
			var _layer = layer_get_id("Instances_1");
			var _x = buffer_read(inbuf, buffer_u16)
			var _y = buffer_read(inbuf, buffer_u16)
			var _steamID = buffer_read(inbuf, buffer_u64)
			var _inst = instance_create_layer(_x,_y,_layer,obj_Player,{
							steamName : steam_get_user_persona_name(_steamID),
							steamID : _steamID,
							lobbyMemberID : steam_lobby_get_member_id(_steamID)
							})
			array_push(playerList, {
				steamID	 : _steamID,
				steamName: steam_get_user_persona_name(_steamID),
				character: _inst
			})
				
			break
			
		case NETWORK_PACKETS.SPAWN_SELF:
			lobbyMemberID = steam_lobby_get_member_id()
			var _layer = layer_get_id("Instances");
			var _x = buffer_read(inbuf, buffer_u16)
			var _y = buffer_read(inbuf, buffer_u16)
			var _inst = instance_create_layer(_x,_y,_layer,obj_Player,{
							steamName	: steamName,
							steamID: steamID,
							lobbyMemberID: steam_lobby_get_member_id()
						})
			playerList[0].character = _inst
			character = _inst
			character.image_index = lobbyMemberID
			break
		default:
			show_debug_message("Unknown packet received")
			break
	}
}