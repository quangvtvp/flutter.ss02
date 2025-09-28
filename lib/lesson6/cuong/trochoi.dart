import 'dart:io';

void main() {
  String? input = "cuong";
  List<String> chars = input.split('');
  chars.shuffle();
  print("hãy sắp xếp lại các chữ cái trên thành chữ cái hoàn chỉnh: $chars");
  stdout.write("nhập chữ cái chính xác");
  String? guess = stdin.readLineSync();
  if (guess != null && guess.isNotEmpty) {
    if (guess == input) {
      print("chúc mừng bạn đã đoán đúng");
    } else {
      print("bạn đã đoán sai, chữ đúng là: $input");
    }
  }
}
