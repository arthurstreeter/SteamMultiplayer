///@description Setup Buttons

menuItems = [];
selectedItem = 0;

//Gather Buttons
for (var _i = 0; _i < 5; _i++){
	var _inst = instance_find(obj_Button,_i)
	if _inst != noone then array_push(menuItems, _inst) else break;
}
