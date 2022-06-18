

void main(List<String> args) {
  int n = 5;
  List<int> a = [12, 56, 89, 61, 23];

  MergeSortNoExtraSpace().call_merge_sort(a, n);
  for (int i = 0; i < a.length; i++) {
    print("${a[i]} ");
  }
}

class MergeSortNoExtraSpace {
  void call_merge_sort(List<int> a, int n) {
    int maxele = a.max() + 1;
    merge_sort(a, 0, n - 1, maxele);
  }

  void merge_sort(List<int> a, int start, int end, int maxele) {
    //this function divides the array into 2 halves

    if (start < end) {
      int mid = (start + end) ~/ 2;
      merge_sort(a, start, mid, maxele);
      merge_sort(a, mid + 1, end, maxele);
      implement_merge_sort(a, start, mid, end, maxele);
    }
  }

  void implement_merge_sort(
      List<int> a, int start, int mid, int end, int maxele) {
    //implementation of mergesort
    int i = start;
    int j = mid + 1;
    int k = start;
    while (i <= mid && j <= end) {
      if (a[i] % maxele <= a[j] % maxele) {
        a[k] = a[k] + (a[i] % maxele) * maxele;
        k++;
        i++;
      } else {
        a[k] = a[k] + (a[j] % maxele) * maxele;
        k++;
        j++;
      }
    }
    while (i <= mid) {
      a[k] = a[k] + (a[i] % maxele) * maxele;
      k++;
      i++;
    }
    while (j <= end) {
      a[k] = a[k] + (a[j] % maxele) * maxele;
      k++;
      j++;
    }
    for (i = start; i <= end; i++) {
      a[i] = a[i] ~/ maxele;
    }
  }
}

extension Maks on List {
   max() {
    List a = this;
    int katta = a[0];
    a.forEach((element) {
      if (katta < element) {
        katta = element;
      }
    });
    return katta;
  }
}
