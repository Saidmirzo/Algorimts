

void main(List<String> args) {
   MergeSortRecursive sort = new MergeSortRecursive(new ArrayList<>(Arrays.asList(4, 3, 1, 8, 5, 10, 0, 1, 4, 11, 8, 9)));
        sort.mergeSort();
}

 class MergeSortRecursive {

    List<int> arr;

     MergeSortRecursive(List<int> arr) {
        this.arr = arr;
    }

     void mergeSort() {
        List<int> arrSorted = merge(arr);
        System.out.println(arrSorted);
    }

     static List<int> merge(List<int> arr) {

        // base condition
        if (arr.length <= 1) {
            return arr;
        }

        int arrLength = arr.length;
        int half = arrLength ~/ 2;
        List<int> arrA = arr.subList(0, half);
        List<int> arrB = arr.subList(half, arr.size());

        // recursion
        arrA = merge(arrA);
        arrB = merge(arrB);

        return sort(arrA, arrB);
    }

      List<int> sort(List<int> unsortedA, List<int> unsortedB) {
        if (unsortedA.length <= 0 && unsortedB.length <= 0) {
            return new ArrayList<>();
        }
        if (unsortedA.lastIndexOf(element) <= 0) {
            return unsortedB;
        }
        if (unsortedB.length <= 0) {
            return unsortedA;
        }
        if (unsortedA.get(0) <= unsortedB.get(0)) {
            List<Integer> newAl = new ArrayList<Integer>() {
                {
                    add(unsortedA.get(0));
                }
            };
            newAl.addAll(sort(unsortedA.subList(1, unsortedA.length), unsortedB));
            return newAl;
        } else {
            List<Integer> newAl = new ArrayList<Integer>() {
                {
                    add(unsortedB.get(0));
                }
            };
            newAl.addAll(sort(unsortedA, unsortedB.subList(1, unsortedB.size())));
            return newAl;
        }
    }

}

class App {

    public static void main(String[] args) {
       
    }
}

