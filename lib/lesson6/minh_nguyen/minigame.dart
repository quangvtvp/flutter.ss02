import 'dart:io';

void play(String word) {
  var list = word.split('');
  list.shuffle();
  var shuffleword = list.join('');
  print(shuffleword);
}

void main() {
  play('hoc bai');
  print('nhap vao tu ban doan:');
  String? guess;
  do {
    guess = stdin.readLineSync()!;
    if (guess != 'hoc bai') {
      print('doan lai nao');
    }
  } while (guess != 'hoc bai');
  print('chinh xac!');
}
