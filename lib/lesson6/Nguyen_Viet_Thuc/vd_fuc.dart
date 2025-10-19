import 'dart:io';

void main() {
  List<String> words = [
    "hello",
    "world",
    "dart",
    "flutter",
    "skibidi",
    "bruh",
  ];
  words.shuffle();
  String word = words.first;
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
