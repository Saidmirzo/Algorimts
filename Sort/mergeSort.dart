import 'sortAlgorithm.dart';

void main(List<String> args) {
  MergeSort mergeSort = new MergeSort();

        List<int> arr = [4, 23, 6, 78, 1, 54, 231, 9, 12];
        mergeSort.sort<num>(arr);
        for (int i = 0; i < arr.length - 1; ++i) {
             arr[i] <= arr[i + 1];
        }

        List<String> stringArray = ["c", "a", "e", "b", "d"];
        mergeSort.sort(stringArray);
        for (int i = 0; i < stringArray.length - 1; ++i) {
            print( arr[i].compareTo(arr[i + 1]) <= 0);
        }
}

class MergeSort implements SortAlgorithm {

   
      List<T> sort<T extends Comparable<T>>(List<T> unsorted) {
        doSort(unsorted, 0, unsorted.length - 1);
        return unsorted;
    }

   
        doSort<T extends Comparable<T>>(List<T> arr, int left, int right) {
        if (left < right) {
            int mid = (left + right) >>> 1;
            doSort(arr, left, mid);
            doSort(arr, mid + 1, right);
            merge(arr, left, mid, right);
        }
    }

   
       void merge<T extends Comparable<T>>(List<T> arr, int left, int mid, int right) {
        int length = right - left + 1;
        List<T> temp = [];
        int i = left;
        int j = mid + 1;
        int k = 0;

        while (i <= mid && j <= right) {
            if (arr[i].compareTo(arr[j]) <= 0) {
                temp[k++] = arr[i++];
            } else {
                temp[k++] = arr[j++];
            }
        }

        while (i <= mid) {
            temp[k++] = arr[i++];
        }

        while (j <= right) {
            temp[k++] = arr[j++];
        }

        System.arraycopy(temp, 0, arr, left, length);
    }

   
    
}