/// @description Generator

#region Initialize generator
global.tile_size = 16;

//Ensure seed is random
randomize();

//Create the rooms and return an array containing info
roomInfo = scr_initRooms();

//Split info into two arrays
roomPositions = roomInfo[0];
roomDimensions = roomInfo[1];

//Create the dictionary holding the fully connected graph as an adjacency list
adjacency_list = ds_map_create();

//Booleans for the Draw event, to dictate what stage the generator is at so
//correct data is displayed
spread = false;
graphed = false;
treed = false;

//Spread initialisation
seperation_time = power(2.7156,sqrt(room_count)) * 6;
time_held = 0;

startRoom = noone;
endRoom = noone;

#endregion

#region Setup state machine
//Setup the state machine
state_machine_init();

//Create the states
state_create("Spread",state_generator_spread);
state_create("Graph",state_generator_graph);
state_create("Tree",state_generator_tree);
state_create("Room Init",state_generator_room_init);
state_create("Tile Conversion",state_generator_tiles);
state_create("Player Generation",state_generator_player);
state_create("Enemy Generation",state_generator_enemies);

//Set the default state
state_init("Spread");

#endregion