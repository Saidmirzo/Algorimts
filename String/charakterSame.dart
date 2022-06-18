void main(List<String> args) {}

bool isAllCharactersSame(String s) {
  for (int i = 1; i < s.length; ++i) {
    if (s[i] != s[0]) {
      return false;
    }
  }
  return true;
}
