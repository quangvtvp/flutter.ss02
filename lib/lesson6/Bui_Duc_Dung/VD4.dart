import 'dart:io';

void main() {
  var word = ['flutter', 'android', 'ios', 'dart', 'java', 'kotlin'];
  word.shuffle();
  for (var w in word) {
    play(w);
  }
}

void play(String word) {
  var a = word.split('');
  a.shuffle();
  var b = a.join();
  print(b);
  var ans = '';
  do {
    stdout.write('Nhập từ bán đoán: ');
    ans = stdin.readLineSync() ?? '';
    if (ans == word) {
      print('Chúc mừng bạn đã đoán đúng!');
    } else {
      print('Sai rồi!');
    }
  } while (ans != word);
}
