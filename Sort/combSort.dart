import 'sortAlgorithm.dart';
import 'sortUtils.dart';

void main(List<String> args) {
   CombSort ob = new CombSort();
        List<int> arr = [8, 4, 1, 56, 3, -44, -1, 0, 36, 34, 8, 12, -66, -78, 23, -6, 28, 0];
        ob.sort<num>(arr);

       print("sorted array");
        print(arr);
}

class CombSort implements SortAlgorithm {

    // To find gap between elements
     int nextGap(int gap) {
        // Shrink gap by Shrink factor
        gap = (gap * 10) ~/ 13;
        return (gap < 1) ? 1 : gap;
    }

 
      List<T> sort<T extends Comparable<T>>(List<T> arr) {
        int size = arr.length;

        // initialize gap
        int gap = size;

        // Initialize swapped as true to make sure that loop runs
        bool swapped = true;

        // Keep running while gap is more than 1 and last iteration caused a swap
        while (gap != 1 || swapped) {
            // Find next gap
            gap = nextGap(gap);

            // Initialize swapped as false so that we can check if swap happened or not
            swapped = false;

            // Compare all elements with current gap
            for (int i = 0; i < size - gap; i++) {
                if (SortUtils().less(arr[i + gap], arr[i])) {
                    // Swap arr[i] and arr[i+gap]
                    swapped = SortUtils().swap(arr, i, i + gap);
                }
            }
        }
        return arr;
    }

  
}