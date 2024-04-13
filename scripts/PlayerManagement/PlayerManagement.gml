function grab_spawn_point(_player) {
	var _spawnPoint  = instance_find(obj_SpawnPoint, _player)
	if _spawnPoint == noone return {x:0,y:0};
	return {x:_spawnPoint.x, y:_spawnPoint.y}
}