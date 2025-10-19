import 'dart:io';

int? getInNumBerFromKeyboard() {
  int? number;
  do {
    print("Nhap mot so nguyen duong:");
    number = int.tryParse(stdin.readLineSync()!);
    if (number == null || number < 0) {
      print("vui long nhap lai");
    }
  } while (number == null || number < 0);
  return number;
}

void main() {
  print('nhập vào 1 từ:');
  String word = stdin.readLineSync()!;
  var list = word.split('');
  list.shuffle();
  var shuffleWord = list.join();
  print(shuffleWord);
  print("nhập đáp án:");
  String answer;
  do {
    answer = stdin.readLineSync()!;
    if (answer.toLowerCase() == word.toLowerCase()) {
      print("đúng");
      break;
    } else {
      print("nhập lại đáp án:");
    }
  } while (answer.toLowerCase() != word.toLowerCase());
  return;
}
