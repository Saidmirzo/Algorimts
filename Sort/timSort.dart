


import 'dart:math';

void main(List<String> args) {
   List<int> array = [4, 1, 3, 17, 12, 11, 8];
        TimSort sorterObj1 = new TimSort.bosh();
        TimSort sorterObj2 = new TimSort.length(50);
        TimSort sorterObj3 = new TimSort.arr(array);

        sorterObj1.algorithm();
        sorterObj2.algorithm();
        sorterObj3.algorithm();

        // Testing the first array
        for (int i = 0; i < sorterObj1.array_length - 1; i++) {
            if ((sorterObj1.array[i] <= sorterObj1.array[i + 1])) "Array is not sorted";
        }

        // Testing the second array.
        for (int i = 0; i < sorterObj2.array_length - 1; i++) {
           if(sorterObj2.array[i] <= sorterObj2.array[i + 1])  "Array is not sorted";
        }

        // Testing the third array.
        for (int i = 0; i < sorterObj3.array_length - 1; i++) {
            if((sorterObj3.array[i] <= sorterObj3.array[i + 1])) "Array is not sorted";
        }
}

class TimSort {

    late List<int> array;
    late int array_length;
    int RUN = 32;

   TimSort.arr(List<int> array) {
        this.array = array;
        this.array_length = array.length;
    }

   
     TimSort.length(int array_length) {
        Random rand =  Random();

        this.array_length = array_length;
        this.array = List.filled(this.array_length, 0) ;

        for (int i = 0; i < this.array_length; i++) {
            int random_number = rand.nextInt(1000);
            this.array[i] = random_number;
        }
    }

   
     void change_run(int run) {
        this.RUN = run;
    }

   
     TimSort.bosh() {
        this.array_length = 100;
        this.array = List.filled(this.array_length, 0);

        Random rand = new Random();
        for (int i = 0; i < this.array_length; i++) {
            int random_number = rand.nextInt(1000);
            this.array[i] = random_number;
        }
    }

     void insertion_sort(List<int> array, int start_idx, int end_idx) {
        for (int i = start_idx; i <= end_idx; i++) {
            int current_element = array[i];
            int j = i - 1;
            while (j >= start_idx && array[j] > current_element) {
                array[j + 1] = array[j];
                j--;
            }
            array[j + 1] = current_element;
        }
    }

   
     void merge_runs(List<int> array, int start, int mid, int end) {

        int first_array_size = mid - start + 1, second_array_size = end - mid;
        List<int> array1 = List.filled(first_array_size, 0) , array2 =  List.filled(second_array_size, 0) ;
        int i = 0, j = 0, k = 0;

        // Building the two sub arrays from the array to merge later
        for (i = 0; i < first_array_size; i++) {
            array1[i] = array[start + i];
        }
        for (i = 0; i < second_array_size; i++) {
            array2[i] = array[mid + 1 + i];
        }

        i = 0;
        j = 0;
        k = start;

        while (i < first_array_size && j < second_array_size) {
            if (array1[i] <= array2[j]) {
                array[k] = array1[i];
                i++;
            } else {
                array[k] = array2[j];
                j++;
            }
            k++;
        }

        while (i < first_array_size) {
            array[k] = array1[i];
            k++;
            i++;
        }

        while (j < second_array_size) {
            array[k] = array2[j];
            k++;
            j++;
        }
    }

    
     void algorithm() {
        // Before Sorting
        print("Before sorting the array: ");
        this.showArrayElements();
        print('');

        // Applying insertion sort on RUNS.
        for (int i = 0; i < this.array_length; i += this.RUN) {
            this.insertion_sort(this.array, i,min(i + this.RUN, (this.array_length - 1)));
        }

        for (int split = this.RUN; split < this.array_length; split = 2 * split) {
            for (int start_idx = 0; start_idx < this.array_length; start_idx += 2 * split) {
                int mid = start_idx + split - 1;
                int end_idx = min((start_idx + 2 * split - 1), (this.array_length - 1));

                this.merge_runs(this.array, start_idx, mid, end_idx);
            }
        }
        // After sorting
        print("\nAfter sorting the array: ");
        this.showArrayElements();
        print('');
    }

   
     void showArrayElements() {
        for (int i = 0; i < this.array.length; i++) {
            print("${this.array[i]} ");
        }
        print('');
    }

    
}
