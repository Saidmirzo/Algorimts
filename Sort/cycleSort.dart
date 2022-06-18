import 'sortAlgorithm.dart';
import 'sortUtils.dart';

void main(List<String> args) {
  List<int> arr = [
    8,
    4,
    1,
    56,
    3,
    -44,
    -1,
    0,
    36,
    34,
    8,
    12,
    -66,
    -78,
    23,
    -6,
    28,
    0
  ];
  CycleSort cycleSort = CycleSort();
  print(cycleSort.sort<num>(arr));
}

class CycleSort implements SortAlgorithm {
  List<T> sort<T extends Comparable<T>>(List<T> arr) {
    int n = arr.length;

    // traverse array elements
    for (int j = 0; j <= n - 2; j++) {
      // initialize item as starting point
      T item = arr[j];

      // Find position where we put the item.
      int pos = j;
      for (int i = j + 1; i < n; i++) {
        if (SortUtils().less(arr[i], item)) {
          pos++;
        }
      }

      // If item is already in correct position
      if (pos == j) {
        continue;
      }

      // ignore all duplicate elements
      while (item.compareTo(arr[pos]) == 0) {
        pos += 1;
      }

      // put the item to it's right position
      if (pos != j) {
        item = replace(arr, pos, item);
      }

      // Rotate rest of the cycle
      while (pos != j) {
        pos = j;

        // Find position where we put the element
        for (int i = j + 1; i < n; i++) {
          if (SortUtils().less(arr[i], item)) {
            pos += 1;
          }
        }

        // ignore all duplicate elements
        while (item.compareTo(arr[pos]) == 0) {
          pos += 1;
        }

        // put the item to it's right position
        if (item != arr[pos]) {
          item = replace(arr, pos, item) as T;
        }
      }
    }

    return arr;
  }

  T replace<T extends Comparable<T>>(List<T> arr, int pos, T item) {
    T temp = item;
    item = arr[pos];
    arr[pos] = temp;
    return item;
  }
}
        