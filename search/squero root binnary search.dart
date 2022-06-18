


import 'dart:math';

void main(List<String> args) {
 
        print("Enter a number you want to calculate square root of : ");
        int num = Random.secure().nextInt(10);
        int ans = SquareRootBinarySearch().squareRoot(num);
        print("The square root is :   $ans");
}

 class SquareRootBinarySearch {

      int squareRoot(int num) {
        if (num == 0 || num == 1) {
            return num;
        }
        int l = 1;
        int r = num;
        int ans = 0;
        while (l <= r) {
            int mid = l + (r - l) ~/ 2;
            if (mid == num / mid) {
                return mid;
            } else if (mid < num / mid) {
                ans = mid;
                l = mid + 1;
            } else {
                r = mid - 1;
            }
        }
        return ans;
    }
}