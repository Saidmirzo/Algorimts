import 'dart:math';
import 'sortUtils.dart';
import 'sortAlgorithm.dart';

void main(List<String> args) {
   // Integer Input
        List<int> integers = [4, 23, 6, 78, 1, 54, 231, 9, 12];

        BogoSort bogoSort = new BogoSort();

        // print a sorted array
        print(bogoSort.sort<num>(integers));

        // String Input
        List<String> strings = ["c", "a", "e", "b", "d"];

        print(bogoSort.sort(strings));
}
class BogoSort implements SortAlgorithm {

     static final Random random = new Random();

     bool isSorted<T extends Comparable<T>> (List<T> array) {
        for (int i = 0; i < array.length - 1; i++) {
            if (SortUtils().less(array[i + 1], array[i])) {
                return false;
            }
        }
        return true;
    }

    // Randomly shuffles the array
       void nextPermutation<T>(List<T> array) {
        int length = array.length;

        for (int i = 0; i < array.length; i++) {
            int randomIndex = i + random.nextInt(length - i);
            SortUtils().swap(array, randomIndex, i);
        }
    }

      List<T> sort<T extends Comparable<T>>(List<T> array) {
        while (!isSorted(array)) {
            nextPermutation(array);
        }
        return array;
    }

    // Driver Program
   
}