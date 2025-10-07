import 'dart:io';
void main() {
  String word = "toan";
  guessWord(word);
}

void guessWord(
  String word,
) {
  List<String> wordlist = word.split("");
  List<String> guessedList = [];
  for (var letter in wordlist) {
    guessedList.add("*");
  }
  print("Từ: ${guessedList.join()}");
  while (word != guessedList.join()) {
    stdout.write("Nhập chữ: ");
    var input = stdin.readLineSync() ?? "";
    input = input.toLowerCase();
    if (wordlist.contains(input)) {
      for (int i = 0; i < wordlist.length; i++) {
        if (wordlist[i] == input) {
          guessedList[i] = input;
        }
      }
      print("-----------------");
      print("Từ: ${guessedList.join()}");
    } else {
      print("-----------------");
      print("Từ: ${guessedList.join()}");
    }
  }
  print("Bạn đã đoán đúng!!");
}