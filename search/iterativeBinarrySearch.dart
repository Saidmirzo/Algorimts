import 'dart:math';

import 'searchAlgoritms.dart';

void main(List<String> args) {
  Random r = new Random();
  
  int maxElement = 100000;
  List<int> integers = [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    25,
    36,
    95,
    78,
    41,
    25,
    36
  ];
  int size = integers.length;
  // the element that should be found
  int shouldBeFound = integers[r.nextInt(size - 1)];

  IterativeBinarySearch search = new IterativeBinarySearch();
  int atIndex = search.find<num>(integers, shouldBeFound);

  print(" $shouldBeFound, ${integers[atIndex]}, $atIndex, $size");

}

class IterativeBinarySearch implements SearchAlgorithm {
  int find<T extends Comparable<T>>(List<T> array, T key) {
    int l, r, k, cmp;

    l = 0;
    r = array.length - 1;

    while (l <= r) {
      k = (l + r) >>> 1;
      cmp = key.compareTo(array[k]);

      if (cmp == 0) {
        return k;
      } else if (cmp < 0) {
        r = --k;
      } else {
        l = ++k;
      }
    }

    return -1;
  }
}
