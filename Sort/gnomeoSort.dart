import 'sortAlgorithm.dart';
import 'sortUtils.dart';

void main(List<String> args) {
  List<int> integers = [4, 23, 6, 78, 1, 26, 11, 23, 0, -6, 3, 54, 231, 9, 12];
  List<String> strings = [
    "c",
    "a",
    "e",
    "b",
    "d",
    "dd",
    "da",
    "zz",
    "AA",
    "aa",
    "aB",
    "Hb",
    "Z"
  ];
  GnomeSort gnomeSort = new GnomeSort();

  gnomeSort.sort<num>(integers);
  gnomeSort.sort<String>(strings);

  print("After sort : ");
  print(integers);
  print(strings);
}

class GnomeSort with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsorted) {
    int i = 1;
    int j = 2;
    while (i < unsorted.length) {
      if (less(unsorted[i - 1], unsorted[i])) {
        i = j++;
      } else {
        SortUtils().swap(unsorted, i - 1, i);
        if (--i == 0) {
          i = j++;
        }
      }
    }

    return null;
  }
}
