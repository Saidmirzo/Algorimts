import 'dart:math';

import 'sortAlgorithm.dart';
import 'sortUtils.dart';

void main(List<String> args) {
   
        List<int> array = [3, 4, 1, 32, 0, 1, 5, 12, 2, 5, 7, 8, 9, 2, 44, 111, 5];

        QuickSort quickSort = new QuickSort();
        quickSort.sort<num>(array);

        // Output => 0 1 1 2 2 3 4 5 5 5 7 8 9 12 32 44 111
        print(array);

       List<String> stringArray = ["c", "a", "e", "b", "d"];
        quickSort.sort(stringArray);

        // Output => a	b	c	d	e
        print(stringArray);
    
}
class QuickSort implements SortAlgorithm {

   
      List<T> sort<T extends Comparable<T>>(List<T> array) {
        doSort(array, 0, array.length - 1);
        return array;
    }

    
       void doSort<T extends Comparable<T>>(List<T> array, int left, int right) {
        if (left < right) {
            int pivot = randomPartition(array, left, right);
            doSort(array, left, pivot - 1);
            doSort(array, pivot, right);
        }
    }

   
       int randomPartition<T extends Comparable<T>>(List<T> array, int left, int right) {
        int randomIndex = left +  (Random.secure().nextInt((right - left + 1)));
        SortUtils().swap(array, randomIndex, right);
        return partition(array, left, right);
    }

  
       int partition<T extends Comparable<T>>(List<T>  array, int left, int right) {
        int mid = (left + right) >>> 1;
        T pivot = array[mid];

        while (left <= right) {
            while (SortUtils().less(array[left], pivot)) {
                ++left;
            }
            while (SortUtils().less(pivot, array[right])) {
                --right;
            }
            if (left <= right) {
                SortUtils().swap(array, left, right);
                ++left;
                --right;
            }
        }
        return left;
    }
       
}