
///@self obj_Server
function send_player_sync(_steam_id){
	var _b = buffer_create(1, buffer_grow, 1);
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.SYNC_PLAYERS);
	buffer_write(_b, buffer_string, shrink_player_list());
	steam_net_packet_send(_steam_id, _b)
	buffer_delete(_b);
}


///@self obj_Server
function send_player_spawn(_steam_id, _slot) {
	var _pos = grab_spawn_point(_slot)
	var _b = buffer_create(5, buffer_fixed, 1); //1+2+2
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.SPAWN_SELF);//1
	buffer_write(_b, buffer_u16, _pos.x);//2
	buffer_write(_b, buffer_u16, _pos.y);//2
	steam_net_packet_send(_steam_id, _b)
	buffer_delete(_b);
	server_player_spawn_at_pos(_steam_id, _pos)
	send_other_player_spawn(_steam_id, _pos);
}

///@self obj_Server
function send_other_player_spawn(_steam_id, _pos) {
	var _b = buffer_create(13, buffer_fixed, 1); //1+2+2+8
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.SPAWN_OTHER);//1
	buffer_write(_b, buffer_u16, _pos.x);//2
	buffer_write(_b, buffer_u16, _pos.y);//2
	buffer_write(_b, buffer_u64, _steam_id);//8
	for (var _i = 1; _i < array_length(playerList); _i++){
		if (playerList[_i].steamID != _steam_id && _steam_id != steamID) {
			steam_net_packet_send(playerList[_i].steamID, _b)
		}
	}
	buffer_delete(_b);
}

///@self obj_Server
function shrink_player_list(){
	var _shrunkList = playerList
	for (var _i = 0; _i < array_length(_shrunkList); _i++) {
		_shrunkList[_i].character = undefined	
	}
	return json_stringify(_shrunkList)
}

///@self obj_Server
function server_player_spawn_at_pos(_steam_id, _pos) {
	var _layer = layer_get_id("Instances");
	for (var _i = 0; _i < array_length(playerList); _i++){
		if playerList[_i].steamID == _steam_id {
		var _inst = instance_create_layer(_pos.x, _pos.y,_layer,obj_Player, {
							steamName	: playerList[_i].steamName,
							steamID: _steam_id
					})
		playerList[_i].character = _inst
		}
	}
}
