import 'dart:math';

void main(List<String> args) {
  Random r = new Random();
  List<int> integers = [0, 51, 26, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  int size = integers.length;

  
  int shouldBeFound = integers[r.nextInt(size - 1)];

  InterpolationSearch search = new InterpolationSearch();
  int atIndex = search.find(integers, 5);

  print("$shouldBeFound, ${integers[atIndex]}, $atIndex, $size");
}

class InterpolationSearch {
  int find(List<int> array, int key) {
    int start = 0, end = (array.length - 1);
    int pos;

    while (start <= end && key >= array[start] && key <= array[end]) {
      pos = start +
          (((end - start) ~/ (array[end] - array[start])) *
              (key - array[start]));

     
      if (array[pos] == key) {
        return pos;
      }

     
      if (array[pos] < key) {
        start = pos + 1;
      } 
      else {
        end = pos - 1;
      }
    }
    return -1;
  }
}
