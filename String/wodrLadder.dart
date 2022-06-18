

void main(List<String> args) {
   String beginWord = "hit";
        String endWord = "cog";
        List<String> wordList=["hot", "dot", "dog", "lot", "log", "cog"];
        

      //print(WordLadder().ladderLength(beginWord, endWord, wordList));
}


// class WordLadder {

   

  
//    int ladderLength(String beginWord, String endWord, List<String> wordList) {
//         Set<String> set = new Set();
//         wordList.forEach((element) {set.add(element)});
        
//         if (!set.contains(endWord)) {
//             return 0;
//         }

//         List<String> queue = new LinkedList();
//         queue.offer(beginWord);
//         int level = 1;

//         while (!queue.isEmpty()) {
//             int size = queue.size();
//             for (int i = 0; i < size; i++) {
//                 String curr = queue.poll();
//                 char[] words_chars = curr.toCharArray();
//                 for (int j = 0; j < words_chars.length; j++) {
//                     char original_chars = words_chars[j];
//                     for (char c = 'a'; c <= 'z'; c++) {
//                         if (words_chars[j] == c) {
//                             continue;
//                         }
//                         words_chars[j] = c;
//                         String new_word = String.valueOf(words_chars);
//                         if (new_word.equals(endWord)) {
//                             return level + 1;
//                         }
//                         if (set.contains(new_word)) {
//                             set.remove(new_word);
//                             queue.offer(new_word);
//                         }
//                     }
//                     words_chars[j] = original_chars;
//                 }
//             }
//             level++;
//         }
//         return 0;
//     }
// }

// class Queue {
// }

