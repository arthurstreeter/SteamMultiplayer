/// @description Setup Player

localSteamID = steam_get_user_steam_id()
isLocal = (localSteamID == steamID)
image_index = lobbyMemberID

moveSpeed = 5
fireCooldown = 50
currentCooldown = 0

init_controls()