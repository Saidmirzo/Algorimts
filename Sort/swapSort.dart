import 'sortAlgorithm.dart';
import 'sortUtils.dart';


void main(List<String> args) {
  List<int> a = [3, 7, 45, 1, 33, 5, 2, 9];
        print("unsorted: ");
        print(a);
        print('');

        new SwapSort().sort<num>(a);
        print("sorted: ");
        print(a);
        print('');

        // ==== String =======
        List<String> b = ["banana", "berry", "orange", "grape", "peach", "cherry", "apple", "pineapple"];
        print("unsorted: ");
        print(b);
        print('');

        new SwapSort().sort(b);
        print("sorted: ");
        print(b);
}

 class SwapSort implements SortAlgorithm {

   
      List<T> sort<T extends Comparable<T>>(List<T> array) {
        int LENGTH = array.length;
        int index = 0;

        while (index < LENGTH - 1) {
            int amountSmallerElements = this.getSmallerElementCount(array, index);

            if (amountSmallerElements > 0 && index != amountSmallerElements) {
                T element = array[index];
                array[index] = array[amountSmallerElements];
                array[amountSmallerElements] = element;
            } else {
                index++;
            }
        }

        return array;
    }

      int getSmallerElementCount<T extends Comparable<T>>(List<T> array, int index) {
        int counter = 0;
        for (int i = 0; i < array.length; i++) {
            if (SortUtils().less(array[i], array[index])) {
                counter++;
            }
        }

        return counter;
    }

}
