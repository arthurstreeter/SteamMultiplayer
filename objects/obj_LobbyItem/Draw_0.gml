/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_left)
draw_set_valign(fa_middle)

draw_text(bbox_left+10,y+abs(bbox_top-bbox_bottom)/2-15,"LobbyID: " + string(lobby_id))
draw_text(bbox_left+10,y+abs(bbox_top-bbox_bottom)/2,"Creator: " + lobby_creator)