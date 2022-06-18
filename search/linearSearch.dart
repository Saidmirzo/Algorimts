import 'dart:math';

import 'searchAlgoritms.dart';


void main(List<String> args) {
   // just generate data
        Random r = new Random();
       
        int maxElement = 100;
        List<int> integers=[0,1,2,3,4,5,6,7,8,9,10,25,654,98,78,45,32,15,26,48,59];
         int size = integers.length;

        // the element that should be found
        int shouldBeFound = integers[r.nextInt(size - 1)];

        LinearSearch search = new LinearSearch();
        int atIndex = search.find<num>(integers, shouldBeFound);

      print("$shouldBeFound, ${integers[atIndex]}, $atIndex, $size");
}

 class LinearSearch implements SearchAlgorithm {

      int find<T extends Comparable<T>>(List<T> array, T value) {
        for (int i = 0; i < array.length; i++) {
            if (array[i].compareTo(value) == 0) {
                return i;
            }
        }
        return -1;
    }

     
}