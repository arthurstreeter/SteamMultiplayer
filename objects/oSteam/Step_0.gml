steam_update(); // Keep Steam updated (once per frame? once per second?)

// Restart the game by pressing R
if keyboard_check_pressed(ord("R"))
{
	isGameRestarting = true;
	game_restart(); // This triggers the Game End event
}