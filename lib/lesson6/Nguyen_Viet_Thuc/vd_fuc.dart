import 'dart:io';

void main() {
  String word = "hello";
  shuffleWord(word);
  guessWord(word);
}

void shuffleWord(String word) {
  List<String> wordlist = word.split("");
  wordlist.shuffle();
  String newword = wordlist.join();
  print("Từ đã được xáo trộn: $newword");
}

void guessWord(String word) {
  stdout.write("Nhập chữ: ");
  var input = stdin.readLineSync() ?? "";
  input = input.toLowerCase();
  while (input != word) {
    stdout.write("Bạn đã đoán sai vui lòng nhập lại: ");
    input = stdin.readLineSync() ?? "";
    input = input.toLowerCase();
  }
  print("Bạn đã đoán đúng!!");
}
