function scr_minimumSpanningTree() {
	// Starts by finding central node, uses it as start of tree.
	midNode = scr_findCentreNode();
	reachSet = [markers[midNode]];

	// Creates list of nodes not visited
	unreachSet = ds_list_create();
	for (var i = 0;i<array_length_1d(markers);i++) {
		ds_list_add(unreachSet,markers[i]);
	}
	ds_list_delete(unreachSet,midNode);

	// Looks for next path whilst not all nodes visited
	while ds_list_size(unreachSet) > 0 {
	
		// Finds the shortest edge connecting any node in reachSet to the rest of the graph
		edge = scr_findMinimum(reachSet);
		minNode = edge[1];
		node = edge[0];
	
		// Adds edge to tree, updates the visited and unvisited nodes
		tree[array_length_1d(tree)] = [node,minNode];
		reachSet[array_length_1d(reachSet)] = minNode;
		ds_list_delete(unreachSet,ds_list_find_index(unreachSet,minNode));
	}

	return tree;


}
