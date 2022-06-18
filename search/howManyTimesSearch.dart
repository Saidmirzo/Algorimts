import 'dart:math';

void main(List<String> args) {
  Random r = Random.secure();
  List<int> a = List.filled(3, r.nextInt(5));
  print("The array has been rotated ${HowManyTimesRotated().rotated(a)}  times");
  
}

class HowManyTimesRotated {
  int rotated(List<int> a) {
    int low = 0;
    int high = a.length - 1;
    int mid = 0; // low + (high-low)/2 = (low + high)/2

    while (low <= high) {
      mid = low + (high - low) ~/ 2;

      if (a[mid] < a[mid - 1] && a[mid] < a[mid + 1]) {
        break;
      } else if (a[mid] > a[mid - 1] && a[mid] < a[mid + 1]) {
        high = mid + 1;
      } else if (a[mid] > a[mid - 1] && a[mid] > a[mid + 1]) {
        low = mid - 1;
      }
    }

    return mid;
  }
}
