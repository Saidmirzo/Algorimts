import 'dart:math';

import 'searchAlgoritms.dart';


void main(List<String> args) {
   // just generate data
        Random r = new Random();
       
       
        List<int> integers=[0,1,2,3,4,5,6,7,8,9,10,25,64,98,78,65,12,32,45,02,59,41];
         int size = integers.length;
        // the element that should be found
        int shouldBeFound = integers[r.nextInt(size - 1)];

        IterativeTernarySearch search = new IterativeTernarySearch();
        int atIndex = search.find<num>(integers, shouldBeFound);
        print(" $shouldBeFound, ${integers[atIndex]}, $atIndex, $size");
         

}

 class IterativeTernarySearch implements SearchAlgorithm {

   
      int find<T extends Comparable<T>>(List<T> array, T key) {
        int left = 0;
        int right = array.length - 1;

        while (right > left) {

            int leftCmp = array[left].compareTo(key);
            int rightCmp = array[right].compareTo(key);
            if (leftCmp == 0) {
                return left;
            }
            if (rightCmp == 0) {
                return right;
            }

            int leftThird = left + (right - left) ~/ 3 + 1;
            int rightThird = right - (right - left) ~/ 3 - 1;

            if (array[leftThird].compareTo(key) <= 0) {
                left = leftThird;
            } else {
                right = rightThird;
            }
        }

        return -1;
    }

     
}