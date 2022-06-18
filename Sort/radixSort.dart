void main(List<String> args) {
  List<int> arr = [170, 45, 75, 90, 802, 24, 2, 66];
  int n = arr.length;
  RadixSort().radixsort(arr, n);
  RadixSort().prints(arr, n);
}

class RadixSort {
  int getMax(List<int> arr, int n) {
    int mx = arr[0];
    for (int i = 1; i < n; i++) {
      if (arr[i] > mx) {
        mx = arr[i];
      }
    }
    return mx;
  }

  void countSort(List<int> arr, int n, int exp) {
    List<int> output = List.filled(n, 0);
    int i;
    List<int> count = List.filled(10, 0);

    for (i = 0; i < n; i++) {
      count[(arr[i] ~/ exp) % 10]++;
    }

    for (i = 1; i < 10; i++) {
      count[i] += count[i - 1];
    }

    for (i = n - 1; i >= 0; i--) {
      output[count[(arr[i] ~/ exp) % 10] - 1] = arr[i];
      count[(arr[i] ~/ exp) % 10]--;
    }

    for (i = 0; i < n; i++) {
      arr[i] = output[i];
    }
  }

  void radixsort(List<int> arr, int n) {
    int m = getMax(arr, n);

    for (int exp = 1; m / exp > 0; exp *= 10) {
      countSort(arr, n, exp);
    }
  }

  void prints(List<int> arr, int n) {
    for (int i = 0; i < n; i++) {
      print("${arr[i]} ");
    }
  }
}
