void main(List<String> args) {
  print('Salom Assalom 123654'.toLowerCase());
}

String toLowerCase(String s) {
  for (int i = 0; i < s.length; ++i) {
    if (s[i].isLetter() && s.isUpperCase()) {
      s[i].replaceRange(0, 1, s[i].toLowerCase());
    }
  }
  return s;
}

extension IsLetter on String {
  bool isLetter() {
    if (this.toUpperCase().codeUnitAt(0) > 64 &&
        this.toUpperCase().codeUnitAt(0) < 91)
      return true;
    else
      return false;
  }

  bool isUpperCase() {
    if (this.codeUnitAt(0) > 64 && this.codeUnitAt(0) < 91)
      return true;
    else
      return false;
  }
}
