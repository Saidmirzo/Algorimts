import 'dart:math';

import 'searchAlgoritms.dart';


void main(List<String> args) {
  // Just generate data
        Random r = Random.secure();

     
        int maxElement = 100000;

        List<int> integers=[0,1,2,3,4,5,6,7,8,9,10,20,30,50,60,48,56,21,35,64,98,41];
           int size = 100;

        // The element for which the lower bound is to be found
        int val = integers[r.nextInt(size - 1)] + 1;

        LowerBound search = new LowerBound();
        int atIndex = search.find<num>(integers, val);

        print("$val, ${integers[atIndex]}, $atIndex, $size");

       
}
 class LowerBound implements SearchAlgorithm {

    

   
      int find<T extends Comparable<T>>(List<T> array, T key) {
        return search(array, key, 0, array.length - 1);
    }

      int search<T extends Comparable<T>>(List<T> array, T key, int left, int right) {
        if (right <= left) {
            return left;
        }

        // find median
        int median = (left + right) >>> 1;
        int comp = key.compareTo(array[median]);

        if (comp == 0) {
            return median;
        } else if (comp < 0) {
            // median position can be a possible solution
            return search(array, key, left, median);
        } else {
            // key we are looking is greater, so we must look on the right of median position
            return search(array, key, median + 1, right);
        }
    }
}