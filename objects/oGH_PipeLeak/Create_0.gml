#macro straightPipe createPipe(0, ["NORTH", "SOUTH"])
#macro elbowPipe createPipe(1, ["NORTH", "EAST"])
#macro tJuncPipe createPipe(2, ["NORTH", "EAST", "WEST"])
#macro crossPipe createPipe(3, ["NORTH", "EAST", "SOUTH", "WEST"])
#macro emptyPipe createPipe(0, [])

PipeTile = function() constructor {
	connectionPoints = [] // North - , East, South, West
	rotation = 0 // 0, 90, 180, 270
	spr_indx = -1
	isPipe = true // False for empty pipe
	
	rotate = function () {
		rotation = (rotation + 90) mod 360; // 270° is -90° in GameMaker
	}
	
	get_rotated_connections = function () {
		var dirs = ["NORTH", "EAST", "SOUTH", "WEST"];
		var rotated = [];
		for (var i = 0; i < array_length(connectionPoints); i++) {
			var dir = connectionPoints[i];
			var index = array_get_index(dirs, dir);
			var newIndex = (index + rotation / 90) mod 4;
			array_push(rotated, dirs[newIndex]);
		}
		return rotated;
	};
};

selectedPipe = [0, 0]
StartPipe = {
	pos : [0, 0],
	requiredConn : "NORTH"
};

EndPipe = {
	pos : [0, 0],
	requiredConn : "WEST"
};

gridSize = 4;
pipes = [
    [emptyPipe, emptyPipe, emptyPipe, emptyPipe],
    [emptyPipe, emptyPipe, emptyPipe, emptyPipe],
    [emptyPipe, emptyPipe, emptyPipe, emptyPipe],
    [emptyPipe, emptyPipe, emptyPipe, emptyPipe]
];

levels = [
    {
        startP: { pos: [0, 0], requiredConn: "WEST" },
        endP: { pos: [3, 3], requiredConn: "WEST" },
        pipes: [
            [elbowPipe, straightPipe, tJuncPipe, elbowPipe],
            [tJuncPipe, elbowPipe, elbowPipe, tJuncPipe],
            [elbowPipe, tJuncPipe, straightPipe, elbowPipe],
            [tJuncPipe, elbowPipe, emptyPipe, elbowPipe]
        ]
    },
	{
        startP: { pos: [3, 0], requiredConn: "SOUTH" },
        endP: { pos: [0, 3], requiredConn: "EAST" },
		pipes: [
			[elbowPipe, tJuncPipe, elbowPipe, straightPipe],
		    [tJuncPipe, crossPipe, tJuncPipe, elbowPipe],
		    [elbowPipe, elbowPipe, crossPipe, elbowPipe],
		    [elbowPipe, tJuncPipe, elbowPipe, tJuncPipe]
		]
	},
	{
        startP: { pos: [1, 0], requiredConn: "WEST" },
        endP: { pos: [2, 3], requiredConn: "EAST" },
		pipes: [
			[elbowPipe, straightPipe, elbowPipe, elbowPipe],
		    [tJuncPipe, crossPipe, straightPipe, straightPipe],
		    [straightPipe, elbowPipe, tJuncPipe, straightPipe],
		    [elbowPipe, straightPipe, elbowPipe, elbowPipe]
		]
	},
	{
        startP: { pos: [0, 2], requiredConn: "NORTH" },
        endP: { pos: [0, 1], requiredConn: "NORTH" },
		pipes: [
			[elbowPipe, straightPipe, straightPipe, elbowPipe],
		    [tJuncPipe, tJuncPipe, crossPipe, elbowPipe],
		    [elbowPipe, tJuncPipe, elbowPipe, elbowPipe],
		    [elbowPipe, elbowPipe, crossPipe, straightPipe]
		]
	},
	{
        startP: { pos: [2, 3], requiredConn: "EAST" },
        endP: { pos: [3, 2], requiredConn: "SOUTH" },
		pipes: [
			[elbowPipe, straightPipe, elbowPipe, elbowPipe],
		    [straightPipe, elbowPipe, straightPipe, straightPipe],
		    [tJuncPipe, straightPipe, tJuncPipe, straightPipe],
		    [elbowPipe, straightPipe, elbowPipe, elbowPipe]
		]
	}
];


randomize()
var lvl_index = irandom(array_length(oGH_PipeLeak.levels) - 1);
load_level(lvl_index)

// Randomly rotate all pipes
for (var r = 0; r < gridSize; r++) {
	for (var c = 0; c < gridSize; c++) {
		var p = pipes[r][c];
		if (p.isPipe) {
			var rotTimes = irandom(3); // 0 to 3
			for (var i = 0; i < rotTimes; i++) {
				p.rotate();
			}
		}
	}
}

function load_level(index) {
	var lvl = oGH_PipeLeak.levels[index];

	oGH_PipeLeak.StartPipe = lvl.startP;
	oGH_PipeLeak.EndPipe = lvl.endP;
	oGH_PipeLeak.gridSize = 4;
	oGH_PipeLeak.pipes = lvl.pipes;
}

function is_flow_valid(gSize, startIndex, endIndex, startP, endP) {
	var DIRS = ["NORTH", "EAST", "SOUTH", "WEST"];

	var DIR_OFFSETS = ds_map_create();
	ds_map_add(DIR_OFFSETS, "NORTH", [-1, 0]);
	ds_map_add(DIR_OFFSETS, "EAST", [0, 1]);
	ds_map_add(DIR_OFFSETS, "SOUTH", [1, 0]);
	ds_map_add(DIR_OFFSETS, "WEST", [0, -1]);

	var OPPOSITE = ds_map_create();
	ds_map_add(OPPOSITE, "NORTH", "SOUTH");
	ds_map_add(OPPOSITE, "EAST", "WEST");
	ds_map_add(OPPOSITE, "SOUTH", "NORTH");
	ds_map_add(OPPOSITE, "WEST", "EAST");

	var visited = ds_grid_create(gSize, gSize);
	ds_grid_clear(visited, false);

	var stack = [];
	array_push(stack, startIndex);

	while (array_length(stack) > 0) {
		var current = array_pop(stack);
		var r = current[0];
		var c = current[1];

		if (visited[# r, c]) continue;
		visited[# r, c] = true;

		var tile = pipes[r][c];
		if (!tile.isPipe) {
			ds_grid_destroy(visited);
			return false;
		}

		var conns = tile.get_rotated_connections();

		for (var i = 0; i < array_length(conns); i++) {
			var dir = conns[i];
			var offset = DIR_OFFSETS[? dir];
			var nr = r + offset[0];
			var nc = c + offset[1];

			// Out of bounds = dead end
			if (nr < 0 || nr >= gSize || nc < 0 || nc >= gSize) {
				// BUT ignore if current is start or end
				if ((r == startIndex[0] && c == startIndex[1]) ||
					(r == endIndex[0] && c == endIndex[1])) {
					continue;
				}
				ds_grid_destroy(visited);
				return false;
			}

			var neighbor = pipes[nr][nc];
			if (!neighbor.isPipe) {
				// Also allow if current is start or end
				if ((r == startIndex[0] && c == startIndex[1]) ||
					(r == endIndex[0] && c == endIndex[1])) {
					continue;
				}
				ds_grid_destroy(visited);
				return false;
			}

			var neighbor_conns = neighbor.get_rotated_connections();
			var expected = OPPOSITE[? dir];

			if (array_get_index(neighbor_conns, expected) == -1) {
				// Also allow if current is start or end
				if ((r == startIndex[0] && c == startIndex[1]) ||
					(r == endIndex[0] && c == endIndex[1])) {
					continue;
				}
				ds_grid_destroy(visited);
				return false;
			}

			array_push(stack, [nr, nc]);
		}
	}

	var goalReached = visited[# endIndex[0], endIndex[1]];
	ds_grid_destroy(visited);
	
	var startingPipe = pipes[startIndex[0]][startIndex[1]].get_rotated_connections()
	var endingPipe = pipes[endIndex[0]][endIndex[1]].get_rotated_connections()
	if (!array_contains(startingPipe, startP) || !array_contains(endingPipe, endP)) {
		goalReached = false
	}
	return goalReached;	
}

function getSprDir(dir) {
	switch(dir) {
		case "NORTH": return 0
		case "EAST": return 1
		case "SOUTH": return 2
		case "WEST": return 3
	}
}

function getOppositeDir(dir) {
	switch(dir) {
		case "NORTH": return "SOUTH"
		case "EAST": return "WEST"
		case "SOUTH": return "NORTH"
		case "WEST": return "EAST"
	}
}

// Bool (isVert), offset
function getDirOffset(dir) {
	switch(dir) {
		case "NORTH": return [true, -70]
		case "EAST": return [false, 70]
		case "SOUTH": return [true, 70]
		case "WEST": return [false, -70]
	}
}

function createPipe(spr_indx, connectionPoints) {
    var pipe = new PipeTile();
	if (array_length(connectionPoints) == 0) {
		pipe.isPipe = false
		return pipe
	}
    pipe.spr_indx = spr_indx;
    pipe.connectionPoints = connectionPoints;
    return pipe;
}


function getCurrPipe() {
	return pipes[selectedPipe[0]][selectedPipe[1]]	
}