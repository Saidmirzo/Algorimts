void main(List<String> args) {
  String s = "123456798";
  print(s.encode(s, 3));
}

extension ZigZagPattern on String {
  Object encode(String s, int numRows) {
    if (numRows < 2 || s.length < numRows) return s;
    int start = 0, index = 0, height = 1, depth = numRows;
    List<String> zigZagedArray = List.filled(s.length, '', growable: false);
    while (depth != 0) {
      int pointer = start,
          height_space = 2 + ((height - 2) * 2),
          depth_space = 2 + ((depth - 2) * 2);
      bool man = true;
      while (pointer < s.length) {
        zigZagedArray[index++] = s[pointer];
        if (height_space == 0)
          pointer += depth_space;
        else if (depth_space == 0)
          pointer += height_space;
        else if (man) {
          pointer += depth_space;
          man = false;
        } else {
          pointer += height_space;
          man = true;
        }
      }
      height++;
      depth--;
      start++;
    }
    String natija = '';
    zigZagedArray.forEach((element) {
      natija += element;
    });
    return natija;
  }
}
