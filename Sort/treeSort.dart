import 'sortAlgorithm.dart';

void main(List<String> args) {
   TreeSort treeSort = new TreeSort();

        // ==== Integer Array =======
        print("\nTesting for Integer Array....");
        List<int> a = [3, -7, 45, 1, 343, -5, 2, 9];
        print( "unsorted: \n$a");
       
        a = treeSort.sort<num>(a);
        print( "sorted: \n$a");
        print('');

        // ==== Integer List =======
        print("\nTesting for Integer List....");
        List<int> intList = [3, -7, 45, 1, 343, -5, 2, 9];
        print("unsorted: $intList");
        print(intList);
        intList = treeSort.sort<num>(intList);
        print("sorted: $intList");
        print(intList);
       print('');

        // ==== String Array =======
        print("\nTesting for String Array....");
        List<String> b = ["banana", "berry", "orange", "grape", "peach", "cherry", "apple", "pineapple"];
        print("unsorted: \n$b");
        b = treeSort.sort<String>(b);
        print( "sorted: \n$b");
        print('');

        // ==== String List =======
        print("\nTesting for String List....");
        List<String> stringList = ["banana", "berry", "orange", "grape", "peach", "cherry", "apple", "pineapple"];
       print("unsorted: $stringList");
        print(stringList);
        stringList = treeSort.sort<String>(stringList);
        print( "sorted: $stringList");
        
    
}

 class TreeSort implements SortAlgorithm {

   
      List<T> sort<T extends Comparable<T>>(List<T> unsortedArray) {
        return doTreeSortArray(unsortedArray);
    }

    
      sort<T extends Comparable<T>> List<T>(List<T> unsortedList) {
        return doTreeSortList(unsortedList);
    }

      List<T> doTreeSortArray<T extends Comparable<T>>(List<T> unsortedArray) {
        // create a generic BST tree
        BSTRecursiveGeneric<T> tree = new BSTRecursiveGeneric<T>();

        // add all elements to the tree
        for (T element in unsortedArray) {
            tree.add(element);
        }

        // get the sorted list by inorder traversal of the tree
        List<T> sortedList = tree.inorderSort();

        // add the elements back to the initial array
        int i = 0;
        for (T element in sortedList) {
            unsortedArray[i++] = element;
        }

        // return the array
        return unsortedArray;
    }

      List<T> doTreeSortList<T extends Comparable<T>>(List<T> unsortedList) {
        // create a generic BST tree
        BSTRecursiveGeneric<T> tree = new BSTRecursiveGeneric<T>();

        // add all elements to the tree
        for (T element in unsortedList) {
            tree.add(element);
        }

        // get the sorted list by inorder traversal of the tree and return it
        return tree.inorderSort();
    }

  
       

}