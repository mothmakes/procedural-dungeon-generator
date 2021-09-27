// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function state_generator_enemies(){
	if(state_new) {
		//Spawns enemies
		spawnChance = 0.75
		enemies = [];

		for (var i = 0;i<array_length_1d(markers);i++) {
			if markers[i] != startRoom {
				if random(1) <= spawnChance {
					var _width = markers[i].width;
					var _height = markers[i].height;
					var _spawnX = markers[i].x + ((_width-1)*random(1)*global.tile_size);
					var _spawnY = markers[i].y + ((_height-1)*random(1)*global.tile_size);
					enemies[i] = instance_create_layer(_spawnX,_spawnY,"Instances",obj_enemy);
				}
			}
		}

		with obj_gameManager enemies = obj_generatorManager.enemies;
	}
}