main() {
  List<int> array = [5, 6, 1, 8, 2, 4, 0, 9, 8, 8, 7];

  print(mergeSort(array));
}


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
