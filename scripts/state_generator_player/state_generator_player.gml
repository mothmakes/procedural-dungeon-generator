// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_generator_player(){
	if(state_new) {
		//Spawns player
		with obj_gameManager player = instance_create_layer(obj_generatorManager.startRoom.xx,obj_generatorManager.startRoom.yy,"Instances",obj_player)
	} else if (click) {
		state_switch("Enemy Generation");
	}
}