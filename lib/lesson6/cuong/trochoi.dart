import 'dart:io';

void main() {
  List<String> words = ["hoc bai", "an com", "choi game", "di ngu"];
  List<String> word = words..shuffle();
  for (var i = 0; i < word.length; i++) {
    play(word[i]);
  }
}

void play(String input) {
  List<String> chars = input.split('');
  chars.shuffle();
  print("Hãy sắp xếp lại các chữ cái để thành từ đúng: $chars");
  stdout.write("Nhập chữ bạn đoán: ");
  String? guess = stdin.readLineSync();
  var i = 0;
  while (guess == null) {
    stdout.write("Vui lòng nhập chữ bạn đoán: ");
    guess = stdin.readLineSync();
  }
  if (guess.toLowerCase() == input) {
    i = i + 20;
    print("Chính xác! bạn được thêm $i điểm");
  } else {
    print("Sai rồi! Đáp án đúng là: $input");
  }
  print("Tổng điểm của bạn là: $i");
}
