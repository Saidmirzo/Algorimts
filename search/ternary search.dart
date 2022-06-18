
import 'dart:math';

import 'searchAlgoritms.dart';


void main(List<String> args) {
   // just generate data
        Random r = new Random();
   
        List<int> integers=[0,1,2,3,4,5,6,7,8,9,10,2,85,3,966,78,4,9,54,8,2,98,21,98,1,6];
        int size = integers.length;

        // the element that should be found
        int shouldBeFound = integers[r.nextInt(size - 1)];

        TernarySearch search = new TernarySearch();
        int atIndex = search.find<num>(integers, shouldBeFound);

       print("$shouldBeFound,  ${integers[atIndex]},  $atIndex,  $size");

      
}

 class TernarySearch implements SearchAlgorithm {

    
      int find<T extends Comparable<T>>(List<T> arr, T value) {
        return ternarySearch(arr, value, 0, arr.length - 1);
    }

     int ternarySearch <T extends Comparable<T>>(List<T> arr, T key, int start, int end) {
        if (start > end) {
            return -1;
        }
        /* First boundary: add 1/3 of length to start */
        int mid1 = start + (end - start) ~/ 3;
        /* Second boundary: add 2/3 of length to start */
        int mid2 = start + 2 * (end - start) ~/ 3;

        if (key.compareTo(arr[mid1]) == 0) {
            return mid1;
        } else if (key.compareTo(arr[mid2]) == 0) {
            return mid2;
        } /* Search the first (1/3) rd part of the array.*/ else if (key.compareTo(arr[mid1]) < 0) {
            return ternarySearch(arr, key, start, --mid1);
        } /* Search 3rd (1/3)rd part of the array */ else if (key.compareTo(arr[mid2]) > 0) {
            return ternarySearch(arr, key, ++mid2, end);
        } /* Search middle (1/3)rd part of the array */ else {
            return ternarySearch(arr, key, mid1, mid2);
        }
    }

    
}