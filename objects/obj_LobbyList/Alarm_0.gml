/// @description Call for servers
alarm[0] = 500
steam_lobby_list_add_string_filter("isGameMakerTest","true",steam_lobby_list_filter_eq)
steam_lobby_list_request()