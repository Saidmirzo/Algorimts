


void main(List<String> args) {
  PigeonholeSort pigeonholeSort = new PigeonholeSort();
        List<int> arr = [ 8, 3, 2, 7, 4, 6, 8 ];

       print("Unsorted order is : ");
        print(arr);

        pigeonholeSort.sort(arr);
        
        print("Sorted order is : ");
        for (int i = 0; i < arr.length; i++) {
             (arr[i]) <= (arr[i+1]);
        }
        print(arr);
    
}

 class PigeonholeSort {
   
    void sort(List<int> array){
        int maxElement = array[0];
        for (int element in array) {
            if (element > maxElement) maxElement = element;
        }

        int numOfPigeonholes = 1 + maxElement;
        List<int> pigeonHole =  List.filled(numOfPigeonholes, 0) ;

        for (int k=0; k<numOfPigeonholes; k++) {
            pigeonHole[k] =  List<int>;
        }

        for (int t in array) {
            pigeonHole[t].add(t);
        }

        int k=0;
        for (ArrayList<Integer> ph in pigeonHole) {
            for (int elements in ph) {
                array[k]=elements;
                k=k+1;
            }
        }
    }

      
        
}