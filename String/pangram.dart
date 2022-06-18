void main(List<String> args) {}
// satrda barcha harflar ishlagan yoki ishlamaganini bildioradi
bool isPangram(String s) {
  List<bool> marked = List.filled(26, false);
  /* by default all letters don't exists */
  List<String> values = s.split('');
  values.forEach((element) {
    if (element.isLetter()) {
      int index = element.isUpperCase()
          ? element.codeUnitAt(0) - 'A'.codeUnitAt(0)
          : element.codeUnitAt(0) - 'a'.codeUnitAt(0);
      marked[index] = true;
      /* mark current character exists */
    }
  });
  for (int i = 0; i < 26; i++) {
    if (!marked[i]) return false;
  }
  return true;
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
