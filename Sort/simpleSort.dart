import 'sortAlgorithm.dart';
import 'sortUtils.dart';


void main(List<String> args) {
  // ==== Int =======
        List<int> a = [3, 7, 45, 1, 33, 5, 2, 9];
        print("unsorted: ");
        print(a);
        print('');

        new SimpleSort().sort<num>(a);
        print("sorted: ");
        print(a);
        print('');

        // ==== String =======
        List<String> b = ["banana", "berry", "orange", "grape", "peach", "cherry", "apple", "pineapple"];
        print("unsorted: ");
        print(b);
        print('');

        new SimpleSort().sort(b);
        print("sorted: ");
        print(b);
}

 class SimpleSort implements SortAlgorithm {

   
      List<T> sort<T extends Comparable<T>>(List<T> array) {
        final int LENGTH = array.length;

        for (int i = 0; i < LENGTH; i++) {
            for (int j = i + 1; j < LENGTH; j++) {
                if (SortUtils().less(array[j], array[i])) {
                    T element = array[j];
                    array[j] = array[i];
                    array[i] = element;
                }
            }
        }

        return array;
    }

    
}