import 'sortAlgorithm.dart';
import 'sortUtils.dart';


void main(List<String> args) {
  StoogeSort stoogeSort = new StoogeSort();

        List<int> integerArray = [8, 84, 53, 953, 64, 2, 202];
        // Print integerArray unsorted
        print(integerArray);

        stoogeSort.sort<num>(integerArray);
        // Print integerArray sorted
        print(integerArray);

        List<String> stringArray = ["g", "d", "a", "b", "f", "c", "e"];
        // Print stringArray unsorted
        print(stringArray);

        stoogeSort.sort(stringArray);
        // Print stringArray sorted
        print(stringArray);
}

 class StoogeSort implements SortAlgorithm {

    
      List<T> sort<T extends Comparable<T>>(List<T> unsortedArray) {
        sorted(unsortedArray, 0, unsortedArray.length);
        return unsortedArray;
    }

      List<T> sorted<T extends Comparable<T>>(List<T> unsortedArray, int start, int end) {
        if (SortUtils().less(unsortedArray[end - 1], unsortedArray[start])) {
            T temp = unsortedArray[start];
            unsortedArray[start] = unsortedArray[end - 1];
            unsortedArray[end - 1] = temp;
        }

        int len = end - start;
        if (len > 2) {
            int third = len ~/ 3;
            sorted(unsortedArray, start, end - third);
            sorted(unsortedArray, start + third, end);
            sorted(unsortedArray, start, end - third);
        }
        return unsortedArray;
    }

    
}
