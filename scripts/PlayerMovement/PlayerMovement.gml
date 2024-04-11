function paddle_movement(){
	
	// Logic for runKey
	if (runKey == 1 and moveSpeed >= 5) then moveSpeed = 10
	if (runKey == 0 and moveSpeed == 10) then moveSpeed = 5
	
	// Logic to apply movement
	x += (rightKey - leftKey) * moveSpeed;
	y += (downKey - upKey) * moveSpeed;
	
	// Logic for getting hit by bullet
	if currentCooldown > 0 then --currentCooldown
	if moveSpeed < 5 then moveSpeed = moveSpeed*1.05
	
}