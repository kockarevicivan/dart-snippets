main() {
  List<int> array = [5, 6, 1, 8, 2, 4, 0, 9, 8, 8, 7];

  // insertionSort(array);
  // selectionSort(array);
  // bubbleSort(array);
  // mergeSort(array);

  quickSort(array, 0, array.length-1);

  print(array);
}

/// Merge sort.
List<int> mergeSort(array) {
  if (array.length == 1) return array;

  var left = mergeSort(array.sublist(0, (array.length / 2).floor()));
  var right = mergeSort(array.sublist((array.length / 2).floor()));

  return merge(left, right);
}

/// Quick sort. Not done!
void quickSort(array, startIndex, endIndex) {
  if (endIndex - startIndex == 1) return;

  var pivotIndex = startIndex + ((endIndex-startIndex) / 2).floor();
  var pivot = array[pivotIndex];

  swap(array, pivotIndex, endIndex);

  var itemLeftIndex = startIndex,
      itemRightIndex = endIndex-1;

  // TODO: Finish.
  while(itemLeftIndex < itemRightIndex) {
    if(array[itemLeftIndex] >= pivot && array[itemRightIndex] <= pivot) {
      swap(array, itemLeftIndex, itemRightIndex);
    } else {
      if (array[itemLeftIndex] < pivot) {
        itemLeftIndex++;
      }
      
      if (array[itemRightIndex] > pivot) {
        itemRightIndex--;
      }
    }
  }

  swap(array, pivotIndex, endIndex);

  quickSort(array, startIndex, pivotIndex-1);
  quickSort(array, pivotIndex+1, endIndex);
}

/// Bubble sort.
void bubbleSort(array) {
  for (var i = 0; i < array.length; i++) {
    for (var j = i + 1; j < array.length; j++) {
      if (array[j] < array[i]) {
        swap(array, i, j);
      }
    }
  }
}

/// Selection sort.
void selectionSort(array) {
  var minIndex;
  for (var i = 0; i < array.length; i++) {
    minIndex = i;

    for (var j = i + 1; j < array.length; j++) {
      if (array[j] < array[minIndex]) {
        minIndex = j;
      }
    }

    swap(array, minIndex, i);
  }
}

/// Insertion sort.
void insertionSort(array) {
  for (var i = 0; i < array.length; i++) {
    for (var j = i; j >= 0; j--) {
      if (j == 0 || array[j - 1] < array[j]) {
        break;
      } else {
        swap(array, j, j - 1);
      }
    }
  }
}

/// Generic element swap function.
void swap(array, i, j) {
  var c = array[i];
  array[i] = array[j];
  array[j] = c;
}

/// Merge function for merge sort.
List<int> merge(List leftList, List rightList) {
  var finalList = [];

  while (leftList.isNotEmpty || rightList.isNotEmpty) {
    if(leftList == null || leftList.isEmpty) {
      finalList.add(rightList[0]);
      rightList.removeAt(0);
    } else if(rightList == null || rightList.isEmpty) {
      finalList.add(leftList[0]);
      leftList.removeAt(0);
    } else if(leftList[0] < rightList[0]) {
      finalList.add(leftList[0]);
      leftList.removeAt(0);
    } else {
      finalList.add(rightList[0]);
      rightList.removeAt(0);
    }
  }

  return finalList;
}