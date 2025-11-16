import 'dart:io';

import 'dart:math';

void main() {
  List<String> words = ['cat', 'dog', 'bird', 'fish'];
  var random = Random();

  var word = words[random.nextInt(words.length)];
  play(word);
}

void play(String word) {
  var ListCharacter = word.split('');
  ListCharacter.shuffle();
  var newWord = ListCharacter.join();
  print('Từ đảo $newWord');
  stdout.write('Nhập từ bạn đoán: ');
  var answer = stdin.readLineSync();
  if (answer != null && answer.toLowerCase() == word.toLowerCase()) {
    print('Bạn đã đoán đúng');
  } else {
    print('Bạn đã đoán sai, đáp án đúng là $word');
  }
}
