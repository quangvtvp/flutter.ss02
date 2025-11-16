import 'dart:io';

void main() {
  playUnvealgame('LAy');
}

void playUnvealgame(String word) {
  var revealed = List.filled(word.length, '*');
  var guessed = <String>{};
  while (revealed.contains('*')) {
    print('Từ hiện tại: ${revealed.join()}');
    stdout.write('Nhập một chữ cái: ');
    final input = stdin.readLineSync();
    if (input == null || input.trim().isEmpty) {
      print('Vui lòng nhập một chữ cái hợp lệ.');
      continue;
    }
    final guess = input.trim().toLowerCase();
    if (guess.length != 1) {
      print('Chỉ nhập 1 ký tự!');
      continue;
    }
    if (guessed.contains(guess)) {
      print('Bạn đã đoán chữ này rồi!');
      continue;
    }
    guessed.add(guess);
    bool found = false;
    for (int i = 0; i < word.length; i++) {
      if (word[i].toLowerCase() == guess) {
        revealed[i] = word[i];
        found = true;
      }
    }
    if (found) {
      print('Đúng rồi!');
    } else {
      print('Sai, thử lại!');
    }
  }
  print('Chúc mừng! Bạn đã đoán đúng từ: $word');
}
