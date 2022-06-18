import 'sortAlgorithm.dart';
import 'sortUtils.dart';

void main(List<String> args) {
  List<int> integers = [4, 23, 6, 78, 1, 54, 231, 9, 12];
        InsertionSort sort = new InsertionSort();
        sort.sort<num>(integers);
        print(integers);
        /* [1, 4, 6, 9, 12, 23, 54, 78, 231] */

        List<String> strings = ["c", "a", "e", "b", "d"];
        sort.sort(strings);
        print(strings);
        /* [a, b, c, d, e] */
}

class InsertionSort implements SortAlgorithm {

   
      List<T> sort<T extends Comparable<T>>(List<T> array) {
        for (int i = 1; i < array.length; i++) {
            T insertValue = array[i];
            int j;
            for (j = i - 1; j >= 0 && SortUtils().less(insertValue, array[j]); j--) {
                array[j + 1] = array[j];
            }
            if (j != i - 1) {
                array[j + 1] = insertValue;
            }
        }
        return array;
    }

    /**
     * Driver Code
     */
   
}