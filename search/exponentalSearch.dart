import 'dart:math';

import 'searchAlgoritms.dart';

void main(List<String> args) {
  Random r = Random.secure();

  


  List<int> integers = [12, 5, 65, 98, 48, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  int size = integers.length;

  // The element that should be found
  int shouldBeFound = integers[r.nextInt(size - 1)];

  ExponentialSearch search = new ExponentialSearch();
  int atIndex = search.find<num>(integers, shouldBeFound);

  print("$shouldBeFound, ${integers[atIndex]}, $atIndex, $size");

  // int toCheck = Arrays().binarySearch(integers, shouldBeFound);
  // print("${toCheck == atIndex? toCheck: ''}"  );
}

class ExponentialSearch implements SearchAlgorithm {
  int find<T extends Comparable<T>>(List<T> array, T key) {
    if (array[0] == key) {
      return 0;
    }
    if (array[array.length - 1] == key) {
      return array.length;
    }

    int range = 1;

    while (range < array.length && array[range].compareTo(key) <= -1) {
      range = range * 2;
    }

    return Arrays().binarySearch(array, key);
  }
}

class Arrays {
  int binarySearch(List arr,  target) {
    int low = 0;
    int high = arr.length - 1;

    while (low <= high) {
      int mid = (low + high) ~/ 2;

      if (arr[mid] == target) {
        return mid;
      } else if (arr[mid] > target) {
        high = mid - 1;
      } else {
        low = mid + 1;
      }
    }
    return -1;
  }
}
