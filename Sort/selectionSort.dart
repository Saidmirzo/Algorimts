import 'sortAlgorithm.dart';


void main(List<String> args) {
  List<int> arr = [4, 23, 6, 78, 1, 54, 231, 9, 12];
        SelectionSort selectionSort = new SelectionSort();
        List<int> sorted = selectionSort.sort<num>(arr);
        for (int i = 0; i < sorted.length - 1; ++i) {
             sorted[i] <= sorted[i + 1];
        }

        List<String> strings = ["c", "a", "e", "b", "d"];
        List<String> sortedStrings = selectionSort.sort(strings);
        for (int i = 0; i < sortedStrings.length - 1; ++i) {
             strings[i].compareTo(strings[i + 1]) <= 0;
        }
}

 class SelectionSort implements SortAlgorithm {

   
    sort<T extends Comparable<T>>(List<T> arr) {
        int n = arr.length;
        for (int i = 0; i < n - 1; i++) {
            int minIndex = i;
            for (int j = i + 1; j < n; j++) {
                if (arr[minIndex].compareTo(arr[j]) > 0) {
                    minIndex = j;
                }
            }
            if (minIndex != i) {
                T temp = arr[i];
                arr[i] = arr[minIndex];
                arr[minIndex] = temp;
            }
        }
        return arr;
    }

    
    
}