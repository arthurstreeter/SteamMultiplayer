/// @description Init Server Variables

playerList = []

steamID = steam_get_user_steam_id()
steamName = steam_get_persona_name()
lobbyMemberID = steam_lobby_get_member_id()
image_index = lobbyMemberID

character = undefined

playerList[0] = {
	steamID		: steamID,
	steamName	: steamName,
	character	: undefined,
	startPos	: grab_spawn_point(0)
	}