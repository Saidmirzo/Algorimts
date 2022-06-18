import 'dart:math';

void main(List<String> args) {
  // List<Comparable> a = [32, 65, 45, 12, 98, 0, 1, 2, 3, 45, 5, 6, 7, 8, 9];
  // QuickSelect().select(a, 5);
}

class QuickSelect {
  T select<T extends Comparable<T>>(List<T> list, int n) {
    if (list.length == 0) {
      String msg = "The list of elements must not be empty.";
      throw "bo'sh";
    }

    if (n < 0) {
      String msg = "The index must not be negative.";
      throw "uzunligi yo'q";
    }

    if (n >= list.length) {
      String msg = "The index must be less than the number of elements.";
      throw 'kichiuk';
    }

    int index = selectIndex(list, n);
    return list[index];
  }

  int selectIndex<T extends Comparable<T>>(List<T> list, int n) {
    int left = 0;
    int right = list.length - 1;
    while (true) {
      if (left == right) return left;
      int pivotIndex = pivot(list, left, right);
      pivotIndex = partition(list, left, right, pivotIndex, n);
      if (n == pivotIndex) {
        return n;
      } else if (n < pivotIndex) {
        right = pivotIndex - 1;
      } else {
        left = pivotIndex + 1;
      }
    }
  }

  int partition<T extends Comparable<T>>(
      List<T> list, int left, int right, int pivotIndex, int n) {
    T pivotValue = list[pivotIndex];
    Collections().swap(list, pivotIndex, right);
    int storeIndex = left;

    for (int i = left; i < right; i++) {
      if (list[i].compareTo(pivotValue) < 0) {
        Collections().swap(list, storeIndex, i);
        storeIndex++;
      }
    }

    int storeIndexEq = storeIndex;

    for (int i = storeIndex; i < right; i++) {
      if (list[i].compareTo(pivotValue) == 0) {
        Collections().swap(list, storeIndexEq, i);
        storeIndexEq++;
      }
    }

    Collections().swap(list, right, storeIndexEq);

    return (n < storeIndex) ? storeIndex : min(n, storeIndexEq);
  }

  int pivot<T extends Comparable<T>>(List<T> list, int left, int right) {
    if (right - left < 5) {
      return partition5(list, left, right);
    }

    for (int i = left; i < right; i += 5) {
      int subRight = i + 4;
      if (subRight > right) {
        subRight = right;
      }
      int median5 = partition5(list, i, subRight);
      int rightIndex = left + (i - left) ~/ 5;
      Collections().swap(list, median5, rightIndex);
    }

    int mid = (right - left) ~/ 10 + left + 1;
    int rightIndex = left + (right - left) ~/ 5;
    return selectIndex(list, mid);
  }

  int partition5<T extends Comparable<T>>(List<T> list, int left, int right) {
    List<T> ts = list.sublist(left, right);
    ts.sort();
    return (left + right) >>> 1;
  }
}

class Collections {
  void swap(List nums, int a, int b) {
    int tmp = nums[a];
    nums[a] = nums[b];
    nums[b] = tmp;
  }
}

extension SubList on List {
  List sublist(int left, int right) {
    List natija = [];
    for (int i = left; i < right; i++) {
      natija.add(this[i]);
    }
    return natija;
  }
}
