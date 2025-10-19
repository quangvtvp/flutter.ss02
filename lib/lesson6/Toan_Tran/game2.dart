import 'dart:io';
void main() {
  String answer = 'Tran Anh Toan';
  List<String> chars = answer.split('');
  List<String> display = List.generate(chars.length, (i) => chars[i] == ' ' ? ' ' : '*');
  int attempts = 5;
  List<String> guessed = [];
  print('Chào mừng đến với game đoán từ!');
  while (attempts > 0 && display.contains('*')) {
    print('Từ hiện tại: ${display.join()}');
    stdout.write('Nhập một chữ cái: ');
    String? input = stdin.readLineSync();
    if (input == null || input.length != 1) {
      print('Vui lòng nhập 1 ký tự!');
      continue;
    }
    String guess = input.toLowerCase();
    if (guessed.contains(guess)) {
      print('Bạn đã đoán chữ này rồi!');
      continue;
    }
    guessed.add(guess);
    bool found = false;
    for (int i = 0; i < chars.length; i++) {
      if (chars[i].toLowerCase() == guess) {
        display[i] = chars[i];
        found = true;
      }
    }
    if (found) {
      print('Đúng rồi!');
    } else {
      attempts--;
      print('Sai! Bạn còn $attempts lần đoán.');
    }
  }
  if (!display.contains('*')) {
    print('Chúc mừng! Bạn đã đoán đúng: ${answer}');
  } else {
    print('Bạn đã thua! Đáp án là: ${answer}');
  }
}
