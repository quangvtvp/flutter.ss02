import 'dart:io';

void main() {
  String input = "hoc bai";
  play(input);
}

void play(String input) {
  List<String> chars = input.split('');
  chars.shuffle();
  print("hãy sắp xếp lại các chữ cái trên thành chữ cái hoàn chỉnh :  $chars");
  stdout.write("nhập chữ cái bạn đoán: ");
  String? guess = stdin.readLineSync();
 while (guess != input) {
    stdout.write("bạn đoán sai rồi, hãy nhập lại: ");
    guess = stdin.readLineSync();
  }
  print("bạn đã đoán đúng");
}
