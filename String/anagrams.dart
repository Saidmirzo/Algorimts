void main(List<String> args) {}

bool approach1(String s, String t) {
  bool teng = true;
  if (s.length == t.length) {
    List a = s.split('').toList();
    List b = t.split('').toList();
    a.sort();
    b.sort();

    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        teng = false;
        break;
      }
    }
  } else
    teng = true;
  return teng;
}

bool approach2(String a, String b) {
        if (a.length != b.length) {
            return false;
        } else {
            List<int> m=List.filled(26,0);
            List<int> n=List.filled(26,0);
            a.codeUnits.forEach((element) {
              m[element-"a".codeUnitAt(0)]++;
            });
            a.codeUnits.forEach((element) {
              n[element-"a".codeUnitAt(0)]++;
            });
           
            for (int i = 0; i < 26; i++) {
                if (m[i] != n[i]) {
                    return false;
                }
            }
            return true;
        }
    }

