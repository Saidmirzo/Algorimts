import 'sortAlgorithm.dart';
import 'sortUtils.dart';

void main(List<String> args) {
  CircleSort CSort = new CircleSort();

  List<int> arr = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  CSort.sort<num>(arr);
  for (int i = 0; i < arr.length - 1; ++i) {
    arr[i] <= arr[i + 1];
  }

  List<String> stringArray = ["c", "a", "e", "b", "d"];
  CSort.sort(stringArray);
  for (int i = 0; i < stringArray.length - 1; ++i) {
    arr[i].compareTo(arr[i + 1]) <= 0;
  }
  print(arr);
}

class CircleSort implements SortAlgorithm {
 
  List<T> sort<T extends Comparable<T>>(List<T> array) {
    int n = array.length;
    while (doSort(array, 0, n - 1));
    return array;
  }

 
  bool doSort<T extends Comparable<T>>(List<T> array, int left, int right) {
    bool swapped = false;

    if (left == right) {
      return false;
    }

    int low = left;
    int high = right;

    while (low < high) {
      if (array[low].compareTo(array[high]) > 0) {
        SortUtils().swap(array, low, high);
        swapped = true;
      }
      low++;
      high--;
    }

    if (low == high && array[low].compareTo(array[high + 1]) > 0) {
      SortUtils().swap(array, low, high + 1);
      swapped = true;
    }

    int mid = left + (right - left) ~/ 2;
    bool leftHalf = doSort(array, left, mid);
    bool rightHalf = doSort(array, mid + 1, right);

    return swapped || leftHalf || rightHalf;
  }
}
