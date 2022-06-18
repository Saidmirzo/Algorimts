import 'sortAlgorithm.dart';
import 'sortUtils.dart';


void main(List<String> args) {
  SlowSort slowSort = new SlowSort();

        List<int> integerArray = [8, 84, 53, 953, 64, 2, 202, 98];
        // Print integerArray unsorted
        print(integerArray);

        slowSort.sort<num>(integerArray);
        // Print integerArray sorted
        print(integerArray);

        List<String> stringArray = ["g", "d", "a", "b", "f", "c", "e"];
        // Print stringArray unsorted
        print(stringArray);

        slowSort.sort(stringArray);
        // Print stringArray sorted
        print(stringArray);
}

 class SlowSort implements SortAlgorithm {

   
      List<T> sort<T extends Comparable<T>>(List<T> unsortedArray) {
        sorted(unsortedArray, 0, unsortedArray.length - 1);
        return unsortedArray;
      }
     
      void sorted<T extends Comparable<T>>(List<T> array, int i, int j) {
        if (SortUtils().greaterOrEqual<num>(i, j)) {
            return;
        }
        int m = (i + j) ~/ 2;
        sorted(array, i, m);
        sorted(array, m + 1, j);
        if (SortUtils().less(array[j], array[m])) {
            T temp = array[j];
            array[j] = array[m];
            array[m] = temp;
        }
        sorted(array, i, j - 1);
    }
}