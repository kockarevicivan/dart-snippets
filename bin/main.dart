import 'dart:collection';
import 'package:stack/stack.dart';

main() {
  // Adjacency matrix for the weighed graph.
  var graphAdjacencyMatrix = [
    [0, 3, 0, 2, 0, 0, 0, 0, 4], // 0
    [3, 0, 0, 0, 0, 0, 0, 4, 0], // 1
    [0, 0, 0, 6, 0, 1, 0, 2, 0], // 2
    [2, 0, 6, 0, 1, 0, 0, 0, 0], // 3
    [0, 0, 0, 1, 0, 0, 0, 0, 8], // 4
    [0, 0, 1, 0, 0, 0, 8, 0, 0], // 5
    [0, 0, 0, 0, 0, 8, 0, 0, 0], // 6
    [0, 4, 2, 0, 0, 0, 0, 0, 0], // 7
    [4, 0, 0, 0, 8, 0, 0, 0, 0] //  8
  ];

  // Will be used for GBFS an A*.
  var heuristicsMatrix = [
    [0, 21, 0, 32, 0, 0, 0, 0, 8], // 0
    [9, 0, 0, 0, 0, 0, 0, 9, 0], // 1
    [0, 0, 0, 16, 0, 28, 0, 21, 0], // 2
    [2, 0, 42, 0, 7, 0, 0, 0, 0], // 3
    [0, 0, 0, 41, 0, 0, 0, 0, 8], // 4
    [0, 0, 31, 0, 0, 0, 19, 0, 0], // 5
    [0, 0, 0, 0, 0, 18, 0, 0, 0], // 6
    [0, 14, 27, 0, 0, 0, 0, 0, 0], // 7
    [10, 0, 0, 0, 8, 0, 0, 0, 0] //  8
  ];
  
  var x = [12,2,34].reduce((a, b) => a < b ? a : b);
  print(x);

  // traverseGraphBreadthFirst(graphAdjacencyMatrix, 0, 5);
  
  List<int> array = [5, 6, 1, 8, 2, 4, 0, 9, 8, 8, 7];

  print(mergeSort(array));
}

// ====================== GRAPH TRAVERSAL ======================

/// Traverse the graph via A* and print the searched value.
void traverseGraphAStar(List<List<int>> adjacencyMatrix, int startingNodeIndex, int searchedValue) {
  // TODO: Implement.
}

/// Traverse the graph via GBFS and print the searched value.
void traverseGraphGreedyBestFirst(List<List<int>> adjacencyMatrix, int startingNodeIndex, int searchedValue) {
  // TODO: Implement.
}

/// Traverse the graph via Dijkstra and print the searched value.
void traverseGraphDijkstra(List<List<int>> adjacencyMatrix, int startingNodeIndex, int searchedValue) {
  var priorityList = List();
  var alreadyVisitedList = List();

  priorityList.add({
    'index': startingNodeIndex,
    'totalCost': 0 // TODO: Needs to be implemented with classes.
  });

  while(priorityList.isNotEmpty) {
    var rowIndex = priorityList.removeAt(0).index;

    if (rowIndex == searchedValue) return print(rowIndex); // Found.

    alreadyVisitedList.add(rowIndex);

    var minWeight = adjacencyMatrix[rowIndex].reduce((a, b) => a < b ? a : b);
    var minWeightIndex = adjacencyMatrix[rowIndex].indexOf(minWeight);
    
    priorityList.add(minWeightIndex);

    priorityList.sort();
  }
}

/// Traverse the graph via BFS and print the searched value.
void traverseGraphBreadthFirst(List<List<int>> adjacencyMatrix, int startingNodeIndex, int searchedValue) {
  var alreadyVisited = [];
  var queue = Queue();

  queue.addLast(startingNodeIndex);

  while (queue.isNotEmpty) {
    int rowIndex = queue.removeFirst();

    if (rowIndex == searchedValue) return print(rowIndex); // Found.

    alreadyVisited.add(rowIndex);

    for (var j = 0; j < adjacencyMatrix[rowIndex].length; j++) {
      if (adjacencyMatrix[rowIndex][j] != 0 && !alreadyVisited.contains(j) && !queue.contains(j)) {
        queue.addLast(j);
      }
    }
  }
}

/// Traverse the graph via DFS and print the searched value.
void traverseGraphDepthFirst(List<List<int>> adjacencyMatrix, int startingNodeIndex, int searchedValue) {
  var alreadyVisited = [];
  var stack = Stack();

  stack.push(startingNodeIndex);

  while (stack.isNotEmpty) {
    int rowIndex = stack.pop();

    print('Visiting ${rowIndex}');
    if (rowIndex == searchedValue) return print(rowIndex);

    alreadyVisited.add(rowIndex);

    for (var j = 0; j < adjacencyMatrix[rowIndex].length; j++) {
      if (adjacencyMatrix[rowIndex][j] != 0 && !alreadyVisited.contains(j)) {
        if (!alreadyVisited.contains(j)) {
          stack.push(j);
        }
      }
    }
  }
}

// ======================== SORTING =======================

/// Bubble sort.
List<int> bubbleSort(array) {
  for (var i = 0; i < array.length; i++) {
    for (var j = 0; j < array.length - i - 1; j++) {
      if (array[j] > array[j + 1]) swap(array, j, j + 1);
    }
  }

  return array;
}

/// Selection sort.
List<int> selectionSort(array) {
  for (var i = 0; i < array.length; i++) {
    var minIndex = i;

    for (var j = i + 1; j < array.length; j++) {
      if (array[minIndex] > array[j]) minIndex = j;
    }
    
    swap(array, i, minIndex);
  }

  return array;
}

/// Cocktail sort.
List<int> cocktailSort(array) {
  // TODO: To be implemented.
  
  return null;
}

/// Comb sort.
List<int> combSort(array) {
  // TODO: To be implemented.
  
  return null;
}

/// Insertion sort.
List<int> insertionSort(array) {
  for(var i = 0; i < array.length; i++) {
    var j = i;

    while(j > 0 && array[j] < array[j-1]) {
      swap(array, j, --j);
    }
  }
  
  return array;
}

/// Merge sort.
List<int> mergeSort(array) {
  if(array.length == 1) return array;

  var left = mergeSort(array.sublist(0, (array.length / 2).floor()));
  var right = mergeSort(array.sublist((array.length / 2).floor()));

  return merge(left, right);
}

/// Quick sort. Not done!
List<int> quickSort(array, startIndex, endIndex) {
  // TODO: To be implemented.

  return null;
}



/// Generic element swap function.
void swap(array, i, j) {
  var c = array[i];
  array[i] = array[j];
  array[j] = c;
}

/// Merge function for merge sort.
List<int> merge(List<int> leftList, List<int> rightList) {
  List<int> finalList = [];

  while (leftList.isNotEmpty || rightList.isNotEmpty) {
    if (leftList == null || leftList.isEmpty) {
      finalList.add(rightList[0]);
      rightList.removeAt(0);
    } else if (rightList == null || rightList.isEmpty) {
      finalList.add(leftList[0]);
      leftList.removeAt(0);
    } else if (leftList[0] < rightList[0]) {
      finalList.add(leftList[0]);
      leftList.removeAt(0);
    } else {
      finalList.add(rightList[0]);
      rightList.removeAt(0);
    }
  }

  return finalList;
}
