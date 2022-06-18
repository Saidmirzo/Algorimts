void main(List<String> args) {
  print( longestNonRepeativeSubstring.lengthOfLongestSubstring('qwertyqwertyuio'));
}

class longestNonRepeativeSubstring {
  static int lengthOfLongestSubstring(String s) {
    int max = 0, start = 0, i = 0;
    Map<String, int> map = {};

    while (i < s.length) {
      String temp = s[i];

      // adding key to map if not present
      if (!map.containsKey(temp))
        map[temp] = 0;

      // checking if the first value is the dublicate value
      else if (s[start] == temp)
        start++;

      // checking if the previous value is dublicate value
      else if (s[i - 1] == temp) {
        if (max < map.length) max = map.length;
        map.clear();
        start = i;
        i--;
      }

      // last possible place where dublicate value can be is between start and i
      else {
        if (max < map.length) max = map.length;
        while (s[start] != temp) {
          map.remove(s[start]);
          start++;
        }
        start++;
      }

      i++;
    }
    if (max < map.length) max = map.length;
    return max;
  }
}
