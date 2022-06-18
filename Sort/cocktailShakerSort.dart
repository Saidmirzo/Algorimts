import 'sortUtils.dart';
import 'sortAlgorithm.dart';

void main(List<String> args) {
   List<int> integers = [4, 23, 6, 78, 1, 54, 231, 9, 12];
        CocktailShakerSort shakerSort = new CocktailShakerSort();

        // Output => 1 4 6 9 12 23 54 78 231
        print(shakerSort.sort<num>(integers));

        // String Input
        List<String> strings = ["c", "a", "e", "b", "d"];
        print(shakerSort.sort(strings));
}
class CocktailShakerSort implements SortAlgorithm {

   
      List<T> sort<T extends Comparable<T>>(List<T> array) {

        int length = array.length;
        int left = 0;
        int right = length - 1;
        int swappedLeft, swappedRight;
        while (left < right) {
            // front
            swappedRight = 0;
            for (int i = left; i < right; i++) {
                if (SortUtils().less(array[i + 1], array[i])) {
                    SortUtils().swap(array, i, i + 1);
                    swappedRight = i;
                }
            }
            // back
            right = swappedRight;
            swappedLeft = length - 1;
            for (int j = right; j > left; j--) {
                if (SortUtils().less(array[j], array[j - 1])) {
                    SortUtils().swap(array, j - 1, j);
                    swappedLeft = j;
                }
            }
            left = swappedLeft;
        }
        return array;
    }

    // Driver Program
     static void main(List<String> args) {
        // Integer Input
       
    }
}