import 'dart:math';

void main(List<String> args) {
  List<int> arr = List.filled(10, 0);

  /* generate 10 random numbers from -50 to 49 */
  Random random = new Random();
  for (int i = 0; i < arr.length; ++i) {
    arr[i] = random.nextInt(100) - 50;
  }

  BucketSort().bucketSort(arr);
  print(arr);
  /* check array is sorted or not */
  for (int i = 0, limit = arr.length - 1; i < limit; ++i) {
    arr[i] <= arr[i + 1];
  }
}

class BucketSort {
  
  void bucketSort(List<int> arr) {
    /* get max value of arr */
    int maximum = max(arr);

    /* get min value of arr */
    int minimum = min(arr);

    /* number of buckets */
    int numberOfBuckets = maximum - minimum + 1;

    List<List<int>> buckets = [];

    /* init buckets */
    for (int i = 0; i < numberOfBuckets; ++i) {
      buckets.add([]);
    }

    /* store elements to buckets */
    for (int value in arr) {
      int hashs = hash(value, minimum, numberOfBuckets);
      buckets[hashs].add(value);
    }

    /* sort individual bucket */
    for (List<int> bucket in buckets) {
      bucket.sort();
    }

    /* concatenate buckets to origin array */
    int index = 0;
    for (List<int> bucket in buckets) {
      for (int value in bucket) {
        arr[index++] = value;
      }
    }
  }

  int hash(int elem, int min, int numberOfBucket) {
    return (elem - min) ~/ numberOfBucket;
  }

  int max(List<int> arr) {
    int max = arr[0];
    for (int value in arr) {
      if (value > max) {
        max = value;
      }
    }
    return max;
  }

  int min(List<int> arr) {
    int min = arr[0];
    for (int value in arr) {
      if (value < min) {
        min = value;
      }
    }
    return min;
  }
}
