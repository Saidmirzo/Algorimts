void main(List<String> args) {}

extension IsAlphabetical on String {
  isAlbhabetical(String s) {
    bool alphabet = false;
    s = s.toLowerCase();
    for (int i = 0; i < s.length; i++) {
      if ((s[i].codeUnitAt(0) > 96 && s[i].codeUnitAt(0) < 123 ) && (s[i].codeUnitAt(0) < s[i+1].codeUnitAt(0)) ) {
        alphabet = true;
      } else {
        alphabet = false;
        return false;
      }
      return true;
    }
  }
}
