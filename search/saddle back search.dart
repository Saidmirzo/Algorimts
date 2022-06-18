


import 'dart:math';

void main(List<String> args) {
  
        List<List<int>> arr;
        int i, j, rows = 5, col = 5;
        arr = List.filled(rows, [0]);
      
        for (i = 0; i < rows; i++) {
            for (j = 0; j < col; j++) {
                arr[i][j] = j+5;
            }
        }
        int ele = 10;
        // we start from bottom left corner
        List<int> ans =SaddlebackSearch().find(arr, rows - 1, 0, ele);
       print("${ans[0]}  ${ans[1]}");
       
}
 class SaddlebackSearch {

   
     List<int> find(List<List<int>> arr, int row, int col, int key) {

        // array to store the answer row and column
        List<int> ans = [-1, -1];
        if (row < 0 || col >= arr[row].length) {
            return ans;
        }
        if (arr[row][col] == key) {
            ans[0] = row;
            ans[1] = col;
            return ans;
        } // if the current element is greater than the given element then we move up
        else if (arr[row][col] > key) {
            return find(arr, row - 1, col, key);
        }
        // else we move right
        return find(arr, row, col + 1, key);
    }
}