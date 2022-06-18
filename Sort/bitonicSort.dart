void main(List<String> args) {
  List<int> a = [3, 7, 4, 8, 6, 2, 1, 5];
  int up = 1;

  sort(a, a.length, up);
  print("\nSorted array");
  printArray(a);
}

void compAndSwap(List a, int i, int j, int dir) {
  if ((a[i] > a[j] && dir == 1) || (a[i] < a[j] && dir == 0)) {
    // Swapping elements
    int temp = a[i];
    a[i] = a[j];
    a[j] = temp;
  }
}

void bitonicMerge(List a, int low, int cnt, int dir) {
  if (cnt > 1) {
    int k = cnt ~/ 2;
    for (int i = low; i < low + k; i++) {
      compAndSwap(a, i, i + k, dir);
    }
    bitonicMerge(a, low, k, dir);
    bitonicMerge(a, low + k, k, dir);
  }
}

void bitonicSort(List a, int low, int cnt, int dir) {
  if (cnt > 1) {
    int k = cnt ~/ 2;

    // sort in ascending order since dir here is 1
    bitonicSort(a, low, k, 1);

    // sort in descending order since dir here is 0
    bitonicSort(a, low + k, k, 0);

    // Will merge whole sequence in ascending order
    // since dir=1.
    bitonicMerge(a, low, cnt, dir);
  }
}

void sort(List a, int N, int up) {
  bitonicSort(a, 0, N, up);
}

/* A utility function to print array of size n */
void printArray(List arr) {
  int n = arr.length;
  for (int i = 0; i < n; ++i) {
    print("${arr[i]}  ");
  }
  print('');
}
