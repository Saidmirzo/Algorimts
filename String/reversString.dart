void main(List<String> args) {}
String reverse(String str) {
  if (str == null || str.isEmpty) {
    return str;
  }

  String value = str;
  String natija = '';
  for (int i = 0, j = str.length - 1; i < j; i++, j--) {
    natija += value[j];
  }
  return natija;
}
