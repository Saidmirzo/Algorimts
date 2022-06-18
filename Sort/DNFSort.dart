void main(List<String> args) {
  DNFSort dnfSort=DNFSort();
  List<int> arr = [0, 1, 1, 0, 1, 2, 1, 2, 0, 0, 0, 1];
        int arr_size = arr.length;
        dnfSort.sort012(arr, arr_size);
        print("Array after seggregation ");
        DNFSort.printArray(arr, arr_size);
}

 class DNFSort {

    // Sort the input array, the array is assumed to
    // have values in {0, 1, 2}
     void sort012(List<int> a, int arr_size) {
        int low = 0;
        int high = arr_size - 1;
        int mid = 0, temp = 0;
        while (mid <= high) {
            switch (a[mid]) {
                case 0: {
                    temp = a[low];
                    a[low] = a[mid];
                    a[mid] = temp;
                    low++;
                    mid++;
                    break;
                }
                case 1:
                    mid++;
                    break;
                case 2: {
                    temp = a[mid];
                    a[mid] = a[high];
                    a[high] = temp;
                    high--;
                    break;
                }
            }
        }
    }

    /* Utility function to print array arr[] */
    static void printArray(List<int> arr, int arr_size) {
        for (int i = 0; i < arr_size; i++) {
            print("${arr[i]}  ");
        }
        print("");
    }

   
}