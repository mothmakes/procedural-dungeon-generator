# procedural-dungeon-generator

This repository contains a GameMaker Studio 2 project that produces a simple procedurally generated dungeon. I created this project to learn the complex algorithms behind game features like procedural generation, and the resulting project shows the main steps required in doing so.

## Building and Running:
There are two ways to access the generator, either by compiling in GMS2, or by running an included executable.
### Building from source:
1. To build from source, download this project and open the .yyp using GameMaker Studio 2. Alternatively, I have included an importable .yyz file to make this process easier.
2. Compile the game by pressing the Play button.

### Running the included executable:
1. Download the .zip file in the root directory of the repository.
2. Extract it.
3. Run the .exe.

## Usage
* Upon execution, hold SPACE to move the rooms to correct positions. They will click into position when this stage is finished.
* Left click through each stage. When the player spawns, you can control them with WASD.

## Explanation and Stages
### 1. Room Generation
A random number of rooms is generated, using a function to get a random position within a radius. Currently the rooms are represented as markers which draw out their randomized widths.
### 2. Room Seperation
The rooms are overlapping, so they need to be seperated using a rudimentary physics seperation algorithm. This works by computing vectors for each room based on their proximity to each other, such that they move away. They then click into the tile grid.
### 3. Graph Generation
A fully connected undirected graph, with each vertex being a room, is generated.
### 4. MST Generation
A minimum spanning tree is generated to represent the connections between the rooms, that will eventually become corridors. There is future potential to then add on a few extra random connections to create loops.
### 5. Room Initialisation
The start and end room are selected.
### 6. Tile Conversion
Every space in the dungeon is covered in a relevant tile. Rooms appear as grass, corridors as stone, and walls as a blue colour. This also establishes the collision map for players and other entities.
### 7. Player Creation
The player character is spawned in the start room and is controllable.
### 8. Enemy Creation
Enemy sprites are spawned in each of the other rooms.

This project aimed to be a introductory guide to procedural generation. Following this basic skeleton, I could go forward to create a game out of this. But for now it serves to highlight the most complex parts of procedurally generated dungeon games.
