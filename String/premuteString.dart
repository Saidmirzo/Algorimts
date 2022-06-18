void main(List<String> args) {}
void generatePermutation(String str, int start, int end) {
  //Prints the permutations
  if (start == end - 1) {
    print(str);
  } else {
    for (int i = start; i < end; i++) {
      //Swapping the string by fixing a character
      str = swapString(str, start, i);
      //Recursively calling function generatePermutation() for rest of the characters
      generatePermutation(str, start + 1, end);
      //Backtracking and swapping the characters again.
      str = swapString(str, start, i);
    }
  }
}

String swapString(String s, int i, int j) {
  String a = s[i];
  s.replaceRange(i, 1, s[j]);
  s.replaceRange(j, 1, a);
  return s;
}
