import 'dart:io';

void play(String word) {
  var list = word.split('');
  list.shuffle();
  var shuffleword = list.join('');
  print(shuffleword);
  String? guess;
  do {
    print('nhap tu ban doan:');
    guess = stdin.readLineSync()!;
    if (guess != word) {
      print('doan lai nao');
    }
  } while (guess != word);
  print('chinh xac!');
}

void main() {
  List<String> words = [
    'choi game',
    'xem phim',
    'nghe nhac',
    'di choi',
    'doc truyen',
    'du lich',
    'chup anh',
    'an uong',
    'toan hoc',
    'van hoc',
  ];
  words.shuffle();
  play(words[0]);
}
