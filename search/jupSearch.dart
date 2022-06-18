import 'dart:math';

import 'searchAlgoritms.dart';


void main(List<String> args) {
  JumpSearch jumpSearch = new JumpSearch();
        List<int> array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        for (int i = 0; i < array.length; i++) {
             print(jumpSearch.find<num>(array, i) == i);
        }
         print( jumpSearch.find<num>(array, -1));
         print(jumpSearch.find<num>(array, 11) );
}

 class JumpSearch implements SearchAlgorithm {

     

    
      int find<T extends Comparable<T>>(List<T> array, T key) {
        int length = array.length;
        /* length of array */
        int blockSize = sqrt(length).round();
        /* block size to be jumped */

        int limit = blockSize;
        while (key.compareTo(array[limit]) > 0 && limit < array.length - 1) {
            limit =min(limit + blockSize, array.length - 1);
        }

        for (int i = limit - blockSize; i <= limit; i++) {
            if (array[i] == key) {
               
                return i;
            }
        }
        return -1;
       
    }
}