import 'dart:math';

import 'searchAlgoritms.dart';

void main(List<String> args) {
 
 
  int maxElement = 100000;

  List<int> integers = [12, 56, 89, 45, 41, 98, 75, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  // The element that should be found
  int shouldBeFound = integers[Random.secure().nextInt(integers.length - 1)];

  BinarySearch search = new BinarySearch();
  int atIndex = search.find<num>(integers, shouldBeFound);

  print(" $shouldBeFound, ${integers[atIndex]}, $atIndex ");
}

class BinarySearch implements SearchAlgorithm {
  int find<T extends Comparable<T>>(List<T> array, T key) {
    return search(array, key, 0, array.length);
  }

  int search<T extends Comparable<T>>(
      List<T> array, T key, int left, int right) {
    if (right < left) {
      return -1; // this means that the key not found
    }
    // find median
    int median = (left + right) >>> 1;
    int comp = key.compareTo(array[median]);

    if (comp == 0) {
      return median;
    } else if (comp < 0) {
      return search(array, key, left, median - 1);
    } else {
      return search(array, key, median + 1, right);
    }
  }
}
