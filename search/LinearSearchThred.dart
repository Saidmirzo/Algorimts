

import 'dart:math';

void main(List<String> args) {
   List<int> list =List.filled(200, Random.secure().nextInt(100));
       
        for (int y in list) {
           print("$y ");
        }
        print('');
       
        int x = 5;
        Searcher t = new Searcher(list, 0, 50, x);
        Searcher t1 = new Searcher(list, 50, 100, x);
        Searcher t2 = new Searcher(list, 100, 150, x);
        Searcher t3 = new Searcher(list, 150, 200, x);
        t.start();
        t1.start();
        t2.start();
        t3.start();
        try {
            t.join();
            t1.join();
            t2.join();
            t3.join();
        } catch (e) {
        }
        bool found = t.getResult() || t1.getResult() || t2.getResult() || t3.getResult();
       print("Found = $found");
}

 

class Searcher   {
     

    Searcher(this.arr, this.left, this.right, this.x);
     late List<int> arr;
     late int left, right;
     late int x;
    late bool found;   
    

    
     void run() {
        int k = left;
        found = false;
        while (k < right && !found) {
            if (arr[k++] == x) {
                found = true;
            }
        }
    }

    bool getResult() {
        return found;
    }
}